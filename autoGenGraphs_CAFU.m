function autoGenGraphs_CAFU(autoGenChoiceList,varTable,date,title_plot,dat1,dat2)

    hvacMd = autoGenChoiceList(2);
    dcdc = autoGenChoiceList(5);
    battery = autoGenChoiceList(6);
    battery_soc_temps = autoGenChoiceList(7);           % this one should not be in autogen probably.. needs custom time input
    battery_soc_temps2 = autoGenChoiceList(8);          % maybe created in some file somewhere - find
    battery2_soc_temps = autoGenChoiceList(9);
    BBTemps = autoGenChoiceList(10);
    CCSElectrical = autoGenChoiceList(11);
    Compressors = autoGenChoiceList(12);
    BatteryModuleLevel = autoGenChoiceList(13);

    %%
    xi=1;

    close all;
    if(hvacMd)
%         yi = [2]; yi_r=[];                                          % TMS Mode
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [3,150]; yi_r=[];                                          % HVBt TMS Mode and its override value
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [4,151]; yi_r=[];                                          % EL TMS Mode and its override value
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    if(dcdc)
        yi=[];  yi_r=[];
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    if(battery)
        symbols = {'xr-','or-','xg-','og-','xb-','ob-'};
   
        yi = [1000,1001,1002,77,82]; yi_r=[];                          % Battery 1 Module High Level Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1005,1006,1007,77,82]; yi_r=[];                          % Battery 2 Module High Level Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1021,1022,1023,77,82]; yi_r=[];                          % Battery 3 Module High Level Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1024,1025,1026,77,82]; yi_r=[];                          % Battery 4 Module High Level Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

%         yi = [51,52,26,88,30]; yi_r=[];                                 % BMS Temps
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);      
      end
%     if(battery2)
%         symbols = {'xr-','or-','xg-','og-','xb-','ob-'};
%    
%         yi = [1005,1006,1007,26,24]; yi_r=[9];                          % Battery Module High Level Temps
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         yi = [51,52,26,88]; yi_r=[];                                      % Battery Module High Level Temps
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         % Battey Modules Temp Variation
%         yi = [63:68,26,88,1000];     yi_r=[];                            % Modules 1-3
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         yi = [69:74,26,88,1000];   yi_r=[];                              % Modules 4-5
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         yi = [75:80,26,88,1000];   yi_r=[];                              % Modules 7-9
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%     end
    if(battery_soc_temps)
        socI=54;                        % BMS Pack SOC serial number on vartable
        SOC_FirstI = find(~isnan(dat1{:,socI}),1);
        SOC1 = min(90,dat1{SOC_FirstI,socI},'omitnan');
        SOC2 = 50;
%         SOC_LastI = find(~isnan(dat1{:,socI})&~isnan(dat1{:,43})&~isnan(dat1{:,33})&~isnan(dat1{:,49}),1,'last');
        SOC_LastI = find(~isnan(dat1{:,socI}),1,'last');
        SOC3 = max(15,dat1{SOC_LastI,socI},'omitnan');
    
        SOC1_I=[];
        SOC2_I=[];
        SOC3_I=[];
    
        while(isempty(SOC1_I))                                                  % while SOC_I non-empty
%             SOC1_I = find(dat1{:,socI}==SOC1&~isnan(dat1{:,2})&~isnan(dat1{:,10})&~isnan(dat1{:,18}),1);
            SOC1_I = find(dat1{:,socI}==SOC1&~isnan(dat1{:,33})&~isnan(dat1{:,41})&~isnan(dat1{:,49}),1);
%             SOC1_I = find(dat1{:,socI}==SOC1,1);
            SOC1 = SOC1-1;
        end    
        while(isempty(SOC2_I))                                                  % while SOC_I non-empty
            SOC2_I = find(dat1{:,socI}==SOC2,1);
            SOC2 = SOC2-1;
        end
        while(isempty(SOC3_I))                                                  % while SOC_I non-empty
%             SOC3_I = find(dat1{:,socI}==SOC3&~isnan(dat1{:,2})&~isnan(dat1{:,10})&~isnan(dat1{:,18}),1);
            SOC3_I = find(dat1{:,socI}==SOC3&~isnan(dat1{:,33})&~isnan(dat1{:,41})&~isnan(dat1{:,49}),1);
%             SOC3_I = find(dat1{:,socI}==SOC3,1)
            SOC3 = SOC3-1; 
            % this is only used if 15 gets selected above from the max function
            % and then there is always smaller values available
        end

        %         yi = [33:49]; yi_r=[];
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date);
        
        yi = [1000,1001,1002,30];   yi_r=[socI];                     % Battery high level temps with SOC
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
%         yi = [15]; yi_r=[socI];                                   % VehSpd with SOC
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
       
        xi=1;
%         I1 = find(abs(dat1{:,xi}-T1)<1e-3);
        f = figure;
        f.Position = [400 250 800 650];
%         symbols = {'bx','rx','bo','ro','b+','r+','b*','r*','b.','r.','bs','rs','bd','rd','bp','rp','bh','rh'};
        
        yi = [33:50];
%         yi = [indexflag_battmodbeg:indexflag_battmodend];

        for i=1:18
            xi=i;
            
%             if(i~=5)                % mod3 temp 2 in certain datasets                
%                 if(i>5)
%                     SOC1_plot=plot(xi,dat1{SOC1_I,yi(i-1)},'gs','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     hold on;
%                     SOC2_plot=plot(xi,dat1{SOC2_I,yi(i-1)},'cd','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     SOC3_plot=plot(xi,dat1{SOC3_I,yi(i-1)},'rh','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 else
                    SOC1_plot=plot(xi,dat1{SOC1_I,yi(i)},'gs','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
                    hold on;
                    SOC2_plot=plot(xi,dat1{SOC2_I,yi(i)},'cd','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
                    SOC3_plot=plot(xi,dat1{SOC3_I,yi(i)},'rh','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 end
%             end
%         end
        xlabel('Battery Thermistor No.');
        ylabel('Thermistor Temperature (degC)');
        title(sprintf('%s | %s',title_plot, date));
        ylim([20,60]);
        xlim([0,19]);

        str = {''};
        for i=1:18
            str = {str{:},sprintf('M%i T%i',ceil(i/2),mod(i+1,2)+1)};
        end
        str = {str{:},' '};

        xticks(0:1:19);
        xticklabels(str);
        grid on;
        set(gca,'xminorgrid','on','yminorgrid','on');
        legend([SOC1_plot SOC2_plot SOC3_plot],{sprintf('At HUD_SOC = %.2f',dat1{SOC1_I,socI}),sprintf('At HUD_SOC = %.2f',dat1{SOC2_I,socI}),sprintf('At HUD_SOC = %.2f',dat1{SOC3_I,socI})});        
        legend('location','best','Interpreter','none');
        end
    end
    if(battery2_soc_temps)
        socI=54;                        % BMS Pack SOC serial number on vartable
        SOC_FirstI = find(~isnan(dat1{:,socI}),1);
        SOC1 = min(90,dat1{SOC_FirstI,socI},'omitnan');
        SOC2 = 50;
%         SOC_LastI = find(~isnan(dat1{:,socI})&~isnan(dat1{:,43})&~isnan(dat1{:,33})&~isnan(dat1{:,49}),1,'last');
        SOC_LastI = find(~isnan(dat1{:,socI}),1,'last');
        SOC3 = max(15,dat1{SOC_LastI,socI},'omitnan');
    
        SOC1_I=[];
        SOC2_I=[];
        SOC3_I=[];
    
        while(isempty(SOC1_I))                                                  % while SOC_I non-empty
%             SOC1_I = find(dat1{:,socI}==SOC1&~isnan(dat1{:,2})&~isnan(dat1{:,10})&~isnan(dat1{:,18}),1);
            SOC1_I = find(dat1{:,socI}==SOC1&~isnan(dat1{:,63})&~isnan(dat1{:,71})&~isnan(dat1{:,79}),1);
%             SOC1_I = find(dat1{:,socI}==SOC1,1);
            SOC1 = SOC1-1;
        end    
        while(isempty(SOC2_I))                                                  % while SOC_I non-empty
            SOC2_I = find(dat1{:,socI}==SOC2,1);
            SOC2 = SOC2-1;
        end
        while(isempty(SOC3_I))                                                  % while SOC_I non-empty
%             SOC3_I = find(dat1{:,socI}==SOC3&~isnan(dat1{:,2})&~isnan(dat1{:,10})&~isnan(dat1{:,18}),1);
            SOC3_I = find(dat1{:,socI}==SOC3&~isnan(dat1{:,63})&~isnan(dat1{:,71})&~isnan(dat1{:,79}),1);
%             SOC3_I = find(dat1{:,socI}==SOC3,1)
            SOC3 = SOC3-1; 
            % this is only used if 15 gets selected above from the max function
            % and then there is always smaller values available
        end

        %         yi = [33:49]; yi_r=[];
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date);
        
        xi=1;
        yi = [1000,1001,1002,1005,1006,1007,30];   yi_r=[socI];                     % Battery high level temps with SOC
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
%         yi = [15]; yi_r=[socI];                                   % VehSpd with SOC
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
       
        xi=1;
%         I1 = find(abs(dat1{:,xi}-T1)<1e-3);
        f = figure;
        f.Position = [400 250 800 650];
%         symbols = {'bx','rx','bo','ro','b+','r+','b*','r*','b.','r.','bs','rs','bd','rd','bp','rp','bh','rh'};
        
        yi = [63:80];
%         yi = [indexflag_battmodbeg:indexflag_battmodend];

        for i=1:18
            xi=i;
            
%             if(i~=5)                % mod3 temp 2 in certain datasets                
%                 if(i>5)
%                     SOC1_plot=plot(xi,dat1{SOC1_I,yi(i-1)},'gs','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     hold on;
%                     SOC2_plot=plot(xi,dat1{SOC2_I,yi(i-1)},'cd','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     SOC3_plot=plot(xi,dat1{SOC3_I,yi(i-1)},'rh','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 else
                    SOC1_plot=plot(xi,dat1{SOC1_I,yi(i)},'gs','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
                    hold on;
                    SOC2_plot=plot(xi,dat1{SOC2_I,yi(i)},'cd','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
                    SOC3_plot=plot(xi,dat1{SOC3_I,yi(i)},'rh','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 end
%             end
%         end
        xlabel('Battery2 Thermistor No.');
        ylabel('Thermistor Temperature (degC)');
        title(sprintf('%s | %s',title_plot, date));
        ylim([20,60]);
        xlim([0,19]);

        str = {''};
        for i=1:18
            str = {str{:},sprintf('M%i T%i',ceil(i/2),mod(i+1,2)+1)};
        end
        str = {str{:},' '};

        xticks(0:1:19);
        xticklabels(str);
        grid on;
        set(gca,'xminorgrid','on','yminorgrid','on');
        legend([SOC1_plot SOC2_plot SOC3_plot],{sprintf('At HUD_SOC = %.2f',dat1{SOC1_I,socI}),sprintf('At HUD_SOC = %.2f',dat1{SOC2_I,socI}),sprintf('At HUD_SOC = %.2f',dat1{SOC3_I,socI})});        
        legend('location','best','Interpreter','none');
        end
    end
    battery_soc_tempsX = 0; % old .. need to reevaluate and delete
    if(battery_soc_tempsX)
        SOC_FirstI = find(~isnan(dat1{:,53}),1);
        SOC1 = min(90,dat1{SOC_FirstI,53},'omitnan');
        SOC2 = 50;
        SOC_LastI = find(~isnan(dat1{:,53})&~isnan(dat1{:,43})&~isnan(dat1{:,33})&~isnan(dat1{:,49}),1,'last');
        SOC3 = max(15,dat1{SOC_LastI,53},'omitnan');
    
        SOC1_I=[];
        SOC2_I=[];
        SOC3_I=[];
    
        while(isempty(SOC1_I))                                                  % while SOC_I non-empty
%             SOC1_I = find(dat1{:,53}==SOC1&~isnan(dat1{:,43})&~isnan(dat1{:,33})&~isnan(dat1{:,49}),1);
            SOC1_I = find(dat1{:,53}==SOC1,1);
            SOC1 = SOC1-1;
        end    
        while(isempty(SOC2_I))                                                  % while SOC_I non-empty
            SOC2_I = find(dat1{:,53}==SOC2,1);
            SOC2 = SOC2-1;
        end
%         while(isempty(SOC3_I))                                                  % while SOC_I non-empty
%             SOC3_I = find(dat1{:,53}==SOC3&~isnan(dat1{:,43})&~isnan(dat1{:,33})&~isnan(dat1{:,49}),1);
%             SOC3 = SOC3-1; 
%             % this is only used if 15 gets selected above from the max function
%             % and then there is always smaller values available
%         end

        %         yi = [33:49]; yi_r=[];
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [1000,1001,1002];   yi_r=[53];                     % Battery high level temps with SOC
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [15]; yi_r=[53];                                   % VehSpd with SOC
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
       
        xi=1;
%         I1 = find(abs(dat1{:,xi}-T1)<1e-3);
        f = figure;
        f.Position = [400 250 800 650];
%         symbols = {'bx','rx','bo','ro','b+','r+','b*','r*','b.','r.','bs','rs','bd','rd','bp','rp','bh','rh'};
        
        yi = [33:50];

        for i=1:18
            xi=i;
            
%             if(i~=5)                % mod3 temp 2 in certain datasets                
%                 if(i>5)
%                     SOC1_plot=plot(xi,dat1{SOC1_I,yi(i-1)},'gs','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     hold on;
%                     SOC2_plot=plot(xi,dat1{SOC2_I,yi(i-1)},'cd','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     SOC3_plot=plot(xi,dat1{SOC3_I,yi(i-1)},'rh','DisplayName',sprintf('%c',varTable{yi(i-1)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 else
                    SOC1_plot=plot(xi,dat1{SOC1_I,yi(i)},'gs','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
                    hold on;
                    SOC2_plot=plot(xi,dat1{SOC2_I,yi(i)},'cd','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                     SOC3_plot=plot(xi,dat1{SOC3_I,yi(i)},'rh','DisplayName',sprintf('%c',varTable{yi(i)+1,2}),'LineWidth',1.5,'MarkerSize',15);
%                 end
%             end
%         end
        xlabel('Battery Thermistor No.');
        ylabel('Thermistor Temperature (degC)');
        title(sprintf('Baker Van Drive Cycle Data | %s',date));
        ylim([20,60]);
        xlim([0,19]);

        str = {''};
        for i=1:18
            str = {str{:},sprintf('M%i T%i',ceil(i/2),mod(i+1,2)+1)};
        end
        str = {str{:},' '};

        xticks(0:1:19);
        xticklabels(str);
        grid on;
        set(gca,'xminorgrid','on','yminorgrid','on');
        legend([SOC1_plot SOC2_plot SOC3_plot],{sprintf('At HUD_SOC = %i',dat1{SOC1_I,53}),sprintf('At HUD_SOC = %i',dat1{SOC2_I,53}),sprintf('At HUD_SOC = %i',dat1{SOC3_I,53})});        
        legend('location','best','Interpreter','none');
        end
    end
    %% BBTemps
    if(BBTemps)
        yi = [88,89,96]; yi_r=[];                                          % BB1 Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [90,91,97]; yi_r=[];                                          % BB2 Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [92,93,98]; yi_r=[];                                          % BB3 Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [94,95,99]; yi_r=[];                                          % BB4 Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

    end
    %% CCS Currents and Voltage
    if(CCSElectrical)
        yi = [122:124]; yi_r=[];                                          % CCS1 currents
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [125:127]; yi_r=[];                                          % CCS1 voltage
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [128:130]; yi_r=[];                                          % CCS2 currents
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [131:133]; yi_r=[];                                          % CCS2 voltage
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [88:91,96,97];   yi_r=[123];                                   % CCS1 currents and temp                             
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [92:95,98,99];   yi_r=[129];                                   % CCS1 currents and temp                             
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [88:91,96,97];   yi_r=[124];                                   % CCS1 currents and temp                             
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [92:95,98,99];   yi_r=[130];                                   % CCS1 currents and temp                             
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    %% Compressors
    if(Compressors)
        yi = [104:106]; yi_r=[102];                                          % Battery Compressor Enbl and Speed
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [110,111,114,115]; yi_r=[102];                                          % Battery Compressor Pressures
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [107:109]; yi_r=[103];                                          % EL Compressor Enbl and Speed 
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [116,117,120,121]; yi_r=[103];                                     % EL Compressor Pressures
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

    end
    if(BatteryModuleLevel)
        % Battery 1 Modules Temp Variation
        yi = [1000,5:10,77,82];     yi_r=[];                            % Modules 1-3
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1000,11:16,77,82];     yi_r=[];                            % Modules 4-6
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1000,17:22,77,82];     yi_r=[];                            % Modules 7-9
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        % Battery 2 Modules Temp Variation
        yi = [1005,23:28,77,82];     yi_r=[];                            % Modules 1-3
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1005,29:34,77,82];     yi_r=[];                            % Modules 4-6
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1005,35:40,77,82];     yi_r=[];                            % Modules 7-9
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        % Battery 3 Modules Temp Variation
        yi = [1021,41:46,77,82];     yi_r=[];                            % Modules 1-3
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1021,47:52,77,82];     yi_r=[];                            % Modules 4-6
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1021,53:58,77,82];     yi_r=[];                            % Modules 7-9
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        % Battery 4 Modules Temp Variation
        yi = [1024, 59:64,77,82];     yi_r=[];                            % Modules 1-3
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1024, 65:70,77,82];     yi_r=[];                            % Modules 4-6
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [1024, 71:76,77,82];     yi_r=[];                            % Modules 7-9
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
end