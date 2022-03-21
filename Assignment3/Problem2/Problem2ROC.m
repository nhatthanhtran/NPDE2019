%Problem 2 ROC
clc;clear
dblTStart = 0;
dblTEnd = 1;
dblXStart = 0;
dblXEnd = 1;
dblYStart = 0;
dblYEnd = 1;
dblR = 0.1;
dblC = 4;
matError = zeros(4,2);

for j = 1:4

dx = 2^(-j)/10;
dy = 2^(-j)/10;
dt = dx/4;
vecXMesh = dblXStart:dx:dblXEnd;
vecYMesh = dblYStart:dy:dblYEnd;
vecTMesh = dblTStart:dt:dblTEnd;

matU = initialU(vecXMesh,vecYMesh,vecTMesh,dx,dy,dt,dblC,dblR);
matU = findU(vecXMesh,vecYMesh,vecTMesh,matU,dx,dy,dt,dblC);


dx = 2^(-j-1)/10;
dy = 2^(-j-1)/10;
dt = dx/4;
vecXMesh = dblXStart:dx:dblXEnd;
vecYMesh = dblYStart:dy:dblYEnd;
vecTMesh = dblTStart:dt:dblTEnd;

matU1 = initialU(vecXMesh,vecYMesh,vecTMesh,dx,dy,dt,dblC,dblR);
matU1 = findU(vecXMesh,vecYMesh,vecTMesh,matU1,dx,dy,dt,dblC);
matError(j,1) = dx;
matError(j,2) = mean_square_error(matU1(1:2:end,1:2:end,end)-matU(:,:,end));
end
matError = rate_of_convergent(matError);
display_ROC(matError)





