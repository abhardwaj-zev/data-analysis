function [varTable,dat2] = getDerivedQuantities(varTable,dat1,dataSource,OtherInputData,Quantities)   
    HVBtHighLevelTemps = Quantities(1);
    HVBt2HighLevelTemps = Quantities(2);
    EberHtr = Quantities(3);
    WebastoHtr = Quantities(4);
    MotorFlowSwitch = Quantities(5);
    ModuleHeatCapacityFromEnergyBalance = Quantities(6);
    PackHeatGen = Quantities(7);
    HVBt3HighLevelTemps = Quantities(8);
    HVBt4HighLevelTemps = Quantities(9);
    BatteryCoolingEffect = Quantities(10); 
    BatteryTempDiagnostic = Quantities(11);
    BBTemps = Quantities(12);
    ELCoolingEffect = Quantities(13);

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

        indexflag_CTBI=find(strcmp(varTable(:,2),'HVAC_CTBI (deg C)'))-1;
        indexflag_SCTemp=find(strcmp(varTable(:,2),'HVAC_SCTemp (deg C)'))-1;
    elseif(strcmp(dataSource,'raptor_CAFU'))                % Raptor
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'HVBt_Mod1Temp1'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'HVBt_Mod9Temp2'))-1;
        indexflag_batt2modbeg=find(strcmp(varTable(:,2),'HVBt2_Mod1Temp1'))-1;
        indexflag_batt2modend=find(strcmp(varTable(:,2),'HVBt2_Mod9Temp2'))-1;
        indexflag_batt3modbeg=find(strcmp(varTable(:,2),'HVBt3_Mod1Temp1'))-1;
        indexflag_batt3modend=find(strcmp(varTable(:,2),'HVBt3_Mod9Temp2'))-1;
        indexflag_batt4modbeg=find(strcmp(varTable(:,2),'HVBt4_Mod1Temp1'))-1;
        indexflag_batt4modend=find(strcmp(varTable(:,2),'HVBt4_Mod9Temp2'))-1;

        indexflag_CTBI=find(strcmp(varTable(:,2),'TMS_CTBI'))-1;
        indexflag_BattOutTemp=find(strcmp(varTable(:,2),'TMS_D1'))-1;

        indexflag_HVBtTMSMd=find(strcmp(varTable(:,2),'TMS_HVBtTMSMdMes'))-1;

        indexflag_CTDI = find(strcmp(varTable(:,2),'TMS_CTDI'))-1;
        indexflag_CTBBI = find(strcmp(varTable(:,2),'TMS_CTBBI'))-1;
        indexflag_CTBB2I = find(strcmp(varTable(:,2),'TMS_CTBB2I'))-1;
        indexflag_CTBB4I = find(strcmp(varTable(:,2),'TMS_CTBB4I'))-1;

        indexflag_BB2OutTemp = find(strcmp(varTable(:,2),'TMS_D2'))-1;
        indexflag_BB4OutTemp = find(strcmp(varTable(:,2),'TMS_D3'))-1;

        indexflag_RptTempIn1 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin1'))-1;
        indexflag_RptTempOut1 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout1'))-1;

        indexflag_RptTempIn2 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin2'))-1;
        indexflag_RptTempOut2 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout2'))-1;

        indexflag_RptTempIn3 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin3'))-1;
        indexflag_RptTempOut3 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout3'))-1;

        indexflag_RptTempIn4 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin4'))-1;
        indexflag_RptTempOut4 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout4'))-1;

        indexflag_DCTemp1 = find(strcmp(varTable(:,2),'Report_DCTemp1'))-1;
        indexflag_DCTemp2 = find(strcmp(varTable(:,2),'Report_DCTemp2'))-1;    
        indexflag_DCTemp3 = find(strcmp(varTable(:,2),'Report_DCTemp3'))-1;    
        indexflag_DCTemp4 = find(strcmp(varTable(:,2),'Report_DCTemp4'))-1;  

        indexflag_ELTMSMd = find(strcmp(varTable(:,2),'TMS_ELTMSMdMes'))-1;  
    elseif(strcmp(dataSource,'portal_CAFU'))                % Portal
        indexflag_battmodbeg=find(strcmp(varTable(:,2),'BMS1_Mod1_Temp1'))-1;
        indexflag_battmodend=find(strcmp(varTable(:,2),'BMS1_Mod9_Temp2'))-1;
        indexflag_batt2modbeg=find(strcmp(varTable(:,2),'BMS2_Mod1_Temp1'))-1;
        indexflag_batt2modend=find(strcmp(varTable(:,2),'BMS2_Mod9_Temp2'))-1;
        indexflag_batt3modbeg=find(strcmp(varTable(:,2),'BMS3_Mod1_Temp1'))-1;
        indexflag_batt3modend=find(strcmp(varTable(:,2),'BMS3_Mod9_Temp2'))-1;
        indexflag_batt4modbeg=find(strcmp(varTable(:,2),'BMS4_Mod1_Temp1'))-1;
        indexflag_batt4modend=find(strcmp(varTable(:,2),'BMS4_Mod9_Temp2'))-1;

        indexflag_CTBI=find(strcmp(varTable(:,2),'BMS1_Aux_Temp1'))-1;
        indexflag_BattOutTemp=find(strcmp(varTable(:,2),'VCU_TMSD1Temp'))-1;

        indexflag_HVBtTMSMd=find(strcmp(varTable(:,2),'TMS_VCU_HVBtTMSMdMes'))-1;

        indexflag_CTDI = find(strcmp(varTable(:,2),'BMS1_Aux_Temp2'))-1;
        indexflag_CTBBI = find(strcmp(varTable(:,2),'BMS1_Aux_Temp7'))-1;
        indexflag_CTBB2I = find(strcmp(varTable(:,2),'BMS1_Aux_Temp3'))-1;
        indexflag_CTBB4I = find(strcmp(varTable(:,2),'BMS1_Aux_Temp4'))-1;

        indexflag_BB2OutTemp = find(strcmp(varTable(:,2),'VCU_TMSD2Temp'))-1;
        indexflag_BB4OutTemp = find(strcmp(varTable(:,2),'VCU_TMSD3Temp'))-1;

        indexflag_RptTempIn1 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin1'))-1;
        indexflag_RptTempOut1 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout1'))-1;

        indexflag_RptTempIn2 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin2'))-1;
        indexflag_RptTempOut2 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout2'))-1;

        indexflag_RptTempIn3 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin3'))-1;
        indexflag_RptTempOut3 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout3'))-1;

        indexflag_RptTempIn4 = find(strcmp(varTable(:,2),'Rpt_Temp_waterin4'))-1;
        indexflag_RptTempOut4 = find(strcmp(varTable(:,2),'Rpt_Temp_waterout4'))-1;

        indexflag_DCTemp1 = find(strcmp(varTable(:,2),'Report_DCTemp1'))-1;
        indexflag_DCTemp2 = find(strcmp(varTable(:,2),'Report_DCTemp2'))-1;    
        indexflag_DCTemp3 = find(strcmp(varTable(:,2),'Report_DCTemp3'))-1;    
        indexflag_DCTemp4 = find(strcmp(varTable(:,2),'Report_DCTemp4'))-1;  

        indexflag_ELTMSMd = find(strcmp(varTable(:,2),'TMS_VCU_ELTMSMdMes'))-1;  
    end   

    %%
    dat2 = [array2table(dat1{:,1},'VariableNames',{'Timestamp (min)'})];

    %%  hvbtHighLevelTempsProcessing
    if(HVBtHighLevelTemps & indexflag_battmodbeg & indexflag_battmodend)
        BattMod_Temp_Average = mean([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],2,'omitnan');
        BattMod_Temp_Max = max([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],[],2,'omitnan');
        BattMod_Temp_Min = min([dat1{:,indexflag_battmodbeg:indexflag_battmodend}],[],2,'omitnan');
        dat2 = [dat2 array2table(BattMod_Temp_Average) array2table(BattMod_Temp_Max) array2table(BattMod_Temp_Min)];
        varTable (1000 + 1,:) = [{1000} {'BattMod_Temp_Average (degC)'}];
        varTable (1000 + 2,:) = [{1000 + 1} {'BattMod_Temp_Max (degC)'}];
        varTable (1000 + 3,:) = [{1000 + 2} {'BattMod_Temp_Min (degC)'}]; 
    end
    
    n=size(dat1,1);

    if(size(dat2,2)~=4)
        dat2 = [dat2 array2table(zeros(n,3),'VariableNames',{'BattMod_Temp_Average (degC) - MISSING','BattMod_Temp_Max (degC)  - MISSING','BattMod_Temp_Min (degC)  - MISSING'})];
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
        t_heat =  sum(dt(NNZ_instPower_I));
        true_duty_cycle = t_heat/t_req*100;
        
        HV_PTC_NetEnergyIn = sum(HV_PTC_InstPower.*dt);
        HV_PTC_AvgPower = HV_PTC_NetEnergyIn/t_req;             % converted to kWh
        fprintf("HV_PTC Net Electrical Energy In : %f kWh \n",HV_PTC_NetEnergyIn);
        fprintf("HV_PTC Avg Electrical Power In : %f kW \n",HV_PTC_AvgPower);
        fprintf("HV_PTC True Duty Cycle : %f %% \n\n",true_duty_cycle);
        
        % Heater Thermal Output Avg Power
        dt = (dat1{2,1}-dat1{1,1})*60;              %  getting deltat in min and converting to sec
        HeatReqOn = find(dat1{:,42});
        t_req = nnz(Qdot(HeatReqOn))*dt;
        Q = sum(nonzeros(Qdot(HeatReqOn))*dt);                 % in kWs        
        Qdot_avg = Q/t_req;                         % power in kW
        Q = Q/(3600);                               % energy in kWh
        fprintf("HV_PTC Net Thermal Energy In : %f kWh \n",Q);
        fprintf("HV_PTC Avg Thermal Power In : %f kW \n \n",Qdot_avg);

        eta_energy = Q/HV_PTC_NetEnergyIn;
        eta_power = Qdot_avg/HV_PTC_AvgPower;
        fprintf("HV_PTC Energy Efficiency : %f \n",eta_energy);
        fprintf("HV_PTC Power Efficiency : %f \n \n",eta_power);
    end
    if(size(dat2,2)~=6)
        dat2 = [dat2 array2table(zeros(n,2),'VariableNames',{'HVH Inst Electrical Power Draw (kW) - MISSING','HVH Inst Thermal Power In (kW)  - MISSING'})];
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
        dat2 = [dat2 array2table(zeros(n,2),'VariableNames',{'HVH Inst Electrical Power Draw (kW) - MISSING','HVH Inst Thermal Power In (kW)  - MISSING'})];
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
    if(size(dat2,2)~=9)
        dat2 = [dat2 array2table(zeros(n,3),'VariableNames',{'Batt2Mod_Temp_Average (degC) - MISSING','Batt2Mod_Temp_Max (degC)  - MISSING','Batt2Mod_Temp_Min (degC) - MISSING'})];
    end
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
    if(size(dat2,2)~=13)            % 13 = 9 + 4, 4 variables addes to varTable in this if-block
        dat2 = [dat2 array2table(zeros(n,4),'VariableNames',{'Time Derivative of Motor Temp - MISSING','Time Derivative of Oil Temp  - MISSING','Motor Temp Fitted - MISSING','Oil Temp Fitted - MISSING'})];
    end    
    %% Module Heat Capacity From Energy Balance - First Implemented on Demo 8 v5.1-Test Data
    if(ModuleHeatCapacityFromEnergyBalance)
    
        t = table2array(dat1(:,1));                % in min
        t_sec = t*60;                                  % in seconds
        SCTemp = dat1{:,indexflag_SCTemp};
        CTBI = dat1{:,indexflag_CTBI};

        BattMod1_3_Temp_Average = mean([dat1{:,indexflag_battmodbeg:indexflag_battmodbeg+2}],2,'omitnan');
        BattMod4_6_Temp_Average = mean([dat1{:,indexflag_battmodbeg+3:indexflag_battmodbeg+5}],2,'omitnan');
        
        BattMod1_6_Temp_Average = mean([dat1{:,indexflag_battmodbeg:indexflag_battmodbeg+5}],2,'omitnan');
        BattMod1_6_Temp_Max = max([dat1{:,indexflag_battmodbeg:indexflag_battmodbeg+5}],[],2,'omitnan');
        BattMod1_6_Temp_Min = min([dat1{:,indexflag_battmodbeg:indexflag_battmodbeg+5}],[],2,'omitnan');

        BattMod7_9_Temp_Average = mean([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],2,'omitnan');
        BattMod7_9_Temp_Max = max([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],[],2,'omitnan');
        BattMod7_9_Temp_Min = min([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],[],2,'omitnan');

        dat2 = [dat2 array2table(BattMod1_3_Temp_Average) array2table(BattMod4_6_Temp_Average) array2table(BattMod1_6_Temp_Average) array2table(BattMod1_6_Temp_Max) array2table(BattMod1_6_Temp_Min)];
        varTable (1000 + 13,:) = [{1000 + 12} {'BattMod1_3_Temp_Average (degC)'}];
        varTable (1000 + 14,:) = [{1000 + 13} {'BattMod4_6_Temp_Average (degC)'}];
        varTable (1000 + 15,:) = [{1000 + 14} {'BattMod1_6_Temp_Average (degC)'}];
        varTable (1000 + 16,:) = [{1000 + 15} {'BattMod1_6_Temp_Max (degC)'}];
        varTable (1000 + 17,:) = [{1000 + 16} {'BattMod1_6_Temp_Min (degC)'}];
        
        dat2 = [dat2 array2table(BattMod7_9_Temp_Average) array2table(BattMod7_9_Temp_Max) array2table(BattMod7_9_Temp_Min)];
        varTable (1000 + 18,:) = [{1000 + 17} {'BattMod7_9_Temp_Average (degC)'}];
        varTable (1000 + 19,:) = [{1000 + 18} {'BattMod7_9_Temp_Max (degC)'}];
        varTable (1000 + 20,:) = [{1000 + 19} {'BattMod7_9_Temp_Min (degC)'}];
    
        Vdot_Coolant_ZEUS = 3.385;           % in LPM, mean of 3.35-3.42 LPM
        Vdot_Coolant_ZEUS = Vdot_Coolant_ZEUS/1000/60;        % in m3/s
        rho_Coolant_30C = 1066;                 % in kg/m3
        mdot_Coolant = rho_Coolant_30C*Vdot_Coolant_ZEUS;         % in kg/s
        Cp_Coolant_30C = 3.50;                              % in kJ/kg K
        DeltaT_CoolantInOut = SCTemp - CTBI;
        Qdot_CoolantInOut = mdot_Coolant*Cp_Coolant_30C*DeltaT_CoolantInOut;        % in kW

        dat2 = [dat2 array2table(Qdot_CoolantInOut)];
        varTable (1000 + 21,:) = [{1000 + 20} {'Qdot_CoolantInOut (kW)'}];  
        
        


        P = polyfit (t,BattMod1_6_Temp_Average(:,1),4);
        BattMod1_6_Temp_Average_Fitted = polyval(P,t);
        P = polyfit (t,BattMod7_9_Temp_Average(:,1),4);
        BattMod7_9_Temp_Average_Fitted = polyval(P,t);
        
        dTmodule1_6Avgdt = -diff(BattMod1_6_Temp_Average_Fitted)./diff(t_sec);  % negative to account for heat being negative
        dTmodule1_6Avgdt =[0;dTmodule1_6Avgdt];                           % for calc in the next step
%         dTmoduleAvgdt(find(abs(dTmoduleAvgdt)<1e-4)) = nan;
        dTmodule7_9Avgdt = -diff(BattMod7_9_Temp_Average_Fitted)./diff(t_sec);  % negative to account for heat being negative
        dTmodule7_9Avgdt =[0;dTmodule7_9Avgdt];                                 % for calc in the next step
                
        H_Module_TempAvg = Qdot_CoolantInOut./6.*(dTmodule7_9Avgdt-dTmodule1_6Avgdt);   
        
        
%         
%         P = polyfit (t,BattMod1_6_Temp_Average(:,1),4);
%         BattMod1_6_Temp_Average_Fitted = polyval(P,t);
%         P = polyfit (t,Qdot_CoolantInOut(:,1),3);
%         Qdot_CoolantInOut_Fitted = polyval(P,t);
%        
%         dTmoduleAvgdt = -diff(BattMod1_6_Temp_Average_Fitted)./diff(t_sec);  % negative to account for heat being negative
%         dTmoduleAvgdt =[0;dTmoduleAvgdt];                           % for calc in the next step
%         dTmoduleAvgdt(find(abs(dTmoduleAvgdt)<1e-4)) = nan;
%         
%         H_Module_TempAvg = Qdot_CoolantInOut_Fitted./(6*dTmoduleAvgdt);

%         dat2 = [dat2 array2table(H_Module_TempAvg)];
%         varTable (1000 + 22,:) = [{1000 + 21} {'H_Module_TempAvg Inst (kJ/K)'}];  
        % inst value may not be right. better to use steady.
    end
    if(size(dat2,2)~=22)            % 13 = 9 + 4, 4 variables addes to varTable in this if-block
        dat2 = [dat2 array2table(zeros(n,9),'VariableNames',...
            {'BattMod1_3_Temp_Average (degC) - MISSING','BattMod4_6_Temp_Average (degC)  - MISSING','BattMod1_6_Temp_Average (degC) - MISSING',...
            'BattMod1_6_Temp_Max (degC) - MISSING','BattMod1_6_Temp_Min (degC) - MISSING','BattMod7_9_Temp_Average (degC) - MISSING',...
            'BattMod7_9_Temp_Max (degC) - MISSING','BattMod7_9_Temp_Min (degC) - MISSING','Qdot_CoolantInOut (kW) - MISSING'})];
    end 
    %% Pack Heat Gen - First Implemented on Demo 8 v5.1-Test Data
    if(PackHeatGen)
        H_Module_AvgTemps = 50;        % in kJ/K, from manual calc on Demo 8 data
        H_Module_MaxTemps = 134.158;       % in kJ/K, from manual calc on Demo 8 data

        BattMod7_9_Temp_Average = mean([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],2,'omitnan');
        BattMod7_9_Temp_Max = max([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],[],2,'omitnan');
        BattMod7_9_Temp_Min = min([dat1{:,indexflag_battmodend-2:indexflag_battmodend}],[],2,'omitnan');

%         dat2 = [dat2 array2table(BattMod7_9_Temp_Average) array2table(BattMod7_9_Temp_Max) array2table(BattMod7_9_Temp_Min)];
%         varTable (1000 + 20,:) = [{1000 + 19} {'BattMod7_9_Temp_Average (degC)'}];
%         varTable (1000 + 21,:) = [{1000 + 20} {'BattMod7_9_Temp_Max (degC)'}];
%         varTable (1000 + 22,:) = [{1000 + 21} {'BattMod7_9_Temp_Min (degC)'}];

        Deltat = ((t(end)-t(1))*60);                % deltat in seconds
        HeatGenModule_AvgTemps = H_Module_AvgTemps*(BattMod7_9_Temp_Average(end) - BattMod7_9_Temp_Average(1))/Deltat;
        HeatGenPack_AvgTemps = 9*HeatGenModule_AvgTemps;
        fprintf("HeatGen Avg Temps: %f kW \n",HeatGenPack_AvgTemps);

        HeatGenModule_MaxTemps = H_Module_MaxTemps*(BattMod7_9_Temp_Average(end) - BattMod7_9_Temp_Average(1))/Deltat;
        HeatGenPack_MaxTemps = 9*HeatGenModule_MaxTemps;
        fprintf("HeatGen Max Temps: %f kW \n",HeatGenPack_MaxTemps);
    end
    %%  hvbt3HighLevelTempsProcessing
    if(HVBt3HighLevelTemps & indexflag_batt3modbeg & indexflag_batt3modend)
        Batt3Mod_Temp_Average = mean([dat1{:,indexflag_batt3modbeg:indexflag_batt3modend}],2,'omitnan');
        Batt3Mod_Temp_Max = max([dat1{:,indexflag_batt3modbeg:indexflag_batt3modend}],[],2,'omitnan');
        Batt3Mod_Temp_Min = min([dat1{:,indexflag_batt3modbeg:indexflag_batt3modend}],[],2,'omitnan');
        dat2 = [dat2 array2table(Batt3Mod_Temp_Average) array2table(Batt3Mod_Temp_Max) array2table(Batt3Mod_Temp_Min)];
        varTable (1000 + 22,:) = [{1000 + 21} {'Batt3Mod_Temp_Average (degC)'}];
        varTable (1000 + 23,:) = [{1000 + 22} {'Batt3Mod_Temp_Max (degC)'}];
        varTable (1000 + 24,:) = [{1000 + 23} {'Batt3Mod_Temp_Min (degC)'}]; 
    end
    if(size(dat2,2)~=25)
        dat2 = [dat2 array2table(zeros(n,3),'VariableNames',{'Batt3Mod_Temp_Average (degC) - MISSING','Batt3Mod_Temp_Max (degC)  - MISSING','Batt3Mod_Temp_Min (degC) - MISSING'})];
    end
    %%  hvbt4HighLevelTempsProcessing
    if(HVBt4HighLevelTemps & indexflag_batt4modbeg & indexflag_batt4modend)
        Batt4Mod_Temp_Average = mean([dat1{:,indexflag_batt4modbeg:indexflag_batt4modend}],2,'omitnan');
        Batt4Mod_Temp_Max = max([dat1{:,indexflag_batt4modbeg:indexflag_batt4modend}],[],2,'omitnan');
        Batt4Mod_Temp_Min = min([dat1{:,indexflag_batt4modbeg:indexflag_batt4modend}],[],2,'omitnan');
        dat2 = [dat2 array2table(Batt4Mod_Temp_Average) array2table(Batt4Mod_Temp_Max) array2table(Batt4Mod_Temp_Min)];
        varTable (1000 + 25,:) = [{1000 + 24} {'Batt4Mod_Temp_Average (degC)'}];
        varTable (1000 + 26,:) = [{1000 + 25} {'Batt4Mod_Temp_Max (degC)'}];
        varTable (1000 + 27,:) = [{1000 + 26} {'Batt4Mod_Temp_Min (degC)'}]; 
    end
    if(size(dat2,2)~=28)
        dat2 = [dat2 array2table(zeros(n,3),'VariableNames',{'Batt4Mod_Temp_Average (degC) - MISSING','Batt4Mod_Temp_Max (degC)  - MISSING','Batt4Mod_Temp_Min (degC) - MISSING'})];
    end
    %% BatteryCoolingEffect in CAFU 
    if(BatteryCoolingEffect & indexflag_CTBI & indexflag_BattOutTemp)
        BattOutTemp = dat1{:,indexflag_BattOutTemp};
        CTBI = dat1{:,indexflag_CTBI};
        
        Vdot_Coolant_Chlr = 15.6;           % in LPM, mean of 3.35-3.42 LPM
        Vdot_Coolant_Chlr = Vdot_Coolant_Chlr/1000/60;        % in m3/s
        rho_Coolant_30C = 1066;                 % in kg/m3
        mdot_Coolant = rho_Coolant_30C*Vdot_Coolant_Chlr;         % in kg/s
        Cp_Coolant_30C = 3.50;                              % in kJ/kg K
        DeltaT_CoolantInOut = BattOutTemp - CTBI;
        Qdot_CoolantInOut = mdot_Coolant*Cp_Coolant_30C*DeltaT_CoolantInOut;        % in kW

        dat2 = [dat2 array2table(Qdot_CoolantInOut)];
        varTable (1000 + 28,:) = [{1000 + 27} {'Qdot_CoolantInOut (kW)'}];  
        
        ChillingModeOn = [dat1{:,indexflag_HVBtTMSMd}==5];
        Qdot_CoolantInOut_AVERAGE = mean([Qdot_CoolantInOut(ChillingModeOn)],1,'omitnan');
        fprintf("Average Heat Extracted from the Packs: %f kW \n",Qdot_CoolantInOut_AVERAGE);

   end
   if(size(dat2,2)~=29)
       dat2 = [dat2 array2table(zeros(n,1),'VariableNames',{'Qdot_CoolantInOut_Chlr (kW) - MISSING'})];
   end
   %% Temperature-Rate of Cooling of Batteries 
    if(BatteryTempDiagnostic & indexflag_CTBI & indexflag_BattOutTemp)
        BattOutTemp = dat1{:,indexflag_BattOutTemp};
        CTBI = dat1{:,indexflag_CTBI};
        t = table2array(dat1(:,1));                % in min

        DeltaT_CoolantInOut = BattOutTemp - CTBI;
        
        dat2 = [dat2 array2table(DeltaT_CoolantInOut)];
        varTable (1000 + 29,:) = [{1000 + 28} {'DeltaT_BatteryInOut'}];  
        
        P = polyfit (t,CTBI,4);
        CTBIFitted = polyval(P,t);
        P = polyfit (t,BattOutTemp,4);
        BattOutTempFitted = polyval(P,t);

        dCTBIFitteddt = [0;diff(CTBIFitted)./diff(t)];
        dBattOutTempFitteddt = [0;diff(BattOutTempFitted)./diff(t)];

        dCTBIdt = [0;diff(CTBI)./diff(t)];
        dBattOutTempdt = [0;diff(BattOutTemp)./diff(t)];
        
        %% Moving Sum CTBIdt
        tlast = t(1);
        sum1 = 0;
        sum2 = 0;
        
        i=1;
        j = 1;
        t_MvngAvg (j) = t(i);
        dCTBIdt_MvngAvg (j) = dCTBIdt(i);
        dBattOutTempdt_MvngAvg (j) = dBattOutTempdt(i);

        while (i<=length(dCTBIdt))
            ilast = i;
            while (i<=length(t) && (t(i)-t_MvngAvg(j))<0.5)         % in min
                if(~isnan(dCTBIdt(i)))
                    sum1 = sum1 + dCTBIdt(i);
                end
                if(~isnan(dBattOutTempdt(i)))
                    sum2 = sum2 + dBattOutTempdt(i);
                end
                i=i+1;
            end
            t_MvngAvg (j+1) = t(i-1);
            dCTBIdt_MvngAvg (j+1) = sum1;
            dBattOutTempdt_MvngAvg (j+1) = sum2;
            sum1 = 0;
            sum2 = 0;
            j=j+1;
        end
        
        t_MvngAvg (end) = [];
        dCTBIdt_MvngAvg (end) = [];
        dBattOutTempdt_MvngAvg (end) = [];

        %% Moving Sum CTBIFitted dt
        tlast = t(1);
        sum1 = 0;
        sum2 = 0;
        
        i=1;
        j = 1;
        t_MvngAvg (j) = t(i);
        dCTBIFitteddt_MvngAvg (j) = dCTBIFitteddt(i);
        dBattOutTempFitteddt_MvngAvg (j) = dBattOutTempFitteddt(i);

        while (i<=length(dCTBIFitteddt))
            ilast = i;
            while (i<=length(t) && (t(i)-t_MvngAvg(j))<0.5)         % in min
                if(~isnan(dCTBIFitteddt(i)))
                    sum1 = sum1 + dCTBIFitteddt(i);
                end
                if(~isnan(dBattOutTempFitteddt(i)))
                    sum2 = sum2 + dBattOutTempdt(i);
                end
                i=i+1;
            end
            t_MvngAvg (j+1) = t(i-1);
            dCTBIFitteddt_MvngAvg (j+1) = sum1;
            dBattOutTempFitteddt_MvngAvg (j+1) = sum2;
            sum1 = 0;
            sum2 = 0;
            j=j+1;
        end
        
        t_MvngAvg (end) = [];
        dCTBIFitteddt_MvngAvg (end) = [];
        dBattOutTempFitteddt_MvngAvg (end) = [];


        dat2 = [dat2 array2table(dCTBIdt) array2table(dBattOutTempdt) array2table(CTBIFitted) array2table(BattOutTempFitted)];
        varTable (1000 + 30,:) = [{1000 + 29} {'Time Derivative of CTBI'}];
        varTable (1000 + 31,:) = [{1000 + 30} {'Time Derivative of BattOutTemp'}];
        varTable (1000 + 32,:) = [{1000 + 31} {'CTBI Fitted'}];
        varTable (1000 + 33,:) = [{1000 + 32} {'BattOutTemp Fitted'}];
   end
   if(size(dat2,2)~=34)
       dat2 = [dat2 array2table(zeros(n,5),'VariableNames',{'DeltaT_BatteryInOut (degC) - MISSING','Time Derivative of CTBI - MISSING',...
           'Time Derivative of BattOutTemp - MISSING','CTBI Fitted - MISSING','BattOutTemp Fitted - MISSING'})];
   end
   %% Electronics Loop Cooling Effect on CAFU
    if(ELCoolingEffect & indexflag_CTBBI & indexflag_CTDI & indexflag_CTBB2I & indexflag_CTBB4I)
        
        Vdot_Coolant_BB12 = 14.2;           % in LPM, 
        Vdot_Coolant_BB12 = Vdot_Coolant_BB12/1000/60;        % in m3/s

        CTBBI = dat1{:,indexflag_CTBBI};
        CTBB2I = dat1{:,indexflag_CTBB2I};
        BB2OutTemp = dat1{:,indexflag_BB2OutTemp};

        RptTempIn1 = dat1{:,indexflag_RptTempIn1};
        RptTempOut2 = dat1{:,indexflag_RptTempOut2};

        rho_Coolant_30C = 1066;                 % in kg/m3
        mdot_Coolant_BB12 = rho_Coolant_30C*Vdot_Coolant_BB12;         % in kg/s
        Cp_Coolant_30C = 3.50;                              % in kJ/kg K
        
        Qdot_CoolantInOut_BB1 = mdot_Coolant_BB12*Cp_Coolant_30C*(CTBB2I-CTBBI);             % in kW
        Qdot_CoolantInOut_BB2 = mdot_Coolant_BB12*Cp_Coolant_30C*(BB2OutTemp-CTBB2I);        % in kW
        Qdot_CoolantInOut_BB12 = mdot_Coolant_BB12*Cp_Coolant_30C*(BB2OutTemp-CTBBI);        % in kW
        Qdot_RptCoolantInOut_BB12 = mdot_Coolant_BB12*Cp_Coolant_30C*(RptTempOut2-RptTempIn1);        % in kW

        dat2 = [dat2 array2table(Qdot_CoolantInOut_BB1) array2table(Qdot_CoolantInOut_BB2) array2table(Qdot_CoolantInOut_BB12) array2table(Qdot_RptCoolantInOut_BB12)];
        varTable (1000 + 34,:) = [{1000 + 33} {'Qdot_CoolantInOut_BB1 (kW)'}]; 
        varTable (1000 + 35,:) = [{1000 + 34} {'Qdot_CoolantInOut_BB2 (kW)'}];
        varTable (1000 + 36,:) = [{1000 + 35} {'Qdot_CoolantInOut_BB12 (kW)'}];       
        varTable (1000 + 37,:) = [{1000 + 36} {'Qdot_RptCoolantInOut_BB12 (kW)'}];       
           
        ChillingModeOn = dat1{:,indexflag_ELTMSMd}==7;
        Qdot_CoolantInOut_BB1_AVERAGE = mean([Qdot_CoolantInOut_BB1(ChillingModeOn)],1,'omitnan');
        Qdot_CoolantInOut_BB2_AVERAGE = mean([Qdot_CoolantInOut_BB2(ChillingModeOn)],1,'omitnan');
        Qdot_CoolantInOut_BB12_AVERAGE = mean([Qdot_CoolantInOut_BB12(ChillingModeOn)],1,'omitnan');
        Qdot_RptCoolantInOut_BB12_AVERAGE = mean([Qdot_RptCoolantInOut_BB12(ChillingModeOn)],1,'omitnan');

        fprintf("Average Heat Extracted from BB1: %f kW \n",Qdot_CoolantInOut_BB1_AVERAGE);
        fprintf("Average Heat Extracted from BB2: %f kW \n",Qdot_CoolantInOut_BB2_AVERAGE);
        fprintf("Average Heat Extracted from BB1 & BB2 Combined: %f kW \n",Qdot_CoolantInOut_BB12_AVERAGE);
        fprintf("Average Heat Extracted from BB1 & BB2 Combined With Report Coolant Temps: %f kW \n",Qdot_RptCoolantInOut_BB12_AVERAGE);

        % BB3 and BB4
        Vdot_Coolant_BB34 = 10.9;           % in LPM, 
        Vdot_Coolant_BB34 = Vdot_Coolant_BB34/1000/60;        % in m3/s

        CTBBI = dat1{:,indexflag_CTBBI};
        CTBB4I = dat1{:,indexflag_CTBB4I};
        BB4OutTemp = dat1{:,indexflag_BB4OutTemp};

        RptTempIn3 = dat1{:,indexflag_RptTempIn3};
        RptTempOut4 = dat1{:,indexflag_RptTempOut4};

        rho_Coolant_30C = 1066;                 % in kg/m3
        mdot_Coolant_BB34 = rho_Coolant_30C*Vdot_Coolant_BB34;         % in kg/s
        Cp_Coolant_30C = 3.50;                              % in kJ/kg K
        
        Qdot_CoolantInOut_BB3 = mdot_Coolant_BB34*Cp_Coolant_30C*(CTBB4I-CTBBI);             % in kW
        Qdot_CoolantInOut_BB4 = mdot_Coolant_BB34*Cp_Coolant_30C*(BB4OutTemp-CTBB4I);        % in kW
        Qdot_CoolantInOut_BB34 = mdot_Coolant_BB34*Cp_Coolant_30C*(BB4OutTemp-CTBBI);        % in kW
        Qdot_RptCoolantInOut_BB34 = mdot_Coolant_BB34*Cp_Coolant_30C*(RptTempOut4-RptTempIn3);        % in kW

        dat2 = [dat2 array2table(Qdot_CoolantInOut_BB3) array2table(Qdot_CoolantInOut_BB4) array2table(Qdot_CoolantInOut_BB34) array2table(Qdot_RptCoolantInOut_BB34)];
        varTable (1000 + 38,:) = [{1000 + 37} {'Qdot_CoolantInOut_BB3 (kW)'}]; 
        varTable (1000 + 39,:) = [{1000 + 38} {'Qdot_CoolantInOut_BB4 (kW)'}];
        varTable (1000 + 40,:) = [{1000 + 39} {'Qdot_CoolantInOut_BB34 (kW)'}];       
        varTable (1000 + 41,:) = [{1000 + 40} {'Qdot_RptCoolantInOut_BB34 (kW)'}];
           
        ChillingModeOn = dat1{:,indexflag_ELTMSMd}==7;
        Qdot_CoolantInOut_BB3_AVERAGE = mean([Qdot_CoolantInOut_BB3(ChillingModeOn)],1,'omitnan');
        Qdot_CoolantInOut_BB4_AVERAGE = mean([Qdot_CoolantInOut_BB4(ChillingModeOn)],1,'omitnan');
        Qdot_CoolantInOut_BB34_AVERAGE = mean([Qdot_CoolantInOut_BB34(ChillingModeOn)],1,'omitnan');
        Qdot_RptCoolantInOut_BB34_AVERAGE = mean([Qdot_RptCoolantInOut_BB34(ChillingModeOn)],1,'omitnan');

        fprintf("Average Heat Extracted from BB3: %f kW \n",Qdot_CoolantInOut_BB3_AVERAGE);
        fprintf("Average Heat Extracted from BB4: %f kW \n",Qdot_CoolantInOut_BB4_AVERAGE);
        fprintf("Average Heat Extracted from BB3 & BB4 Combined: %f kW \n",Qdot_CoolantInOut_BB34_AVERAGE);
        fprintf("Average Heat Extracted from BB3 & BB4 Combined with Report Coolant Temps: %f kW \n",Qdot_RptCoolantInOut_BB34_AVERAGE);
   end
   if(size(dat2,2)~=42)
       dat2 = [dat2 array2table(zeros(n,8),'VariableNames',{'Qdot_CoolantInOut_BB1 (kW) - MISSING','Qdot_CoolantInOut_BB2 (kW) - MISSING','Qdot_CoolantInOut_BB12 (kW) - MISSING','Qdot_RptCoolantInOut_BB12 (kW) - MISSING','Qdot_CoolantInOut_BB3 (kW) - MISSING','Qdot_CoolantInOut_BB4 (kW) - MISSING','Qdot_CoolantInOut_BB34 (kW) - MISSING','Qdot_RptCoolantInOut_BB34 (kW) - MISSING'})];
   end
end
