% function to calculate saturation temperature
function T=get_satTemp_R134a(P)       % P in psi, T returned in degC
    psi_to_pa = 6894.76;
    P = P.* psi_to_pa;
    for i=1:length(P)
        T(i,1)= py.CoolProp.CoolProp.PropsSI('T','P',P(i),'Q',0,'R134a');
    end
    T = T - 273.15;
end