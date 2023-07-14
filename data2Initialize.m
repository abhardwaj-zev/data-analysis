%% Initialize data2 for analysis
% there has to be a separate data2Initialize which is either stitched onto
% data1 or used for comparison
% the list of files can be a text file later on or maybe CSV that the test
% engineer fills out after testing

function data2Initialize()
    global data date title_plot dataSource;

    fileno = 1;

    switch(fileno)
        case 1
            dataSource = 'raptor';
            date = 'January 25, 2023';
            title_plot = "Battery Heating, Eberspaecher Heater, Test Cart, Run ";
            data=readtable('RLOG\FRD450_2014_196_NetPowerBench2Mods_555_Heater Testing Test Cart_2023_01_25_12_55_39'); 
    end
  
    dataExtract();
end


