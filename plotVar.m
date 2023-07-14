function plotVar(xi,yi,dat1,dat2,varTable,yi_r,date,title_plot,varargin)
    % varargin processing
    if(nargin>8)
        symbols = varargin{1};
    end

    % main
    f = figure;
    f.Position = [400 250 800 650];
    for i=1:length(yi)
        labelI = yi(i)+1;
        if(yi(i)>=1000)
            yi(i)=(yi(i)- 1000) + 2;
            plot(dat2{:,xi},dat2{:,yi(i)},'x-','DisplayName',sprintf('%c',varTable{labelI,2}),'LineWidth',1.5);
        else
            plot(dat1{:,xi},dat1{:,yi(i)},'x-','DisplayName',sprintf('%c',varTable{labelI,2}),'LineWidth',1.5);
        end
        hold on;
        grid on;
        set(gca,'xminorgrid','on','yminorgrid','on')
    end
    for i=1:length(yi_r)
        yyaxis right;
        labelI = yi_r(i)+1;
        if(yi_r(i)>=1000)
            yi_r(i)=(yi_r(i)- 1000) + 2;
            plot(dat2{:,xi},dat2{:,yi_r(i)},'x-','DisplayName',sprintf('%c',varTable{labelI,2}),'LineWidth',1.5);
        else
            plot(dat1{:,xi},dat1{:,yi_r(i)},'x-','DisplayName',sprintf('%c',varTable{labelI,2}),'LineWidth',1.5);
        end
        hold on;
    end

    xlabel(sprintf('%c',varTable{xi+1,2}),'Interpreter','none');
    % ylabel(sprintf('%c',var{yi}),'Interpreter','none');
    title(sprintf('%s | %s ',title_plot,date));
    legend('location','best','Interpreter','none');
end