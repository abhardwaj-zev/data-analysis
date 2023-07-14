function [] = outputRequirements(xi,yi,yi_r,varTable,date,title_plot,dat1,dat2,autoGenSystemChoice,autoGenChoiceList)    
 
    switch(autoGenSystemChoice)
        case 0
            display("Autogen OFF ran.");
        case 1      % v4 standard
            autoGenGraphs(autoGenChoiceList,varTable,date,title_plot,dat1,dat2);
            display("Autogen standard ran.");
        case 2      % v5.02 Brightview
            autoGenGraphs_BV001(autoGenChoiceList,varTable,date,title_plot,dat1,dat2);
            display("Autogen v5.02 brightview ran.");
        case 3      % v5.1 Test
            autoGenGraphs_v5_1(autoGenChoiceList,varTable,date,title_plot,dat1,dat2);
            display("Autogen v5.1-Test SR-TorqueTrends Config ran.");        
    end
    
    %%%%%%%%%%%%%%%%%%%%%%% End goal -- variables to plot %%%%%%%%%%%%%%%%%%
%     xaxis = time;
%     yaxis = [hvbt_max, hvbt_avg,hvbt_min,ambttemp];
%     truex = variableReverser(xaxis) ;
%     truey = variableReverser(yaxis);BRZ001
%     plotVar(...,truex,truey,...);
%     plot from data1 and 
%     plot from data2
%     calculate heater power using hvbt voltage and hvbt current in this timeframe
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%
    if(yi)
        plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot);
    end
end