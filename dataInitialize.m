%% Initialize data for analysis
% there has to be a separate data2Initialize which is either stitched onto
% data1 or used for comparison
% the list of files can be a text file later on or maybe CSV that the test
% engineer fills out after testing

function [varTable,date,title_plot,dat1,dataSource]=dataInitialize(varargin)
    % date and title_plot should be combined into a metadata variable and
    % any other variable to be combined?

    % this needs to have a uigetfile function to go and select the file and
    % also take user input on the date and title etc and record the info
    % with file no. and project name on an excel sheet for later reference
    % - data log location should be finalized so the database stays valid
    % long term
    % Maybe output variables last analyzed also get stored in the database
    % and we can reload it

    %%%%%%% INPUT %%%%%%%
    if(nargin==1)
        fileno = varargin{1};
    else
        fileno = 1202;                             
    end
    %%%%%%%%%%%%%%%%%%%%%
    

    %%%%%%%%%%%%%%%%%%%%%%% FILE DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    switch(fileno)

        %%%%%%%%%% EBERSPAECHER HEATER TESTING - COMPARISON WITH WEBASTO %%%%%%%%%

        %%% Initial Cabin Heating Runs %%%
        case 1
            dataSource = 'raptor';
            date = 'January 4, 2023';
            title_plot = "Cabin Heating, Eberspaecher Heater, Test Cart, Run 0.1 ";
            data=readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Eberspaecher Heater Testing\InitialCabinHeating_FRD450_2014_196_NetPowerBench2Mods_554_NewModeCheck_2023_01_04_02_26_32'); 
        case 2
            dataSource = 'raptor';
            date = 'January 24, 2023';
            title_plot = "Cabin Heating, Eberspaecher Heater, Test Cart, Run 0.2";
            data=readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Eberspaecher Heater Testing\InitialCabinHeating_FRD450_2014_196_NetPowerBench2Mods_554_NewModeCheck_2023_01_04_03_06_50');

        %%%%%%%%%% BATTERY HEATING TEST ON TEST CART - DIFFERENT DUTY CYCLES, FLOW RATES %%%%%%%%%%
        case 101
            dataSource = 'raptor';
            date = 'January 30, 2023';
            title_plot = "Battery Heating, Webasto Heater, Test Cart, Run 1";
            data=readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\MAINHEATING_FRD450_2022_196_597_Webasto Testing e450_2023_01_30_10_44_20.csv');       

        case 102
            dataSource = 'raptor';
            date = 'January 31, 2023';
            title_plot = "Battery Heating, Eberspaecher Heater, Test Cart, Run 1";
            data=readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_555_Heater Testing Test Cart_2023_01_31_08_58_04');               
        
       case 103
            dataSource = 'raptor';
            date = 'January 25, 2023';
            title_plot = "Battery Heating, Eberspaecher Heater, Test Cart, Run 1";
            data=readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_555_Heater Testing Test Cart_2023_01_25_09_04_10');               


        %%%%%%%%%%%%% COOLANT FITTING TEST %%%%%%%%%%%%%%%%%
        case 201
            dataSource = 'raptor';
            date  = 'February 7, 2022';
            title_plot = 'Cooling Plate Fitting Test, Test Cart, Heating 1';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_561_Heater Testing Test Cart_2023_02_07_09_37_04');
        case 202
            dataSource = 'raptor';
            date  = 'February 7, 2023';
            title_plot = 'Cooling Plate Fitting Test, Test Cart, Cooldown 1';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_561_Heater Testing Test Cart_2023_02_07_10_10_41');
        case 203
            dataSource = 'raptor';
            date  = 'February 7, 2023';
            title_plot = 'Cooling Plate Fitting Test, Test Cart, Heating 2';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_561_Heater Testing Test Cart_2023_02_07_11_09_06');
        case 204
            dataSource = 'raptor';
            date  = 'February 7, 2023';
            title_plot = 'Cooling Plate Fitting Test, Test Cart, Heating 3';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_561_Heater Testing Test Cart_2023_02_07_02_45_15');

        %~~~~~~ BAKER VAN - RELATED TO COOLING PLATE FITTING TEST ~~~~~~%
        case 221
            dataSource = 'vcg';
            date  = 'August 22, 2022';
            title_plot = 'Baker Van Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Baker Van\August 22, 2022 - VCG\decoded_00036625-2022-08-22-212648_to_2022-08-22-223201.csv');   
        case 222
            dataSource = 'vcg';
            date  = 'August 19, 2022';
            title_plot = 'Baker Van Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Baker Van\August 19, 2022 - VCG\decoded_00036625-2022-08-18-172330_to_2022-08-18-183422');   
        case 223
            dataSource = 'vcg';
            date  = 'August 19, 2022';
            title_plot = 'Baker Van Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Baker Van\August 19, 2022 - VCG\decoded_00036625-2022-08-18-172330_to_2022-08-18-183422');   
        
        %~~~~~~ COLONIAL BUS 1 (PORT AUTHORITY) - RELATED TO COOLING PLATE FITTING TEST ~~~~~~%
        case 231
            dataSource = 'vcg_fleetManager';
            date  = 'Jan 5, 2023';
            title_plot = 'Colonial 1 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Colonial Buses\Colonial 1\Jan 5, 2023\trip8352.csv');   
        
        %%%%%%%%%%%%% DEMO 6 - BATTMOD RATIONALITY FAULT ISSUE %%%%%%%%%%%%%%%%%
        case 301
            dataSource = 'vcg_fleetManager';
            date  = 'February 21, 2023';
            title_plot = 'Demo 6 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 6\Feb21_trip8060.csv');

        case 302
            dataSource = 'vcg_fleetManager';
            date  = 'February 22, 2023';
            title_plot = 'Demo 6 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 6\Feb22_trip8104.csv');     

        case 303
            dataSource = 'vcg_fleetManager';
            date  = 'February 17, 2023';
            title_plot = 'Demo 6 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 6\Feb17_trip7984.csv');     

        %%%%%%%%%%%%% FASTENAL POC RAM 1500 - For Sales Flier %%%%%%%%%%%%%%%%%
        case 401
            dataSource = 'vcg_fleetManager';
            date  = 'October 13, 2022';
            title_plot = 'RAM 1500 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Fastenal 2018 RAM 1500\October 13 2022\trip4934-zoom2');

         case 402
            dataSource = 'vcg_fleetManager';
            date  = 'October 15, 2022';
            title_plot = 'RAM 1500 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Fastenal 2018 RAM 1500\October 15, 2022\trip5110-zoom.csv');

        %%%%%%%%%%%%% PRITCHARD EV001 HIGH BATTERY TEMP ISSUE & AC FAULT %%%%%%%%%%%%%%%%%
        case 501
            dataSource = 'vcg_fleetManager';
            date  = 'Feb 27, 2023';
            title_plot = 'Pritchard EV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Fastenal 2018 RAM 1500\October 15, 2022\trip5110-zoom.csv');
            % turns out fans were not running due to LV issue - LV leaking
            % into ground

        %%%%%%%%%%%%% UNDERSTANDING DCFC ISSUES %%%%%%%%%%%%%%%%%

        %~~~~~~ COLONIAL BUS 1 (PORT AUTHORITY) - Daily DCFC but no issues ~~~~~~%
        case 601
            dataSource = 'vcg_fleetManager';
            date  = 'March 1, 2023';
            title_plot = 'Colonial 1 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Colonial Buses\Colonial 1\March 1, 2023\trip10836.csv');
            

        %%%%%%%%%%%%% V5 THERMAL PERFORMANCE - BV001 %%%%%%%%%%

        case 701
            dataSource = 'vcg_fleetManager';
            date  = 'March 3, 2023';
            title_plot = 'BV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 3, 2023\trip10952.csv');                

        case 702
            dataSource = 'vcg_fleetManager';
            date  = 'March 7, 2023';
            title_plot = 'BV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 7, 2023\trip11216.csv');                

        case 703
            dataSource = 'raptor_brightview';
            date  = 'March 16, 2023';
            title_plot = 'BV001 Drivecycle';
            
            filename (1) = "D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 16, 2023\FRD250_2020_196_067_BV DataLog_2023_03_16_07_20_31.csv";
            filename (2) = "D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 16, 2023\FRD250_2020_196_067_BV DataLog_2023_03_16_09_57_11";
            filename (3) = "D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 16, 2023\FRD250_2020_196_067_BV DataLog_2023_03_16_11_29_36";
            filename (4) = "D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 16, 2023\FRD250_2020_196_067_BV DataLog_2023_03_16_01_40_44";
            
            data = fileStitchProtocol(filename);            
        case 704
            dataSource = 'raptor_brightview';
            date = 'March 23, 2023';
            title_plot = 'BV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\March 23, 2023\FRD250_2020_196_069_BV DataLog_2023_03_23_12_55_33');

        case 705  %% BMS_hi temp issue - only morning drive cycle Friday
            dataSource = 'raptor_brightview';
            date = 'March 24, 2023';
            title_plot = 'BV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Brightview\March 24, 2023\FRD250_2020_196_070_BV DataLog_2023_03_24_11_37_43');

        case 706  %% Chiller Test Data Collection
            dataSource = 'raptor_brightview';
            date = 'April 21, 2023';
            title_plot = 'BV001 Static Test | Chiller Performance';
            load("D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\April 21, 2023\CHILLERDATA_April21.mat");  %% too big file

        %%%%%%%%%%%%% Gear Reducer Data Comparison %%%%%%%%%%

        case 801
            dataSource = 'vcg_fleetManager';
            date  = 'March 31, 2023';
            title_plot = 'Innovation 1 Drivecycle';            
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Innovation 1\March 31, 2023\trip11881-zoom');   
                
        %%%%%%%%%%%%% Flow Switches %%%%%%%%%%
        case 901
            dataSource = 'raptor_brightview';
            date  = 'April 7, 2023';
            title_plot = 'BV001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\BV001\April 7, 2023\FRD250_2020_196_073_BV DataLog_2023_04_07_10_37_01');              

        %%%%%%%%%%%%% Innovation 2 v4 Drive Cycles %%%%%%%%%%
        case 1001
            dataSource = 'vcg_fleetManager';
            date  = 'June 4, 2023';
            title_plot = 'Innovation 2 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Innovation 2\June 4, 2023\trip16087.csv');              

        case 1002           % low SOC crap out, DCFC
            dataSource = 'vcg_fleetManager';
            date  = 'June 3, 2023';
            title_plot = 'Innovation 2 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Innovation 2\June 3, 2023\trip15996.csv');              

        %%%%%%%%%%%%% Breezeline Drive Cycles %%%%%%%%%%
        case 1101
            dataSource = 'vcg_fleetManager_breezeline';
            date  = 'June 6, 2023';
            title_plot = 'BRZ001 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Breezeline\trip19054-zoom.csv');                      

        %%%%%%%%%%%%% Demo 8 Drive Cycle - Battery Heat Load DCFC 0.48C For CAFU %%%%%%%%%%
        case 1201       % DCFC at 75A peak test. Battery started hot. Continuous chilling.
            dataSource = 'raptor_v5_1';
            date  = 'July 11, 2023';
            title_plot = 'Demo 8 DCFC Chargecycle, Set at 75A peak (0.48C)';
%             data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 11, 2023\FRD450_2022_196_159_v5.1_Demo8_2023_07_11_09_03_10.csv');                      
            load("D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 11, 2023\Demo8_DCFCTest_CAFURate_Piece1.mat");
            load("D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 11, 2023\Demo8_DCFCTest_CAFURate_Piece2.mat");
            load("D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 11, 2023\Demo8_DCFCTest_CAFURate_Piece3.mat");
            data = [data_piece1; data_piece2; data_piece3];

        case 1202       % Static test. Battery continuous chilling. 
            dataSource = 'raptor_v5_1';
            date  = 'July 12, 2023';
            title_plot = 'Demo 8 DCFC Chargecycle, Set at 75A peak (0.48C)';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 12, 2023\FRD450_2022_196_159_v5.1_Demo8_2023_07_12_08_52_09_BATTERYCHILLING.csv');                                  

    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    nanCol = nan*ones(size(data,1),1);
    nanCol = array2table(nanCol);
    data = [data nanCol];
    [varTable,dat1] = dataExtract(data,dataSource);
end


