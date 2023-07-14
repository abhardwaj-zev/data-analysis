function [varTable,dat1]= dataExtract(data,dataSource)
    var = getvar(dataSource);

    indexflag_timestep = 0;
    
    if(strcmp(dataSource,'vcg')||strcmp(dataSource,'vcg_fleetManager'))      % VCG
        dataNames = data.Properties.VariableNames;
        j = 1;
        varTable (1,:) = [{'Sl. No.'} {'Var Name'}];
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
        if(~indexflag_timestep)                     % when indexflag_timestamp has not been set
            second = transpose(0:1:size(data,1)-1);
            data = [array2table(second) data(:,2:end)];    
            index = [1 index];
            varTabledum = [varTable(1,:); {index(1) 'minutes'}];
            for i=2:size(varTable,1)
                varTabledum = [varTabledum(1:end,:);  {transpose([varTable{i,1}]+1) varTable{i,2}}];
            end
            varTable = varTabledum;
            indexflag_timestep = 1;
            indexflag_battmodbeg = indexflag_battmodbeg + 1;
            indexflag_battmodend = indexflag_battmodend + 1;
            data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(60);            % converting timestamps to minutes from s
        end        
    elseif(strcmp(dataSource,'raptor'))                % Raptor
        dataNames = data.Properties.VariableDescriptions;
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
    elseif(strcmp(dataSource,'raptor_brightview'))                % Raptor
        dataNames = data.Properties.VariableDescriptions;
        j = 1;
        varTable (1,:) = [{'Sl. No.'} {'Var Name'}];
        for i=1:length(var)
            ch=find(strcmp(dataNames,var{i}));
            if(ch)
                index(j) = ch;
    
                if(strcmp('Timestamp (ms)',var{i}))
                    indexflag_timestep = j;
                    var{i} = 'Timestamp (min)';                                     % converting timestamps to minutes from ms
%                 elseif(strcmp('HVBt_Mod1Temp1',var{i}))
%                     indexflag_battmodbeg = j;
%                 elseif(strcmp('HVBt_Mod9Temp2',var{i}))
%                     indexflag_battmodend = j;

                %%%%%%%%% pins mixed up on BV001 currently - untill pins
                %%%%%%%%% are fixed either in harness or in software %%%%
                elseif(strcmp('HVBt2_Mod1Temp1',var{i}))
                     indexflag_batt2(1) = j;
                elseif(strcmp('HVBt2_Mod1Temp2',var{i}))
                     indexflag_batt2(2) = j;
                elseif(strcmp('HVBt2_Mod2Temp1',var{i}))
                     indexflag_batt2(3) = j;
                elseif(strcmp('HVBt2_Mod2Temp2',var{i}))
                     indexflag_batt2(4) = j;
                elseif(strcmp('HVBt2_Mod3Temp1',var{i}))
                     indexflag_batt2(5) = j;


                elseif(strcmp('HVAC_SDTemp (deg C)',var{i}))
                     indexflag_STemp(1) = j;
                elseif(strcmp('HVAC_SETemp (deg C)',var{i}))
                     indexflag_STemp(2) = j;
                elseif(strcmp('HVAC_SFTemp (deg C)',var{i}))
                     indexflag_STemp(3) = j;
                elseif(strcmp('HVAC_SHTemp (deg C)',var{i}))
                     indexflag_STemp(4) = j;
                elseif(strcmp('HVAC_SITemp (deg C)',var{i}))
                     indexflag_STemp(5) = j;
                end
                
                varTable (j+1,:) = [j var(i)];
                j = j+1;
            else
                display(sprintf('Missing Variables: %s',var{i}));
            end            
        end 
        
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(1000*60);            % converting timestamps to minutes from ms
    

        % fixing brightview sensor mixup - needed on March 16, 2023 dataset
        for k=1:5
            Dum = [data(:,index(indexflag_STemp(k))) data(:,index(indexflag_batt2(k)))];
            data(:,index(indexflag_batt2(k))) = Dum(:,1);
            data(:,index(indexflag_STemp(k))) = Dum(:,2);
        end
    elseif(strcmp(dataSource,'raptor_v5_1'))                % Raptor
        dataNames = data.Properties.VariableDescriptions;
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
                elseif(strcmp('HVAC_SBTemp (deg C)',var{i}))
                    indexflag_SBtemp = j;
                elseif(strcmp('HVAC_SHTemp (deg C)',var{i}))
                    indexflag_SHtemp = j;
                elseif(strcmp('HVAC_SFTemp (deg C)',var{i}))
                    indexflag_SFtemp = j;
                elseif(strcmp('HVAC_SGTemp (deg C)',var{i}))
                    indexflag_SGtemp = j;
                end
                
                varTable (j+1,:) = [j var(i)];
                j = j+1;
            else
                display(sprintf('Missing Variables: %s',var{i}));
                varTable (j+1,:) = [j {sprintf('%s - MISSING',var{i})}];                
                nanColIndex = size(data,2);
                index(j)=nanColIndex;         % setting all missing variables to index of nanCol
                j = j+1;
            end            
        end

        [data{:,index(indexflag_SBtemp)} data{:,index(indexflag_SHtemp)}] = deal(data{:,index(indexflag_SHtemp)},data{:,index(indexflag_SBtemp)});
        [data{:,index(indexflag_SFtemp)} data{:,index(indexflag_SGtemp)}] = deal(data{:,index(indexflag_SGtemp)},data{:,index(indexflag_SFtemp)});
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(1000*60);            % converting timestamps to minutes from ms
    end

    dat1 = data(:,index); 
end