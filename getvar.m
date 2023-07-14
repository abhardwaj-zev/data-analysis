function [var] = getvar(dataSource)
    if(strcmp(dataSource,'vcg'))
        % VCG set of variables
        var = {'second',...
            'VCU_HVACVlvA','VCU_HVACVlvB','VCU_HVACVlvF','VCU_HVACVlvG','VCU_HVACVlvE',...
            'VCU_HVACClntPump1','VCU_HVACClntPump2',...
            'VCU_HVACClngSysMd','VCU_ClntPmp1PWM','VCU_HVACClntPmp2PWM','VCU_HVACVlvD','BMS_IntTemp',...
            'HUD_Odmr','HUD_VehSpd',...
            'Invr_MtrTemp', 'Invr_OilPres','Invr_OilTemp',...
            'Invr_CtrlBrdTemp','Invr_ModA_Temp','Invr_GateDrvrBrd', 'DCDC_Temp',...
            'VCU_HVACIRHtr',...
            'VCU_HVACSATemp','VCU_HVACSBTemp','VCU_HVACSDTemp','VCU_HVACSETemp','VCU_HVACCbnTemp','VCU_HVACSCTemp','VCU_HVACAmbtTemp',...
            'VCU_HVACClntMtrFlwSw','VCU_HVACIRHtrFlowSw',...
            'VCU_HVBtMod1Temp1','VCU_HVBtMod1Temp2','VCU_HVBtMod2Temp1','VCU_HVBtMod2Temp2','VCU_HVBtMod3Temp1','VCU_HVBtMod3Temp2','VCU_HVBtMod4Temp1','VCU_HVBtMod4Temp2',...
            'VCU_HVBtMod5Temp1','VCU_HVBtMod5Temp2','VCU_HVBtMod6Temp1','VCU_HVBtMod6Temp2','VCU_HVBtMod7Temp1','VCU_HVBtMod7Temp2','VCU_HVBtMod8Temp1','VCU_HVBtMod8Temp2',...
            'VCU_HVBtMod9Temp1','VCU_HVBtMod9Temp2',...
            'BMS_AvgTemp','BMS_HiTemp',...
            'HUD_SOC','BMS_PackSOC',...   
            'datetime (UTC)','HUD_HVBtTemp',...
            'BMS_LoTemp','VCU_HVACAC','VCU_HVACFan1','VCU_HVACFan2','OBC_Temp',...
            'Invr_ModBTemp','Invr_ModCTemp',...
            'Invr_PhseACurr','HUD_ActTrq','HUD_ReqTrq','HUD_MtrFdBkTrq'
             };  
    elseif(strcmp(dataSource,'raptor'))
        % Raptor Cal Set of Variable Names
        var = {'Timestamp (ms)',...
            'HVAC_VlvAOut (Bool)','HVAC_VlvBOut (Bool)','HVAC_VlvCOut (Bool)','HVAC_VlvDOut (Bool)','HVAC_VlvEOut (Bool)',...
            'HVAC_ClntPmp1Out (Bool)','HVAC_ClntPmp2Out (Bool)',...
            'HVAC_Md','HVAC_MdA','HVAC_MdB','HVAC_MdC','HVAC_RunMd',...
            'HUD_Odmr (miles)','HUD_VehSpd',...
            'Invr_MtrTemp (degC)','Invr_OilPres (Psi)','Invr_OilTemp (degC)',...
            'Invr_CtrlBrdTemp (degC)','Invr_ModA_Temp (degC)','Invr_GateDrvrBrd (degC)','DCDC_Temp (degC)',...
            'HVAC_IRHtrCttrOut (Bool)',...
            'HVAC_SATemp (deg C)','HVAC_SBTemp (deg C)','HVAC_SDTemp (deg C)','HVAC_SETemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_IRHtrInsdTemp (deg C)','HVAC_AmbTemp (deg C)',...
            'HVAC_MtrFlowSw (Bool)','HVAC_IRHtrFlowSw (Bool)',...
            'HVBt_Mod1Temp1','HVBt_Mod1Temp2','HVBt_Mod2Temp1','HVBt_Mod2Temp2','HVBt_Mod3Temp1','HVBt_Mod3Temp2','HVBt_Mod4Temp1','HVBt_Mod4Temp2',...
            'HVBt_Mod5Temp1','HVBt_Mod5Temp2','HVBt_Mod6Temp1','HVBt_Mod6Temp2','HVBt_Mod7Temp1','HVBt_Mod7Temp2','HVBt_Mod8Temp1','HVBt_Mod8Temp2',...
            'HVBt_Mod9Temp1','HVBt_Mod9Temp2',...
            'BMS_AvgTemp (Celsius)','BMS_HiTemp (Celsius)',...
            'HUD_SOC','BMS_PackSOC (Percent)',...
            'Invr_ModBTemp (degC)','Invr_ModCTemp (degC)',...
            'HV_PTC_HV_DC_Curr (amps)','HV_PTC_HeatReq (%)','HV_PTC_On_Rq (Index)',...
            'HUD_HvBtVltg','HVH_Current_Consumption (Units)'
             };
    elseif(strcmp(dataSource,'vcg_fleetManager')) 
        % VCG set of variables from Fleet Manager
        var = {'second',...
            'VCU_HVACVlvA','VCU_HVACVlvB','VCU_HVACVlvF','VCU_HVACVlvG','VCU_HVACVlvE',...
            'VCU_HVACClntPump1','VCU_HVACClntPump2',...
            'VCU_HVACClngSysMd_ver2','VCU_ClntPmp1PWM','VCU_HVACClntPmp2PWM','VCU_HVACVlvD','BMS_IntTemp',...
            'Odometer','Speed',...
            'Invr_MtrTemp', 'Invr_OilPres','Invr_OilTemp',...
            'Invr_CtrlBrdTemp','Invr_ModA_Temp','Invr_GateDrvrBrd', 'DCDC_Temp',...
            'VCU_HVACIRHtr',...
            'VCU_HVACSATemp','VCU_HVACSBTemp','VCU_HVACSDTemp','VCU_HVACSETemp','VCU_HVACCbnTemp','VCU_HVACSCTemp','VCU_HVACAmbtTemp',...
            'VCU_HVACClntMtrFlwSw','VCU_HVACIRHtrFlowSw',...
            'VCU_HVBtMod1Temp1','VCU_HVBtMod1Temp2','VCU_HVBtMod2Temp1','VCU_HVBtMod2Temp2','VCU_HVBtMod3Temp1','VCU_HVBtMod3Temp2','VCU_HVBtMod4Temp1','VCU_HVBtMod4Temp2',...
            'VCU_HVBtMod5Temp1','VCU_HVBtMod5Temp2','VCU_HVBtMod6Temp1','VCU_HVBtMod6Temp2','VCU_HVBtMod7Temp1','VCU_HVBtMod7Temp2','VCU_HVBtMod8Temp1','VCU_HVBtMod8Temp2',...
            'VCU_HVBtMod9Temp1','VCU_HVBtMod9Temp2',...
            'Average_Temp','BMS_HiTemp',...
            'State_of_Charge','BMS_PackSOC',...   
            'HUD_HVBtTemp','HUD_HVBtTemp',...
            'BMS_LoTemp','VCU_HVACAC','VCU_HVACFan1','VCU_HVACFan2','OBC_Temp',...
            'Invr_ModBTemp','Invr_ModCTemp',...
            'Invr_PhseACurr',...
            'VCU_FlngFlt1Indx','VCU_FlngFlt2Indx','VCU_FlngFlt3Indx','VCU_FlngFlt4Indx','VCU_FlngFlt5Indx','VCU_FlngFlt6Indx'
            };      
    elseif(strcmp(dataSource,'raptor_brightview')) 
        % VCG set of variables from Fleet Manager
        var = {'Timestamp (ms)',...
            'Flt049_HVAC_VlvAOut (Bool)','Flt050_HVAC_VlvBOut (Bool)','Flt051_HVAC_VlvCOut (Bool)','Flt052_HVAC_VlvDOut (Bool)','Flt053_HVAC_VlvEOut (Bool)',...
            'Flt041_HVAC_ClntPmp1Out (Bool)','Flt042_HVAC_ClntPmp2Out (Bool)',...
            'HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq',...
            'HUD_Odmr (miles)','HUD_VehSpd',...
            'Invr_MtrTemp (degC)','Invr_OilPres (Psi)','Invr_OilTemp (degC)',...
            'Invr_CtrlBrdTemp (degC)','Invr_ModA_Temp (degC)','Invr_GateDrvrBrd (degC)','DCDC_Temp (degC)',...
            'DCDC_Temp (degC)',...
            'HVAC_SATemp (deg C)','HVAC_SBTemp (deg C)','HVAC_SCTemp (deg C)','HVAC_SGTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_AmbTemp (deg C)',...
            'HVAC_FlwSw1 (Bool)','HVAC_FlwSw3 (Bool)',...
            'HVBt_Mod1Temp1','HVBt_Mod1Temp2','HVBt_Mod2Temp1','HVBt_Mod2Temp2','HVBt_Mod3Temp1','HVBt_Mod3Temp2','HVBt_Mod4Temp1','HVBt_Mod4Temp2',...
            'HVBt_Mod5Temp1','HVBt_Mod5Temp2','HVBt_Mod6Temp1','HVBt2_Mod6Temp2','HVBt_Mod7Temp1','HVBt_Mod7Temp2','HVBt_Mod8Temp1','HVBt_Mod8Temp2',...
            'HVBt_Mod9Temp1','HVBt_Mod9Temp2',...
            'HUD_SOC','HUD_SOC',...
            'HUD_SOC','HUD_SOC',...
            'Invr_ModBTemp (degC)','Invr_ModCTemp (degC)',...
            'HVH_Current_Consumption (Units)','HVH_Current_Consumption (Units)','HVH_Current_Consumption (Units)',...
            'HUD_HvBtVltg','HVH_Current_Consumption (Units)', 'Flt183_HVAC_ClntPmp3Out (Bool)',...
            'HVBt2_Mod1Temp1','HVBt2_Mod1Temp2','HVBt2_Mod2Temp1','HVBt2_Mod2Temp2','HVBt2_Mod3Temp1','HVBt2_Mod3Temp2','HVBt2_Mod4Temp1','HVBt2_Mod4Temp2',...
            'HVBt2_Mod5Temp1','HVBt2_Mod5Temp2','HVBt2_Mod6Temp1','HVBt2_Mod6Temp2','HVBt2_Mod7Temp1','HVBt2_Mod7Temp2','HVBt2_Mod8Temp1','HVBt2_Mod8Temp2',...
            'HVBt2_Mod9Temp1','HVBt2_Mod9Temp2',...
            'HVAC_ClntFlwMd','HVAC_RfgFlwMd','HVAC_FanMd','HVAC_HeatMd','HVAC_InvrTempMd','HVAC_HVBtTempMd','HVAC_FanTempMd'...
            'HVAC_SDTemp (deg C)','HVAC_SETemp (deg C)','HVAC_SFTemp (deg C)','HVAC_SHTemp (deg C)','HVAC_SITemp (deg C)',...
            'Flt043_HVAC_Fan1Out (Bool)','Flt044_HVAC_Fan2Out (Bool)','HVAC_ACSpdReqFnl (rpm)','HVAC_ACPres (psi)',...
            'HVH_HeaterEnable (boolean)','Invr_MtrSpd (rpm)','HUD_HVBtCurr (AMPS)','HUD_HVBtPwr (KW)',...
            'HVAC_ACEnable','HVAC_BlwrEnbl','VCU_HVACBlwr (Index)','VCU_HVACAC (Index)','VCU_Dfst (Index)','HVAC_HeatReq (Bool)','HVAC_HeatEnbl',...
            'HVAC_FlwSw2 (Bool)'            
            };        
        
    elseif(strcmp(dataSource,'vcg_fleetManager_brightview')) 
        % VCG set of variables from Fleet Manager
        var = {'Timestamp (ms)',...
            'Flt049_HVAC_VlvAOut (Bool)','Flt050_HVAC_VlvBOut (Bool)','Flt051_HVAC_VlvCOut (Bool)','Flt052_HVAC_VlvDOut (Bool)','Flt053_HVAC_VlvEOut (Bool)',...
            'Flt041_HVAC_ClntPmp1Out (Bool)','Flt042_HVAC_ClntPmp2Out (Bool)',...vl
            'HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq',...
            'HUD_Odmr (miles)','HUD_VehSpd',...
            'Invr_MtrTemp (degC)','Invr_OilPres (Psi)','Invr_OilTemp (degC)',...
            'Invr_CtrlBrdTemp (degC)','Invr_ModA_Temp (degC)','Invr_GateDrvrBrd (degC)','DCDC_Temp (degC)',...
            'DCDC_Temp (degC)',...
            'HVAC_SATemp (deg C)','HVAC_SBTemp (deg C)','HVAC_SCTemp (deg C)','HVAC_SGTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_AmbTemp (deg C)',...
            'HVAC_FlwSw1 (Bool)','HVAC_FlwSw3 (Bool)',...
            'HVBt_Mod1Temp1','HVBt_Mod1Temp2','HVBt_Mod2Temp1','HVBt_Mod2Temp2','HVBt_Mod3Temp1','HVBt_Mod3Temp2','HVBt_Mod4Temp1','HVBt_Mod4Temp2',...
            'HVBt_Mod5Temp1','HVBt_Mod5Temp2','HVBt_Mod6Temp1','HVBt2_Mod6Temp2','HVBt_Mod7Temp1','HVBt_Mod7Temp2','HVBt_Mod8Temp1','HVBt_Mod8Temp2',...
            'HVBt_Mod9Temp1','HVBt_Mod9Temp2',...
            'HUD_SOC','HUD_SOC',...
            'HUD_SOC','HUD_SOC',...
            'Invr_ModBTemp (degC)','Invr_ModCTemp (degC)',...
            'VCU_HVHElecCurr','VCU_HVHElecCurr','VCU_HVHElecCurr',...
            'HUD_HvBtVltg','VCU_HVHElecCurr', 'VCU_HVHElecCurr',...
            'HVBt2_Mod1Temp1','HVBt2_Mod1Temp2','HVBt2_Mod2Temp1','HVBt2_Mod2Temp2','HVBt2_Mod3Temp1','HVBt2_Mod3Temp2','HVBt2_Mod4Temp1','HVBt2_Mod4Temp2',...
            'HVBt2_Mod5Temp1','HVBt2_Mod5Temp2','HVBt2_Mod6Temp1','HVBt2_Mod6Temp2','HVBt2_Mod7Temp1','HVBt2_Mod7Temp2','HVBt2_Mod8Temp1','HVBt2_Mod8Temp2',...
            'HVBt2_Mod9Temp1','HVBt2_Mod9Temp2',...
            'HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)'...
            'HVAC_SDTemp (deg C)','HVAC_SETemp (deg C)','HVAC_SFTemp (deg C)','HVAC_SHTemp (deg C)','HVAC_SITemp (deg C)',...
            'VCU_HVACFan1','VCU_HVACFan2','HVAC_ACSpd','HVAC_ACSpdReq',...
            'VCU_HVHActPwr','Invr_MtrSpd','HUD_HVBtCurr','HUD_HVBtPwr (KW)',...
            'HVAC_ACEnable','HVAC_BlwrEnbl','VCU_HVACBlwr (Index)','VCU_HVACAC (Index)','VCU_Dfst (Index)','HVAC_HeatReq (Bool)','HVAC_HeatEnbl',...
            'HVAC_FlwSw2 (Bool)'            
            };

    elseif(strcmp(dataSource,'vcg_fleetManager_breezeline')) % see if this can actually be v5.1 Test Dual ZEUS config instead of being specific to that one vehicle
        % VCG set of variables from Fleet Manager
        var = {'Timestamp (ms)',...
            'Flt049_HVAC_VlvAOut (Bool)','Flt050_HVAC_VlvBOut (Bool)','Flt051_HVAC_VlvCOut (Bool)','Flt052_HVAC_VlvDOut (Bool)','Flt053_HVAC_VlvEOut (Bool)',...
            'Flt041_HVAC_ClntPmp1Out (Bool)','Flt042_HVAC_ClntPmp2Out (Bool)',...vl
            'HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq','HVAC_MdReq',...
            'HUD_Odmr (miles)','HUD_VehSpd',...
            'Invr_MtrTemp (degC)','Invr_OilPres (Psi)','Invr_OilTemp (degC)',...
            'Invr_CtrlBrdTemp (degC)','Invr_ModA_Temp (degC)','Invr_GateDrvrBrd (degC)','DCDC_Temp (degC)',...
            'DCDC_Temp (degC)',...
            'HVAC_SATemp (deg C)','HVAC_SBTemp (deg C)','HVAC_SCTemp (deg C)','HVAC_SGTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_CbnTemp (deg C)','HVAC_AmbTemp (deg C)',...
            'HVAC_FlwSw1 (Bool)','HVAC_FlwSw3 (Bool)',...
            'HVBt_Mod1Temp1','HVBt_Mod1Temp2','HVBt_Mod2Temp1','HVBt_Mod2Temp2','HVBt_Mod3Temp1','HVBt_Mod3Temp2','HVBt_Mod4Temp1','HVBt_Mod4Temp2',...
            'HVBt_Mod5Temp1','HVBt_Mod5Temp2','HVBt_Mod6Temp1','HVBt2_Mod6Temp2','HVBt_Mod7Temp1','HVBt_Mod7Temp2','HVBt_Mod8Temp1','HVBt_Mod8Temp2',...
            'HVBt_Mod9Temp1','HVBt_Mod9Temp2',...
            'HUD_SOC','HUD_SOC',...
            'HUD_SOC','HUD_SOC',...
            'Invr_ModBTemp (degC)','Invr_ModCTemp (degC)',...
            'VCU_HVHElecCurr','VCU_HVHElecCurr','VCU_HVHElecCurr',...
            'HUD_HvBtVltg','VCU_HVHElecCurr', 'VCU_HVHElecCurr',...
            'HVBt2_Mod1Temp1','HVBt2_Mod1Temp2','HVBt2_Mod2Temp1','HVBt2_Mod2Temp2','HVBt2_Mod3Temp1','HVBt2_Mod3Temp2','HVBt2_Mod4Temp1','HVBt2_Mod4Temp2',...
            'HVBt2_Mod5Temp1','HVBt2_Mod5Temp2','HVBt2_Mod6Temp1','HVBt2_Mod6Temp2','HVBt2_Mod7Temp1','HVBt2_Mod7Temp2','HVBt2_Mod8Temp1','HVBt2_Mod8Temp2',...
            'HVBt2_Mod9Temp1','HVBt2_Mod9Temp2',...
            'HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)','HUD_Odmr (miles)'...
            'HVAC_SDTemp (deg C)','HVAC_SETemp (deg C)','HVAC_SFTemp (deg C)','HVAC_SHTemp (deg C)','HVAC_SITemp (deg C)',...
            'VCU_HVACFan1','VCU_HVACFan2','HVAC_ACSpd','HVAC_ACSpdReq',...
            'VCU_HVHActPwr','Invr_MtrSpd','HUD_HVBtCurr','HUD_HVBtPwr (KW)',...
            'HVAC_ACEnable','HVAC_BlwrEnbl','VCU_HVACBlwr (Index)','VCU_HVACAC (Index)','VCU_Dfst (Index)','HVAC_HeatReq (Bool)','HVAC_HeatEnbl',...
            'HVAC_FlwSw2 (Bool)'            
            };
    elseif(strcmp(dataSource,'raptor_v5_1')) 
        % VCG set of variables from Fleet Manager
        var = {'Timestamp (ms)',...
            'HUD_Odmr (miles)','HUD_VehSpd',...
            'HVAC_MdMsmt','HVAC_Md','HVAC_Md_OvrSts','HVAC_Md_OvrVal','HVAC_MdReq',...                              % mode stuff
            'Invr_MtrTemp (degC)','Invr_OilTemp (degC)','Invr_OilPres (Psi)','Invr_MtrSpd (rpm)',...                % motor stuff
            'Invr_CtrlBrdTemp (degC)','Invr_ModA_Temp (degC)','Invr_ModBTemp (degC)','Invr_ModCTemp (degC)','Invr_GateDrvrBrd (degC)',...                         % invr stuff
            'DCDC_Temp (degC)','OBC_Temp (degC)',...
            'HVBt_Mod1Temp1 (deg C)','HVBt_Mod1Temp2 (deg C)','HVBt_Mod2Temp1 (deg C)','HVBt_Mod2Temp2 (deg C)','HVBt_Mod3Temp1 (deg C)','HVBt_Mod3Temp2 (deg C)','HVBt_Mod4Temp1 (deg C)','HVBt_Mod4Temp2 (deg C)',...
            'HVBt_Mod5Temp1 (deg C)','HVBt_Mod5Temp2 (deg C)','HVBt_Mod6Temp1 (deg C)','HVBt_Mod6Temp2 (deg C)','HVBt_Mod7Temp1 (deg C)','HVBt_Mod7Temp2 (deg C)','HVBt_Mod8Temp1 (deg C)','HVBt_Mod8Temp2 (deg C)',...
            'HVBt_Mod9Temp1 (deg C)','HVBt_Mod9Temp2 (deg C)',...
            'HVAC_CTBI (deg C)','HVAC_CTDI (deg C)','HVAC_CTCO (deg C)','HVAC_CTHCI (deg C)','HVAC_CTRHCI (deg C)',...
            'HVAC_SATemp (deg C)','HVAC_SBTemp (deg C)','HVAC_SCTemp (deg C)','HVAC_SDTemp (deg C)','HVAC_SETemp (deg C)','HVAC_SFTemp (deg C)','HVAC_SGTemp (deg C)','HVAC_SHTemp (deg C)',...
            'HVAC_CbnTemp (deg C)','HVAC_AmbTemp (deg C)',...
            'HVAC_ClntFlwMdMeas','HVAC_RfgFlwMdMeas','HVAC_FanMdMeas','HVAC_HeatMdMeas','HVAC_InvrTempMd','HVAC_HVBtTempMd','HVAC_FanTempMd'...
            'Flt049_HVAC_VlvAOut (Bool)','Flt050_HVAC_VlvBOut (Bool)','Flt051_HVAC_VlvCOut (Bool)','Flt052_HVAC_VlvDOut (Bool)','Flt053_HVAC_VlvEOut (Bool)',...
            'Flt041_HVAC_ClntPmp1Out (Bool)','Flt042_HVAC_ClntPmp2Out (Bool)','Flt183_HVAC_ClntPmp3Out (Bool)',...
            'HVAC_InvrFlowSw (Bool)','HVAC_HVHHtrFlowSw (Bool)','HVAC_FlwSw2 (Bool)',...
            'HUD_SOC','HUD_HvBtVltg',...
            'Flt043_HVAC_Fan1Out (Bool)','Flt044_HVAC_Fan2Out (Bool)',...
            'HV_PTC_On_Rq (Index)','HUD_HVBtCurr (AMPS)','HUD_HVBtPwr (KW)',...
            'HVAC_ACSpdReqFnl (rpm)','HVAC_ACPres (psi)',...          
            };  
    end
end