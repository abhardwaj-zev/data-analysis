dumdat = readmatrix('D:\ZEVX_OneDriveCache\OneDrive - ZEVX\OneDrive - ZEV\SOC_vs_Temp_Charging.xlsx');

temp = dumdat(2:end,1);
soc = dumdat(1,2:end);
ccl = dumdat(2:end,2:end);

[tempMesh,socMesh] = meshgrid(temp,soc);

CCLFunc =  griddedInterpolant(tempMesh',socMesh',ccl);

[Xq,Yq] = ndgrid(-25:1:45,5:1:90);
CCLq = CCLFunc(Xq,Yq);
figure;
contourf(Xq,Yq,CCLq,[68 75 88],'ShowText','on');
xlabel('Temperature (°C)');
ylabel('SOC (%)');
zlabel('CCL (A)');
title('CCL Characteristics');
hold on;
% zplane = 75*ones(size(Xq));
% 
% contourf(Xq,Yq,zplane);

% check data point for 75A at 40C and 45C also. For max possible continuous charging,
% we need to surf on the 75A contour line.