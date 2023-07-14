% things to specify

% date
% title
% datasource - raptor, vcg, thermistor, etc
% incoming input variables
% data file location
% outputs you want
% specific analysis

clear all;
clc;
close all;
fileno = 1202;
[varTable,date,title_plot,dat1,dataSource] = dataInitialize(fileno);

%%  Derived Quantities

HVBtHighLevelTemps = 1;
HVBt2HighLevelTemps = 0;
EberHtr = 0;
WebastoHtr = 0;
MotorFlowSwitch = 0;

Quantities = [HVBtHighLevelTemps,HVBt2HighLevelTemps,EberHtr,WebastoHtr,MotorFlowSwitch];

OtherInputData = [4];               % flow rate through heater
[varTable,dat2] = getDerivedQuantities(varTable,dat1,dataSource,OtherInputData,Quantities);
% [varTable,dat2] = EberHtrPowerProcessing(varTable,dat1,dataSource);

%%
% output run needs to be a seperate section or function. so that same data
% can be plotted and analyzed multiple ways. So when data is loaded, it
% should become available in the main workspace. And the outputReq function
% can dissect and analyze that

%%%%% AUTOGEN %%%%%
% variable serial numbers only true for full analysis of vehicle data - no missing
% variables

autoGenSystemChoice = 3;        
% 0 - no autogen
% 1 - standard
% 2 - brightview
% 3 - v5.1 
    odo = 1;
    hvacMd = 1;
    motor = 1;
    inv = 1;
    dcdc = 1;
    battery = 1;
    battery_soc_temps = 0;
    battery_soc_temps2 = 0;
    battery2_soc_temps = 0;
autoGenChoiceList = [odo,hvacMd,motor,inv,dcdc,battery,battery_soc_temps,battery_soc_temps2,battery2_soc_temps]; 
xi=1;
yi = [];    yi_r=[];
outputRequirements(xi,yi,yi_r,varTable,date,title_plot,dat1,dat2,autoGenSystemChoice,autoGenChoiceList);
%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%% ONE-OFF %%%%%%%
autoGenSystemChoice = 0; %%%% DO NOT CHANGE THIS. AUTOGEN TURNED OFF FOR ONE-OFF %%%
xi=1;
yi = [26:31,38];    yi_r=[];
outputRequirements(xi,yi,yi_r,varTable,date,title_plot,dat1,dat2,autoGenSystemChoice,autoGenChoiceList);
%%%%%%%%%%%%%%%%%%%%%

% end goal should be -
% load this file, plot these variables, calculate these variables, compare with
% this other dataset
% need to have the variablereverser function implemented so that we can go
% from name to serial no automatically and don't have to worry about serial
% no change everytime