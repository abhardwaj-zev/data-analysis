function [varTable,dat2] = EberHtrPowerProcessing(varTable,dat1,dataSource)
    var = getvar(dataSource);

    if(strcmp(dataSource,'vcg'))      % VCG
        j = 1;       
        for i=1:length(var)
            ch=find(strcmp(dataNames,var{i}));
            if(ch)
                index(j) = ch;
    
                if(strcmp('second',var{i}))
                    indexflag_timestep = j;
                    var{i} = 'Timestamp (min)';                                     % converting timestamps to minutes from ms
                elseif(strcmp('VCU_HVACVlvD',var{i}))
                        var{i} = 'Ignore';
                elseif(strcmp('VCU_HVACVlvF',var{i}))
                        var{i} = 'VCU_HVACVlvC';
                elseif(strcmp('VCU_HVACVlvG',var{i}))
                        var{i} = 'VCU_HVACVlvD';
                elseif(strcmp('VCU_HVACSCTemp',var{i}))
                        var{i} = 'HVAC_IRHtrInsdTemp (deg C)';
                elseif(strcmp('VCU_HVBtMod1Temp1',var{i}))
                    indexflag_battmodbeg = j;
                elseif(strcmp('VCU_HVBtMod9Temp2',var{i}))
                    indexflag_battmodend = j;
                end
                varTable (j+1,:) = [j var(i)];
                j = j+1;
            else
                display(sprintf('Missing Variables: %s',var{i}));
            end    
        end
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(60);            % converting timestamps to minutes from s
    elseif(strcmp(dataSource,'raptor'))                % Raptor
        j = 1;
        varTable (1,:) = [{'Sl. No.'} {'Var Name'}];
        for i=1:length(var)
            ch=find(strcmp(dataNames,var{i}));
            if(ch)
                index(j) = ch;
    
                if(strcmp('Timestamp (ms)',var{i}))
                    indexflag_timestep = j;
                    var{i} = 'Timestamp (min)';                                     % converting timestamps to minutes from ms
                elseif(strcmp('HVBt_Mod1Temp1',var{i}))
                    indexflag_battmodbeg = j;
                elseif(strcmp('HVBt_Mod9Temp2',var{i}))
                    indexflag_battmodend = j;
                end
                varTable (j+1,:) = [j var(i)];
                j = j+1;
            else
                display(sprintf('Missing Variables: %s',var{i}));
            end    
        end
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(1000*60);            % converting timestamps to minutes from ms
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    

end



