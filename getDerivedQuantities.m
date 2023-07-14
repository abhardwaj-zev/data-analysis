function [varTable,dat2] = getDerivedQuantities(varTable,dat1,dataSource,OtherInputData,Quantities)   
    HVBtHighLevelTemps = Quantities(1);
    HVBt2HighLevelTemps = Quantities(2);
    EberHtr = Quantities(3);
    WebastoHtr = Quantities(4);
    MotorFlowSwitch = Quantities(5);

    % all indexes have -1 subtraction because of how varTable works
    if(strcmp(dataSource,'vcg')||strcmp(dataSource,'vcg_fleetManager'))      % VCG
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'VCU_HVBtMod1Temp1'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'VCU_HVBtMod9Temp2'))-1;

        indexflag_hvPTCcurr=find(strcmp(varTable(:,2),'HV_PTC_HV_DC_Curr (amps)'))-1;
        indexflag_hvhcurr=find(strcmp(varTable(:,2),'HVH_Current_Consumption (Units)'))-1;
        indexflag_hvbtVltg=find(strcmp(varTable(:,2),'HUD_HvBtVltg'))-1;
        indexflag_SATemp=find(strcmp(varTable(:,2),'HVAC_SATemp (deg C)'))-1;
        indexflag_SBTemp=find(strcmp(varTable(:,2),'HVAC_SBTemp (deg C)'))-1;

        indexflag_MtrTemp=find(strcmp(varTable(:,2),'Invr_MtrTemp'))-1;
        indexflag_OilTemp=find(strcmp(varTable(:,2),'Invr_OilTemp'))-1;
    elseif(strcmp(dataSource,'raptor'))                % Raptor
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'HVBt_Mod1Temp1'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'HVBt_Mod9Temp2'))-1;

        indexflag_hvPTCcurr=find(strcmp(varTable(:,2),'HV_PTC_HV_DC_Curr (amps)'))-1;
        indexflag_hvhcurr=find(strcmp(varTable(:,2),'HVH_Current_Consumption (Units)'))-1;
        indexflag_hvbtVltg=find(strcmp(varTable(:,2),'HUD_HvBtVltg'))-1;
        indexflag_SATemp=find(strcmp(varTable(:,2),'HVAC_SATemp (deg C)'))-1;
        indexflag_SBTemp=find(strcmp(varTable(:,2),'HVAC_SBTemp (deg C)'))-1;
    elseif(strcmp(dataSource,'raptor_brightview'))                % Raptor
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'HVBt_Mod1Temp1'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'HVBt_Mod9Temp2'))-1;
        indexflag_batt2modbeg=find(strcmp(varTable(:,2),'HVBt2_Mod1Temp1'))-1;
        indexflag_batt2modend=find(strcmp(varTable(:,2),'HVBt2_Mod9Temp2'))-1;

        indexflag_hvPTCcurr=find(strcmp(varTable(:,2),'HV_PTC_HV_DC_Curr (amps)'))-1;
        indexflag_hvhcurr=find(strcmp(varTable(:,2),'HVH_Current_Consumption (Units)'))-1;
        indexflag_hvbtVltg=find(strcmp(varTable(:,2),'HUD_HvBtVltg'))-1;
        indexflag_SATemp=find(strcmp(varTable(:,2),'HVAC_SATemp (deg C)'))-1;
        indexflag_SBTemp=find(strcmp(varTable(:,2),'HVAC_SBTemp (deg C)'))-1;   
        
        indexflag_SGTemp=find(strcmp(varTable(:,2),'HVAC_SGTemp (deg C)'))-1;
        indexflag_SHTemp=find(strcmp(varTable(:,2),'HVAC_SHTemp (deg C)'))-1;
        indexflag_SITemp=find(strcmp(varTable(:,2),'HVAC_SITemp (deg C)'))-1;
        indexflag_MtrTemp=find(strcmp(varTable(:,2),'Invr_MtrTemp (degC)'))-1;
        indexflag_OilTemp=find(strcmp(varTable(:,2),'Invr_OilTemp (degC)'))-1;
    elseif(strcmp(dataSource,'raptor_v5_1'))                % Raptor
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'HVBt_Mod1Temp1 (deg C)'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'HVBt_Mod9Temp2 (deg C)'))-1;
    end   

    %%  hvbtHighLevelTempsProcessing
    if(HVBtHighLevelTemps & indexflag_battmodbeg && indexflag_battmodend)
        BattMod_Temp_Average = mean([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],2,'omitnan');
        BattMod_Temp_Max = max([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],[],2,'omitnan');
        BattMod_Temp_Min = min([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],[],2,'omitnan');
        dat2 = [dat1(:,1) array2table(BattMod_Temp_Average) array2table(BattMod_Temp_Max) array2table(BattMod_Temp_Min)];
        varTable (1000 + 1,:) = [{1000} {'BattMod_Temp_Average (degC)'}];
        varTable (1000 + 2,:) = [{1000 + 1} {'BattMod_Temp_Max (degC)'}];
        varTable (1000 + 3,:) = [{1000 + 2} {'BattMod_Temp_Min (degC)'}]; 
    end
    
    n=size(dat1,1);

    if(size(dat2,2)~=4)
        dat2 = zeros(n,3);
    end

    %% Eberspaecher Heater Power Calculation
    if(EberHtr & indexflag_hvPTCcurr & indexflag_hvbtVltg)    
        % Heater Input Inst. Electrical Power
        HV_PTC_InstPower = (dat1{:,indexflag_hvPTCcurr}.*dat1{:,indexflag_hvbtVltg})/1000;          % inst power in kW
           
        dat2 = [dat2 array2table(HV_PTC_InstPower)];
        varTable (1000 + 4,:) = [{1000 + 3} {'HV PTC Inst Electrical Power Draw (kW)'}];

        % Heater Output Inst. Thermal Power
        Vdot = OtherInputData(1);
        Vdot = Vdot/1000/60;                % LPM to m3/s
        rho_coolant = 1048;                 % in kg/m3
        Cp_coolant = 3.59;                  % kJ/kg C
        mdot = rho_coolant*Vdot;                % kg/s
        SATemp = dat1{:,indexflag_SATemp};      % in degC
        SBTemp = dat1{:,indexflag_SBTemp};      % in degC
        Qdot = mdot*Cp_coolant*(SBTemp-SATemp);         % kg/s * kJ/kg C * C = kJ/s = kW
        dat2 = [dat2 array2table(Qdot)];
        varTable (1000 + 5,:) = [{1000 + 4} {'HV PTC Inst Thermal Power In (kW)'}];

        % Heater Input Avg Power    
        dt = diff(dat1{:,1});                       % dt array in minutes
        dt = [dt;dt(end)];                          % setting last dt equal to second last dt
        dt = dt/60;                                 % dt in hour
        
        NNZ_instPower_I=find(HV_PTC_InstPower);
        firstNNZ_I = NNZ_instPower_I(1);
        lastNNZ_I = NNZ_instPower_I(end);
        t_req = sum(dt(firstNNZ_I:lastNNZ_I));          % total time  in battery heating mode
        t_heat =  sum(dt(find(HV_PTC_InstPower)));
        true_duty_cycle = t_heat/t_req*100;
        
        HV_PTC_NetEnergyIn = sum(HV_PTC_InstPower.*dt);
        HV_PTC_AvgPower = HV_PTC_NetEnergyIn/t_req;             % converted to kWh
        fprintf("HV_PTC Net Electrical Energy In : %f kWh \n",HV_PTC_NetEnergyIn);
        fprintf("HV_PTC Avg Electrical Power In : %f kW \n",HV_PTC_AvgPower);
        fprintf("HV_PTC True Duty Cycle : %f %% \n\n",true_duty_cycle);
        
        % Heater Thermal Output Avg Power
        dt = (dat1{2,1}-dat1{1,1})*60;              %  getting deltat in min and converting to sec
        t_req = nnz(Qdot)*dt;
        Q = sum(nonzeros(Qdot)*dt);
        Qdot_avg = Q/t_req;
        fprintf("HV_PTC Net Thermal Energy In : %f kWh \n",Q/(60*60));
        fprintf("HV_PTC Avg Thermal Power In : %f kW \n \n",Qdot_avg);

        eta_energy = Q/HV_PTC_NetEnergyIn;
        eta_power = Qdot_avg/HV_PTC_AvgPower;
        fprintf("HV_PTC Energy Efficiency : %f \n",eta_energy);
        fprintf("HV_PTC Power Efficiency : %f \n \n",eta_power);
    end
    %% Webasto Heater Power Calculation
    if(WebastoHtr & indexflag_hvhcurr & indexflag_hvbtVltg)    
        % Webasto Heater Input Inst. Electrical Power
        HVH_InstPower = (dat1{:,indexflag_hvhcurr}.*dat1{:,indexflag_hvbtVltg})/1000;          % inst power in kW
           
        dat2 = [dat2 array2table(HVH_InstPower)];
        varTable (1000 + 4,:) = [{1000 + 3} {'Webasto HVH Inst Electrical Power Draw (kW)'}];

        % Heater Output Inst. Thermal Power
        Vdot = OtherInputData(1);
        fprintf("\n\n");
        Vdot = Vdot/1000/60;                % LPM to m3/s
        rho_coolant = 1048;                 % in kg/m3
        Cp_coolant = 3.59;                  % kJ/kg C
        mdot = rho_coolant*Vdot;                % kg/s
        SATemp = dat1{:,indexflag_SATemp};      % in degC
        SBTemp = dat1{:,indexflag_SBTemp};      % in degC
        Qdot = mdot*Cp_coolant*(SBTemp-SATemp);         % kg/s * kJ/kg C * C = kJ/s = kW
        dat2 = [dat2 array2table(Qdot)];
        varTable (1000 + 5,:) = [{1000 + 4} {'Webasto HVH Inst Thermal Power In (kW)'}];

        % Heater Input Avg Power
        dt = diff(dat1{:,1});                       % dt array in minutes
        dt = [dt;dt(end)];                          % setting last dt equal to second last dt
        dt = dt/60;                                 % dt in hour
        
        NNZ_instPower_I=find(HVH_InstPower);
        firstNNZ_I = NNZ_instPower_I(1);
        lastNNZ_I = NNZ_instPower_I(end);
        t_req = sum(dt(firstNNZ_I:lastNNZ_I));          % total time  in battery heating mode
        t_heat =  sum(dt(find(HVH_InstPower)));
        true_duty_cycle = t_heat/t_req*100;
        
        HVH_NetEnergyIn = sum(HVH_InstPower.*dt);
        HVH_AvgPower = HVH_NetEnergyIn/t_req;             % converted to kWh
        fprintf("HVH Net Electrical Energy In : %f kWh \n",HVH_NetEnergyIn);
        fprintf("HVH Avg Electrical Power In : %f kW \n",HVH_AvgPower);
        fprintf("HVH True Duty Cycle : %f %% \n\n",true_duty_cycle);
        
        % Heater Thermal Output Avg Power
        dt = (dat1{2,1}-dat1{1,1})*60;              %  getting deltat in min and converting to sec
        t_req = nnz(Qdot)*dt;
        Q = sum(nonzeros(Qdot)*dt);
        Qdot_avg = Q/t_req;
        fprintf("IGNORE Webasto HVH Net Thermal Energy In : %f kWh \n",Q/(60*60));
        fprintf("IGNORE Webasto HVH Avg Thermal Power In : %f kW \n \n",Qdot_avg);

        eta_energy = Q/HVH_NetEnergyIn;
        eta_power = Qdot_avg/HVH_AvgPower;
        fprintf("IGNORE Webasto HVH Energy Efficiency : %f \n",eta_energy);
        fprintf("IGNORE Webasto HVH Power Efficiency : %f \n \n",eta_power);
    end
    if(size(dat2,2)~=6)
        dat2 = [dat2 array2table(zeros(n,2))];
    end
    %%  hvbt2HighLevelTempsProcessing
    if(HVBt2HighLevelTemps & indexflag_batt2modbeg & indexflag_batt2modend)
        Batt2Mod_Temp_Average = mean([dat1{:,indexflag_batt2modbeg:indexflag_batt2modend}],2,'omitnan');
        Batt2Mod_Temp_Max = max([dat1{:,indexflag_batt2modbeg:indexflag_batt2modend}],[],2,'omitnan');
        Batt2Mod_Temp_Min = min([dat1{:,indexflag_batt2modbeg:indexflag_batt2modend}],[],2,'omitnan');
        dat2 = [dat2 array2table(Batt2Mod_Temp_Average) array2table(Batt2Mod_Temp_Max) array2table(Batt2Mod_Temp_Min)];
        varTable (1000 + 6,:) = [{1000 + 5} {'Batt2Mod_Temp_Average (degC)'}];
        varTable (1000 + 7,:) = [{1000 + 6} {'Batt2Mod_Temp_Max (degC)'}];
        varTable (1000 + 8,:) = [{1000 + 7} {'Batt2Mod_Temp_Min (degC)'}]; 
    end
%     if(size(dat2,2)~=9)
%         dat2 = [dat2 array2table(zeros(n,3))];
%     end
    %% Rate of change of Temperature
    if(MotorFlowSwitch)
%         SGTemp = dat1{:,indexflag_SGTemp};      % in degC
%         SHTemp = dat1{:,indexflag_SHTemp};      % in degC
%         SITemp = dat1{:,indexflag_SITemp};      % in degC
        MtrTemp = dat1{:,indexflag_MtrTemp};      % in degC
        OilTemp = dat1{:,indexflag_OilTemp};      % in degC
        t = table2array(dat1(:,1));                % in min

%         t = t*(1000*60);                            % in ms
        
        P = polyfit (t,MtrTemp,4);
        MtrTempFitted = polyval(P,t);
        P = polyfit (t,OilTemp,4);
        OilTempFitted = polyval(P,t);

%         dMtrTempdt = [0;diff(MtrTempFitted)./diff(t)];
%         dOilTempdt = [0;diff(OilTempFitted)./diff(t)];

        dMtrTempdt = [0;diff(MtrTemp)./diff(t)];
        dOilTempdt = [0;diff(OilTemp)./diff(t)];
        
        tlast = t(1);
        sum1 = 0;
        sum2 = 0;
        
        i=1;
        j = 1;
        t_MvngAvg (j) = t(i);
        dMtrTempdt_MvngAvg (j) = dMtrTempdt(i);
        dOilTempdt_MvngAvg (j) = dOilTempdt(i);

        while (i<=length(dMtrTempdt))
            ilast = i;
            while (i<=length(t) && (t(i)-t_MvngAvg(j))<3)         % in min
                if(~isnan(dMtrTempdt(i)))
                    sum1 = sum1 + dMtrTempdt(i);
                end
                if(~isnan(dOilTempdt(i)))
                    sum2 = sum2 + dOilTempdt(i);
                end
                i=i+1;
            end
            t_MvngAvg (j+1) = t(i-1);
            dMtrTempdt_MvngAvg (j+1) = sum1;
            dOilTempdt_MvngAvg (j+1) = sum2;
            j=j+1;
        end
        
        t_MvngAvg (end) = [];
        dMtrTempdt_MvngAvg (end) = [];
        dOilTempdt_MvngAvg (end) = [];


        dat2 = [dat2 array2table(dMtrTempdt) array2table(dOilTempdt) array2table(MtrTempFitted) array2table(OilTempFitted)];
        varTable (1000 + 9,:) = [{1000 + 8} {'Time Derivative of Motor Temp'}];
        varTable (1000 + 10,:) = [{1000 + 9} {'Time Derivative of Oil Temp'}];
        varTable (1000 + 11,:) = [{1000 + 10} {'Motor Temp Fitted'}];
        varTable (1000 + 12,:) = [{1000 + 11} {'Oil Temp Fitted'}];
    end
%     if(size(dat2,2)~=13)            % 13 = 9 + 4, 4 variables addes to varTable in this if-block
%         dat2 = [dat2 array2table(zeros(n,2))];
%     end    
end
