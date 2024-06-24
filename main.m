% things to specify

% date
% title
% datasource - raptor, vcg, thermistor, etc
% incoming input variables
% data file location
% outputs you want
% specific analysis
clc;
close all;
fileno = 102;
[varTable,date,title_plot,dat1,dataSource] = dataInitialize(fileno);
display("Data Initialized"); !git !git !111
%%  Derived Quantities
clearvars -except varTable date title_plot dat1 dataSource fileno
HVBtHighLevelTemps = 1;
HVBt2HighLevelTemps = 0;
HVBt3HighLevelTemps = 0;
HVBt4HighLevelTemps = 0;

EberHtr = 1;
WebastoHtr = 1;

MotorFlowSwitch = 0;

ModuleHeatCapacityFromEnergyBalance = 0;
PackHeatGen = 0;

BatteryCoolingEffect = 0;
BatteryTempDiagnostic = 0;

BBTemps = 0;
ELCoolingEffect = 0;

Quantities = [HVBtHighLevelTemps,HVBt2HighLevelTemps,EberHtr,WebastoHtr,MotorFlowSwitch,...
    ModuleHeatCapacityFromEnergyBalance,PackHeatGen,HVBt3HighLevelTemps,HVBt4HighLevelTemps,...
    BatteryCoolingEffect,BatteryTempDiagnostic, BBTemps, ELCoolingEffect];

OtherInputData = [4];               % flow rate through heater
[varTable,dat2] = getDerivedQuantities(varTable,dat1,dataSource,OtherInputData,Quantities);
% [varTable,dat2] = EberHtrPowerProcessing(varTable,dat1,dataSource);

%%
% output run needs to be a seperate section or function. so that same data
% can be plotted and analyzed multiple ways. So when data is loaded, it
% should become available in the main workspace. And the outputReq function
% can dissect and analyze that

%%%%%%% AUTOGEN %%%%%
% variable serial numbers only true for full analysis of vehicle data - no missing
% variables

autoGenSystemChoice = 0;        
% 0 - no autogen
% 1 - standard
% 2 - brightview
% 3 - v5.1 
% 4 - CAFU
    odo = 0;
    hvacMd = 1;
    motor = 0;
    inv = 0;
    dcdc = 0;
    batteryHighLevel = 1;
    battery_soc_temps = 0;
    battery_soc_temps2 = 0;
    battery2_soc_temps = 0;
       
    BBTemps  = 1;
    CCSElectrical = 1;
    Compressors = 1;
    BatteryModuleLevel = 0;

autoGenChoiceList = [odo,hvacMd,motor,inv,dcdc,batteryHighLevel,battery_soc_temps,battery_soc_temps2,battery2_soc_temps,BBTemps,CCSElectrical,Compressors,BatteryModuleLevel]; 
xi=1;
yi = [];    yi_r=[];
outputRequirements(xi,yi,yi_r,varTable,date,title_plot,dat1,dat2,autoGenSystemChoice,autoGenChoiceList);
%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%% ONE-OFF %%%%%%%
autoGenSystemChoice = 0; %%%% DO NOT CHANGE THIS. AUTOGEN TURNED OFF FOR ONE-OFF GRAPHS %%%
oneoff = 1;

if(oneoff)
    xi=1;
      
    yi = [41]; yi_r=[];                          % Battery 1 Module High Level Temps
    plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);

    display("Oneoff graphs displayed.");
end
%%%%%%%%%%%%%%%%%%%%%

% end goal should be -
% load this file, plot these variables, calculate these variables, compare with
% this other dataset
% need to have the variablereverser function implemented so that we can go
% from name to serial no automatically and don't have to worry about serial
% no change everytime