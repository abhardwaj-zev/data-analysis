function autoGenGraphs_v5_1(autoGenChoiceList,varTable,date,title_plot,dat1,dat2)

    odo = autoGenChoiceList(1);
    hvacMd = autoGenChoiceList(2);
    motor = autoGenChoiceList(3);
    inv = autoGenChoiceList(4);
    dcdc = autoGenChoiceList(5);
    battery = autoGenChoiceList(6);
    battery_soc_temps = autoGenChoiceList(7);           % this one should not be in autogen probably.. needs custom time input
    battery_soc_temps2 = autoGenChoiceList(8);          % maybe created in some file somewhere - find
    battery2_soc_temps = autoGenChoiceList(9);
    
    xi=1;

    close all;
    if(odo)
        yi = [2]; yi_r=[3];                                               % Odometer Check + Vehicle Speed 
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    if(hvacMd)
        yi = [4]; yi_r=[3];                                          % HVAC Mode Check
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    if(motor)
        yi = [9,10,39,49,50,52]; yi_r=[4];                                      % Motor temps check 
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [11];                      yi_r=[3];                        % Motor oil pressure check 
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

        yi = [11];                      yi_r=[12];                        % Motor oil pressure check 
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
    if(inv)
        yi = [13,17,40,44];      yi_r=[4];                              % Inv check
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
              
        yi = [14,15,16,40,44];         yi_r=[4];                              % Inv Check
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [14,15,16,40,44];         yi_r=[68];                              % Inv Check
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);        
    end  
    if(dcdc)
        yi=[18,39,49];  yi_r=[];
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
%     if(motor || dcdc || inv || battery)
%         yi=[83,87,93,94,30];  yi_r=[];
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%     end
    if(battery)
        symbols = {'xr-','or-','xg-','og-','xb-','ob-'};
   
        yi = [1000,1001,1002,38,45,52]; yi_r=[4];                          % Battery Module High Level Temps
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

%         yi = [51,52,26,88,30]; yi_r=[];                                 % BMS Temps
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        % Battey Modules Temp Variation
        yi = [20:25,1000,38,45,52];     yi_r=[];                            % Modules 1-3
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [26:31,1000,38,45,52];   yi_r=[];                              % Modules 4-5
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
        
        yi = [32:37,1000,38,45,52];   yi_r=[];                              % Modules 7-9
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

%         yi = [63:68,26,88,1000,1005,30];     yi_r=[];                            % Modules 10-12
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         yi = [69:74,26,88,1000,1005,30];   yi_r=[];                              % Modules 13-15
%         plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
%         
%         yi = [75:80,26,88,1000,1005,30];   yi_r=[];                              % Modules 16-18
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
end