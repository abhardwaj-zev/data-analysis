function [varTable,dat1]= dataExtract(data,dataSource,fileno,dataCleanupflag)
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

        %         if(dataCleanupflag)
%             switch(fileno)
%                 case 
%                     data = swap(data,index,   , );
%             end
%         end
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

        %         if(dataCleanupflag)
%             switch(fileno)
%                 case 
%                     data = swap(data,index,   , );
%             end
%         end

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

        %         if(dataCleanupflag)
%             switch(fileno)
%                 case 
%                     data = swap(data,index,  , );
%             end
%         end
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

%         if(dataCleanupflag)
%             switch(fileno)
%                 case 
%                     data = swap(data,index,   , );
%             end
%         end

        [data{:,index(indexflag_SBtemp)} data{:,index(indexflag_SHtemp)}] = deal(data{:,index(indexflag_SHtemp)},data{:,index(indexflag_SBtemp)});
        [data{:,index(indexflag_SFtemp)} data{:,index(indexflag_SGtemp)}] = deal(data{:,index(indexflag_SGtemp)},data{:,index(indexflag_SFtemp)});
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(1000*60);            % converting timestamps to minutes from ms

     elseif(strcmp(dataSource,'raptor_CAFU'))                % Raptor
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
%                 elseif(strcmp('HVBt1_Mod1Temp1',var{i}))
%                     indexflag_battmodbeg = j;
%                 elseif(strcmp('HVBt1_Mod9Temp2',var{i}))
%                     indexflag_battmodend = j;
%                 elseif(strcmp('HVBt2_Mod1Temp1',var{i}))
%                     indexflag_batt2modbeg = j;
%                 elseif(strcmp('HVBt2_Mod9Temp2',var{i}))
%                     indexflag_batt2modend = j;
%                 elseif(strcmp('HVBt3_Mod1Temp1',var{i}))
%                     indexflag_batt3modbeg = j;
%                 elseif(strcmp('HVBt3_Mod9Temp2',var{i}))
%                     indexflag_batt3modend = j;
%                 elseif(strcmp('HVBt4_Mod1Temp1',var{i}))
%                     indexflag_batt4modbeg = j;
%                 elseif(strcmp('HVBt4_Mod9Temp2',var{i}))
%                     indexflag_batt4modend = j;                  
                elseif(strcmp('TMS_CTBI',var{i}))
                    indexflag_CTBI = j;     
                elseif(strcmp('TMS_CTDI',var{i}))
                    indexflag_CTDI = j;     
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
        data{:,index(indexflag_timestep)} = data{:,index(indexflag_timestep)}./(1000*60);            % converting timestamps to minutes from ms
        data.Properties.VariableNames{1}='Timestamp (min)';
        
        if(dataCleanupflag)
            switch(fileno)
                case 1406
                    data = swap(data,index,indexflag_CTBI,indexflag_CTDI);
            end
        end
    elseif(strcmp(dataSource,'portal_CAFU'))      % PORTAL CAFU PHASE 1
        dataNames = data.Properties.VariableNames;
        j = 1;
        varTable (1,:) = [{'Sl. No.'} {'Var Name'}];
        for i=1:length(var)
            ch=find(strcmp(dataNames,var{i}));
            if(ch)
                index(j) = ch;
    
                if(strcmp('second',var{i}))
                    indexflag_timestep = j;                                         % THIS NEVER SATISIFIES BECAUSE THERE IS NO SECOND IN PORTAL DOWNLOADED DATA
                    var{i} = 'Timestamp (min)';                                     % converting timestamps to minutes from ms
                % elseif(strcmp('VCU_HVACVlvD',var{i})                              % valve naming potentially fixed already
                %         var{i} = 'Ignore';
                % elseif(strcmp('VCU_HVACVlvF',var{i}))
                %         var{i} = 'VCU_HVACVlvC';
                % elseif(strcmp('VCU_HVACVlvG',var{i}))
                %         var{i} = 'VCU_HVACVlvD';             
                elseif(strcmp('BMS1_Mod1_Temp1',var{i}))
                    indexflag_battmodbeg = j;
                elseif(strcmp('BMS1_Mod9_Temp2',var{i}))
                    indexflag_battmodend = j;
                end
                varTable (j+1,:) = [j var(i)];
                j = j+1;
            else
                if(~strcmp(var{i},'second'))       % temp solution to avoid "seconds"
                    display(sprintf('Missing Variables: %s',var{i}));
                    varTable (j+1,:) = [j {sprintf('%s - MISSING',var{i})}];                
                    nanColIndex = size(data,2);
                    index(j)=nanColIndex;         % setting all missing variables to index of nanCol
                    j = j+1;
                end
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

        %         if(dataCleanupflag)
%             switch(fileno)
%                 case 
%                     data = swap(data,index,   , );
%             end
%         end
    end
    dat1 = data(:,index); 
end