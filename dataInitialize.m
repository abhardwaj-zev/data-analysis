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
    % some form of cache memory of .mat files will be helpful... some test
    % files in csv format are too big

    % TODO: MAKE THE ROOT DATA LOGS DIRECTORY INTO A VARIABLE SO THE FILE
    % ADDRESSES ARE SHORTER AND MORE INTUITIVE TO TYPE
    % MAYBE MAKE THE ROOT DIRECTORY AN ENVIRONMENT VARIABLE - WON'T MATTER
    % IF WE HAVE A GUI I GUESS

    %%%%%%% INPUT %%%%%%%
    if(nargin==1)
        fileno = varargin{1};
    else
        fileno = 0;                             
    end
    %%%%%%%%%%%%%%%%%%%%%
    dataCleanupFlag = 0;
    fileroot = 'D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\';

    %%%%%%%%%%%%%%%%%%%%%%% FILE DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    switch(fileno)

        %%%%%%%%%% EBERSPAECHER HEATER TESTING - COMPARISON WITH WEBASTO %%%%%%%%%

        %%% Initial Cabin Heating Runs %%%
        case 1
            dataSource = 'raptor';
            date = 'January 4, 2023';
            title_plot = "Cabin Heating, Eberspaecher Heater, Test Cart, Run 0.1 ";
            filename = 'Eberspaecher Heater Testing\InitialCabinHeating_FRD450_2014_196_NetPowerBench2Mods_554_NewModeCheck_2023_01_04_02_26_32.csv';
            filename = [fileroot filename];
            data = readtable(filename);  
        case 2
            dataSource = 'raptor';
            date = 'January 24, 2023';
            title_plot = "Cabin Heating, Eberspaecher Heater, Test Cart, Run 0.2";
            filename = 'Eberspaecher Heater Testing\InitialCabinHeating_FRD450_2014_196_NetPowerBench2Mods_554_NewModeCheck_2023_01_04_03_06_50.csv';
            filename = [fileroot filename];
            data = readtable(filename);  

        %%%%%%%%%% BATTERY HEATING TEST ON TEST CART - DIFFERENT DUTY CYCLES, FLOW RATES %%%%%%%%%%
        case 101
            dataSource = 'raptor';
            date = 'January 30, 2023';
            title_plot = "Battery Heating, Webasto Heater, Test Cart, Run 1";            
            data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\RLOG\MAINHEATING_FRD450_2022_196_597_Webasto Testing e450_2023_01_30_10_44_20.csv');       

        case 102
            dataSource = 'raptor';
            date = 'January 31, 2023';
            title_plot = "Battery Heating, Eberspaecher Heater, Test Cart, Run 1";
            data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\RLOG\FRD450_2014_196_NetPowerBench2Mods_555_Heater Testing Test Cart_2023_01_31_08_58_04');               
        
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

            data = data(1:1109500,:);
        case 1202       % Static test. Battery continuous chilling. 
            dataSource = 'raptor_v5_1';
            date  = 'July 12, 2023';
            title_plot = 'Demo 8 Pack Chilling Test';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 12, 2023\FRD450_2022_196_159_v5.1_Demo8_2023_07_12_08_52_09_BATTERYCHILLING.csv');                                  

        case 1203       % Static test. Battery continuous heating.
            dataSource = 'raptor_v5_1';
            date  = 'July 12, 2023';
            title_plot = 'Demo 8 Pack Heating Test';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 8\July 12, 2023\FRD450_2022_196_159_v5.1_Demo8_2023_07_12_11_10_22_BATTERYHEATING.csv');                                  

        %%%%%%%%%%%%% Demo 14 Drive Cycles %%%%%%%%%%
        case 1301
            dataSource = 'raptor';
            date  = 'July 18, 2023';
            title_plot = 'Demo 14 Drivecycle';
            data = readtable('D:\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\Demo 14\FRD450_2022_196_241_Drivecycle_Demo14_2023_07_18_02_19_48.csv');                      

        %%%%%%%%%%%%% CAFU %%%%%%%%%%
        case 1401           % CAFU 1 Battery Loop Chilling Characterization - Pack 3 Mod 8 Temp 2 has fluctuation problem
            dataSource = 'raptor_CAFU';
            date  = 'October 4, 2023';
            title_plot = 'CAFU 1 | Battery Loop Chilling Characterization';
%             data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU_039_CAFU_2023_10_04_11_41_45_CAFU1_HVBtLoopChilling1Hour.csv');                             
            load("D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU1_HVBtLoopChilling1Hr.mat");
        case 1402           % post coolant fill
            dataSource = 'raptor_CAFU';
            date  = 'October 4, 2023';
            title_plot = 'CAFU 1 | Battery Loop Chilling Characterization | Iteration 2';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU_039_CAFU_2023_10_04_04_21_06_CAFU1_HVBtLoopChilling1Hour_PostCoolantFill.csv');                                       

        case 1403           % CAFU 1 Battery Loop Recirc
            dataSource = 'raptor_CAFU';
            date  = 'October 4, 2023';
            title_plot = 'CAFU 1 | Battery Loop Recirc Characterization | Iteration 1';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Recirc\CAFU_039_CAFU_2023_10_04_02_23_00_CAFU1_HVBtLoopRecirc1Hr25Min.csv');                                       

        case 1404           % CAFU 2 Battery Loop Refg Test THERM 20
            dataSource = 'raptor_CAFU';
            date  = 'October 3, 2023';
            title_plot = 'CAFU 1 | Battery Loop Refg Testing | Iteration 1';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Heat Soak Refrigerant Testing\CAFU_038_CAFU_2023_10_03_03_58_01_HVBtLoopRefgTesting.csv');                                          

        case 1405           % CAFU 2 Battery Loop Refg Test THERM 20
            dataSource = 'raptor_CAFU';
            date  = 'October 12, 2023';
            title_plot = 'CAFU 2 | Battery Loop Refg Testing | Iteration X';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Heat Soak Refrigerant Testing\CAFU_039_CAFU_2023_10_11_03_19_54_CAFU2_THERM20_BattChilling.csv');                                          
        
        case 1406           % CAFU 3 Battery Loop Refg Test THERM 20 - side baffles complete - no panels
            dataSource = 'raptor_CAFU';
            date  = 'October 10, 2023';
            title_plot = 'CAFU 3 | Battery Loop Refg Testing | Iteration X';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Heat Soak Refrigerant Testing\CAFU_041_CAFU_2023_10_10_05_28_57_CAFU3_CHILLING.csv');                                          
            dataCleanupFlag = 1;  % ctdi and ctbi are swapped

        case 1407           % CAFU 2 Battery Loop Refg Test THERM 20 - All panels and baffles, vents with slits on
            dataSource = 'raptor_CAFU';
            date  = 'October 13, 2023';
            title_plot = 'CAFU 2 | Battery Loop Refg Testing | Iteration X';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Heat Soak Refrigerant Testing\CAFU_044_CAFU_2023_10_13_04_13_07_CAFU2_BattChilling.csv');                                          

        case 1408           % CAFU 3 Battery Loop Refg Test THERM 20 - All baffles on, no panels, 2lb charge
            dataSource = 'raptor_CAFU';
            date  = 'October 13, 2023';
            title_plot = 'CAFU 3 | Battery Loop Refg Testing | Iteration X';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Heat Soak Refrigerant Testing\CAFU_044_CAFU_2023_10_13_06_03_32_CAFU3_BattChilling.csv');                                          

        case 1409           % CAFU 1 Battery Loop Chilling Characterization - No Flow
            dataSource = 'raptor_CAFU';
            date  = 'October 18, 2023';
            title_plot = 'CAFU 1 | Battery Loop Chilling Characterization | No Flow';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU_045_CAFU_2023_10_18_02_40_18_CAFU1_BatteryLoop_NoFlowChill.csv');                                          

        
        case 1410           % CAFU 1 Battery Loop Chilling Characterization - 50% Flow
            dataSource = 'raptor_CAFU';
            date  = 'October 18, 2023';
            title_plot = 'CAFU 1 | Battery Loop Chilling Characterization | 50% Flow Chill';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU_045_CAFU_2023_10_18_02_59_33_CAFU1_BatteryLoop_50PerCentFlowChill.csv');                                          

        case 1411           % CAFU 1 Battery Loop Chilling Characterization - 50% Flow
            dataSource = 'raptor_CAFU';
            date  = 'October 18, 2023';
            title_plot = 'CAFU 1 | Battery Loop Chilling Characterization | Full Flow Chill';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\HVBt Loop Chilling\CAFU_045_CAFU_2023_10_18_05_20_18_CAFU1_BatteryLoop_FullFlowChill.csv');                                          

        case 1412
            dataSource = 'raptor_CAFU';
            date = 'October 17, 2023';
            title_plot = 'CAFU 1 | THERM-21 (EL Chilling, Charging Out) | Iteration 3';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_045_CAFU_2023_10_17_04_16_32_CAFU1_ELLoopChargingOut.csv');

        case 1413
            dataSource = 'raptor_CAFU';
            date = 'November 4, 2023';
            title_plot = 'CAFU 2 | THERM-21 (EL Chilling, Charging Out) | Iteration 5';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Nov 4 THERM21 (Not overriden) & THERM26 (Partial charging)\CAFU_080_CAFU_2023_11_04_11_47_06_CAFU2_TwoTeslas_THERM21NormalOperation_NotLimits.csv');           

        case 1414
            dataSource = 'raptor_CAFU';
            date = 'November 4, 2023';
            title_plot = 'CAFU 2 | THERM - 26 (EL + BL Chilling, Charging Out) | Iteration 9';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Nov 4 THERM21 (Not overriden) & THERM26 (Partial charging)\CAFU_080_CAFU_2023_11_04_02_06_37_Model3&Tycan10min_THERM26.csv');                     


        case 1415
            dataSource = 'raptor_CAFU';
            date = 'October 25, 2023';
            title_plot = 'CAFU 1 | THERM - 26 (EL + BL Chilling, Charging Out) | Iteration 8';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Oct 25 THERM 26\CAFU_052_CAFU_2023_10_25_03_38_30_CAFU2_COMBINEDREFGTEST_ROUND2_ONEVEHICLEDROPPEDONCE.csv');                     

        case 1416
            dataSource = 'raptor_CAFU';
            date = 'October 25, 2023';
            title_plot = 'CAFU 1 | THERM - 26 (EL + BL Chilling, Charging Out) | Iteration 7.1';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Oct 25 THERM 26\CAFU_052_CAFU_2023_10_25_02_31_02_CAFU2_COMBINEDREFGTEST_AUDIETRONSTOPPEDNOTWORKING.csv');                                 

         case 1417
            dataSource = 'raptor_CAFU';
            date = 'October 25, 2023';
            title_plot = 'CAFU 1 | THERM - 26 (EL + BL Chilling, Charging Out) | Iteration 7.2';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Oct 25 THERM 26\CAFU_052_CAFU_2023_10_25_02_51_52_CAFU2_COMBINEDREFGTEST_CHARGINGDROPPEDFEWTIMES');                                 

        case 1418
            dataSource = 'raptor_CAFU';
            date = 'November 7, 2023';
            title_plot = 'CAFU 2 | THERM - 26 (EL + BL Chilling, Charging Out) | Iteration 10';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Nov 7 2023 THERM 26\CAFU_082_CAFU_2023_11_07_01_16_40_CAFU2_THERM26_REPEAT_VehsStoppedChargingTwice_2TeslaM3.csv');                                           

        case 1419
            dataSource = 'raptor_CAFU';
            date = 'November 8, 2023';
            title_plot = 'CAFU 2 | THERM - 20 (BL Chilling) | Iteration 22';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_084_CAFU_2023_11_08_12_48_03_CAFU2_THERM20_LowAmbient_BattHeated.csv');                                           

        case 1420
            dataSource = 'raptor_CAFU';
            date = 'November 8, 2023';
            title_plot = 'CAFU 2 | THERM - 26 (BL + EL Chilling) | Iteration 12';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_084_CAFU_2023_11_08_02_56_07_CAFU2_THERM20_LowAmbient_BattHeated_CarsCharging');                                           

        case 1421
            dataSource = 'raptor_CAFU';
            date = 'November 9, 2023';
            title_plot = 'CAFU 2 | THERM - 20 (BL Chilling) | Iteration 23';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_086_CAFU_2023_11_09_01_31_19_CAFU2_THERM20_WITHTWOEXHAUST FANS');                                           

        case 1422
            dataSource = 'raptor_CAFU';
            date = 'November 14, 2023';
            title_plot = 'CAFU 3 | Compressor Fluctuations Characterization - Pre flash with right DAQ step';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_093_New Grid (5)_2023_11_14_05_00_20_CAFU3_CompSpdReqFnlFluctuations');                                           

        case 1423
            dataSource = 'raptor_CAFU';
            date = 'November 14, 2023';
            title_plot = 'CAFU 3 | Compressor Fluctuations Characterization - After flash';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_094_New Grid (5)_2023_11_14_05_23_17_CAFU3_CompSpdReqFnlFluctuations_AfterOnDlyFix_ShutdownAfter3000rpmchange');                                           

        case 1424
            dataSource = 'raptor_CAFU';
            date = 'November 9, 2023';
            title_plot = 'CAFU 2 | THERM - 26 (BL + EL Chilling) | Iteration 13';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_090_CAFU_2023_11_09_02_36_21_CAFU2_THERM26_WITHTWOEXHAUST FANS');                                           

        case 1425
            dataSource = 'raptor_CAFU';
            date = 'November 29, 2023';
            title_plot = 'CAFU  | DCFC In at Protek | Iteration 1';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Protek\CAFU_097_CAFU_2023_11_29_11_32_24.csv');                                           

        case 1426
            dataSource = 'raptor_CAFU';
            date = 'November 30, 2023';
            title_plot = 'CAFU 2 | DCFC In | Iteration 2';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Protek\CAFU_097_CAFU_2023_11_30_11_48_10_CAFU2_DCFCInputLowAmbient_NoBattConditioning.csv');                                                   

        case 1427
            dataSource = 'raptor_CAFU';
            date = 'Dec 13, 2023';
            title_plot = 'CAFU 2 | Protek Testing';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Protek\CAFU_100_CAFU_2023_12_13_09_28_05_CAFU2_OutCharging_Disconnects.csv');                                                   

        %%%%%%%%%%%%% CAFU Heater 2 Cycling Issue %%%%%%%%%%
        case 1501
            dataSource = 'raptor_CAFU';
            date = 'November 6, 2023';
            title_plot = 'CAFU 2 | Battery Heating as Prep for THERM-26';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_080_CAFU_2023_11_06_01_24_23_CAFU2_BattHeating_CheckHVDropFaults_CheckHtr2Fluctuations.csv');                                           

        case 1502
            dataSource = 'raptor_CAFU';
            date = 'November 8, 2023';
            title_plot = 'CAFU 2 | Battery Heating as Prep for THERM-26';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU_084_CAFU_2023_11_08_01_45_47_CAFU2_BattHeatingPostFlashUpdate');                                          

        %%%%%%%%%%%%% CAFU RPG105 Verification for DCDC Temp %%%%%%%%%%
        case 1601
            dataSource = 'raptor_CAFU';
            date = 'January 24, 2024';
            title_plot = 'MCU-3 | LVDCDCs Cooling Temperature Thresholds Update';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\RPG_105_001_Verification\CAFU_105_RPG105_001_Validation_2024_01_24_02_03_34_VerifyPump.csv');                             

         case 1602
            dataSource = 'raptor_CAFU';
            date = 'January 24, 2024';
            title_plot = 'MCU-3 | LVDCDCs Cooling Temperature Thresholds Update';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\RPG_105_001_Verification\CAFU_105_RPG105_001_Validation_2024_01_24_02_05_16_VerifyFan.csv');                             

        %%%%%%%%%%%%% Improve charging rate by fine tuning battery conditioning %%%%%%%%%%
        case 1701
            dataSource = 'portal_CAFU';
            date = 'February 20, 2024';
            title_plot = 'CAFU 1';
            data = readtable('E:\Work One Drive Cache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\Feb 20, 2024\Trip-02-20-2024.csv');                             

        %%%%%%%%%%%%% CAFU 2 Apr 3 White Smoke Issue  Diagnosis %%%%%%%%%%
        case 1801
            dataSource = 'raptor_CAFU';
            date = 'April 8, 2024';
            title_plot = 'CAFU 2 | April 3 Incident Diagnosis';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\CAFU\CAFU 2 Apr 3 Incident White Smoke Issue\CAFU_109_RefgPressureModel_2024_04_08_01_36_16.csv');                             

        %%%%%%%%%%%%% Project PII %%%%%%%%%%
        case 1901
            dataSource = 'portal_CAFU';
            date = 'May 7, 2024';
            title_plot = 'MCU 3 | Project PII';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU 3\Trip-04-26-2024.csv');                             

        case 1902
            dataSource = 'portal_CAFU';
            date = 'April 30, 2024';
            title_plot = 'MCU 3 | Project PII';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU 3\Trip-04-30-2024.csv');                             

        case 1903
            dataSource = 'portal_CAFU';
            date = 'May 2, 2024';
            title_plot = 'MCU 3 | Project PII';
            data = readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU 3\Trip-05-02-2024.csv');                             

        %%%%%%%%%%%%% REFRIGERANT CHARGE TESTING ON ALPHA BUILD 1 %%%%%%%%%%
        case 2001
            dataSource = 'raptor_CAFU';
            date = 'May 15, 2024';
            title_plot = 'MCU240 Gen 1-alpha';
            filename = 'MCU240 Gen 1 Alpha\Build 1\BL_3.0_HS_RPT_1.csv';
            filename = [fileroot filename];
            data = readtable(filename,'HeaderLines',4,'ReadVariableNames',true);         

        case 2002
            dataSource = 'raptor_CAFU';
            date = 'May 15, 2024';
            title_plot = 'MCU240 Gen 1-alpha';
            filename = 'MCU240 Gen 1 Alpha\Build 1\EL_3.0_AMB_RPT_1.CSV';
            filename = [fileroot filename];
            data = readtable(filename,'HeaderLines',4,'ReadVariableNames',true);         

        case 2003
            dataSource = 'raptor_CAFU';
            date = 'May 16, 2024';
            title_plot = 'Electronics Loop Refg Testing, MCU240 Gen 1-alpha';
            filename = 'MCU240 Gen 1 Alpha\Build 1\EL_3.0_HSRPT_1.csv';
            filename = [fileroot filename];
            data = readtable(filename,'HeaderLines',4,'ReadVariableNames',true); 

        %%%%%%%%%%%%% REFRIGERANT CHARGE TESTING ON ALPHA BUILD 2 %%%%%%%%%%
        case 2101
            dataSource = 'raptor_CAFU';
            date = 'June 6, 2024';
            title_plot = 'Battery Loop Refrigerant Test, MCU240 Gen 1-alpha Build 2';
            filename = 'MCU240 Gen 1 Alpha\Build 2\APLHA_REFTEST_CHILL_T1.csv';
            filename = [fileroot filename];
            data = readtable(filename,'HeaderLines',7,'ReadVariableNames',true);         

        case 2102
            dataSource = 'raptor_CAFU';
            date = 'June 11, 2024';
            title_plot = 'Electronics Loop Refrigerant Test, MCU240 Gen 1-alpha Build 2';
            filename = 'MCU240 Gen 1 Alpha\Build 2\061124_APLHA_EL_REF_TEST_1\061124_APLHA_EL_REF_TEST_1\Raptor Logs\HVDCDC_COOL_DOWN.csv';
            filename = [fileroot filename];
            data = readtable(filename);         

        case 2103
            dataSource = 'raptor_CAFU';
            date = 'June 12, 2024';
            title_plot = 'Battery Loop Refrigerant Test, MCU240 Gen 1-alpha Build 2, 2.5lb';
            filename = 'MCU240 Gen 1 Alpha\Build 2\061224_ALPHA_BL_REF_TEST_2\HVDCDC_COOL_DOWN_2.csv';
            filename = [fileroot filename];
            data = readtable(filename); 

        case 2104
            dataSource = 'raptor_CAFU';
            date = 'June 14, 2024';
            title_plot = 'Battery Loop Refrigerant Test, MCU240 Gen 1-alpha Build 2, 2.25lb, Pressure Cycling Disabled';
            filename = 'MCU240 Gen 1 Alpha\Build 2\061424_ALPHA_BL_REF_TEST_4_2.25lbs\BL_COOL_DOWN_2.csv';
            filename = [fileroot filename];
            data = readtable(filename); 

        case 2105
            dataSource = 'raptor_CAFU';
            date = 'June 13, 2024';
            title_plot = 'Battery Loop Refrigerant Test, MCU240 Gen 1-alpha Build 2, 2.25lb, Pressure Cycling Disabled';
            filename = 'MCU240 Gen 1 Alpha\Build 2\061324_ALPHA_BL_REF_TEST_3_2.5lbs\BATT_LOOP_COOL_DOWN_1.csv';
            filename = [fileroot filename];
            data = readtable(filename);  

        case 2106
            dataSource = 'raptor_CAFU';
            date = 'June 11, 2024';
            title_plot = 'Electronics Loop Heat Up Cycle, MCU240 Gen 1-alpha Build 2, 2.8lb, Pressure Cycling Disabled';
            filename = 'MCU240 Gen 1 Alpha\Build 2\061124_APLHA_EL_REF_TEST_1\061124_APLHA_EL_REF_TEST_1\Raptor Logs\HVDCDC_HEAT_UP.csv';
            filename = [fileroot filename];
            data = readtable(filename);  


            
   end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % nanCol is for missing data
    nanCol = nan*ones(size(data,1),1);
    nanCol = array2table(nanCol);
    data = [data nanCol];

    [varTable,dat1] = dataExtract(data,dataSource,fileno,dataCleanupFlag);
end
