%% BL
if(0)
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\Component_Thermocouple_T1.TXT');
    
    ChlrB = data{:,5};      % Chiller inlet
    ChlrT = data{:,6};      % chiller out close to TXV, near TXV bulb
    CompIn = data{:,7};     % compressor inlet
    CondOut = data{:,8};    % condenser out close To TXV (TXV In)
    
    t(1)=0;
    for i=1:length(ChlrB)-1
        t(i+1)=t(i)+10;
    end
end

%% EL
if(0)    
    clear;
    clc;
    close all;
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061124_APLHA_EL_REF_TEST_1\061124_APLHA_EL_REF_TEST_1\Thermocouple Data\THERMOCOUPLE_DATA_1.TXT');
    
    ChlrIn = data{:,5};      % Chiller inlet
    ChlrOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    CompIn = data{:,7};     % compressor inlet
    TXVIn = data{:,8};     % condenser out close To TXV (TXV In)
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061124_APLHA_EL_REF_TEST_1\061124_APLHA_EL_REF_TEST_1\Thermocouple Data\THERMOCOUPLE_DATA_2.TXT');
    
    FanIn = data{:,5};      % Chiller inlet
    FanExh = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061124_APLHA_EL_REF_TEST_1\061124_APLHA_EL_REF_TEST_1\Thermocouple Data\THERMOCOUPLE_DATA_3.TXT');
    
    TXVOut = data{:,5};      % Chiller inlet
    CondOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    t(1)=0;
    for i=1:length(ChlrIn)-1
        t(i+1)=t(i)+10;
    end
    
    t3(1)=0;
    for i=1:length(TXVOut)-1
        t3(i+1)=t3(i)+60;
    end
end

%% BL June 13 - 2.5lb
    clear;
    clc;
    close all;
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061324_ALPHA_BL_REF_TEST_3_2.5lbs\BL_TC1_3');
    
    ChlrIn = data{:,5};      % Chiller inlet
    ChlrOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    CompIn = data{:,7};     % compressor inlet
    TXVIn = data{:,8};     % condenser out close To TXV (TXV In)
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061324_ALPHA_BL_REF_TEST_3_2.5lbs\BL_TC2_3.TXT');
    
    FanIn = data{:,5};      % Chiller inlet
    FanExh = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061324_ALPHA_BL_REF_TEST_3_2.5lbs\BL_TC3_3.TXT');
    
    TXVOut = data{:,5};      % Chiller inlet
    CondOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    t(1)=0;
    for i=1:length(ChlrIn)-1
        t(i+1)=t(i)+10;
    end
    
    t3(1)=0;
    for i=1:length(TXVOut)-1
        t3(i+1)=t3(i)+60;
    end

    %% BL June 14 - 2.25lb
    clear;
    clc;
    % close all;
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061424_ALPHA_BL_REF_TEST_4_2.25lbs\BL_TC1_4');
    
    ChlrIn = data{:,5};      % Chiller inlet
    ChlrOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    CompIn = data{:,7};     % compressor inlet
    TXVIn = data{:,8};     % condenser out close To TXV (TXV In)
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061424_ALPHA_BL_REF_TEST_4_2.25lbs\BL_TC2_4');
    
    FanIn = data{:,5};      % Chiller inlet
    FanExh = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    data=readtable('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\Data Logs\MCU240 Gen 1 Alpha\Build 2\061424_ALPHA_BL_REF_TEST_4_2.25lbs\BL_TC3_4');
    
    TXVOut = data{:,5};      % Chiller inlet
    CondOut = data{:,6};      % chiller out close to TXV, near TXV bulb
    
    t(1)=0;
    for i=1:length(ChlrIn)-1
        t(i+1)=t(i)+10;
    end

