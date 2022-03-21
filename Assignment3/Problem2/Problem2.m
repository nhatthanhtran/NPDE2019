%Problem 2
clc;clear
dblR = 0.1;
dblC = 4;
dblTStart = 0;
dblTEnd = 1;
dblXStart = 0;
dblXEnd = 1;
dblYStart = 0;
dblYEnd = 1;

dx = 0.01;
dy = 0.01;
dt = dx/4;
vecXMesh = dblXStart:dx:dblXEnd;
vecYMesh = dblYStart:dy:dblYEnd;
vecTMesh = dblTStart:dt:dblTEnd;

matU = initialU(vecXMesh,vecYMesh,vecTMesh,dx,dy,dt,dblC,dblR);
matU = findU(vecXMesh,vecYMesh,vecTMesh,matU,dx,dy,dt,dblC);


figure(1)
handle = surf(vecXMesh,vecYMesh',matU(:,:,1));
ax = gca();
ax.ZLim = ([-0.2 1]);
handle.EdgeColor = 'none';
for i=1:length(vecTMesh)
    handle.ZData = matU(:,:,i);
    pause(0.2)
end