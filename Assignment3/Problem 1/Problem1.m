%
clc;clear
format short e
dblC = 1;
dblXStart = 0;
dblXEnd = 1;
dblYStart = 0;
dblYEnd = 1;
dblXStep = 1/100;
dblYStep = 1/100;
dblTStart = 0;
dblTEnd = 0.5;
dblTStep = 1/100;
vecXMesh = dblXStart:dblXStep:dblXEnd;
vecYMesh = dblYStart:dblYStep:dblYEnd;
vecTMesh = dblTStart:dblTStep:dblTEnd;
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
intTSize = length(vecTMesh);
matUk = zeros(intXSize,intYSize,intTSize);
matExact = exact_solution(vecXMesh,vecYMesh,vecTMesh);
[vecUInitial,matUk(:,:,1)] = u_initial(vecXMesh,vecYMesh,dblC);
[matUk] = find_Uk(vecXMesh,vecYMesh,vecUInitial,vecTMesh,matUk);
%surf k
veck = [1 2 11];
for j=1:3
figure(j)
handle = surf(vecXMesh,vecXMesh,matUk(:,:,veck(j)));
handle.EdgeColor = 'none';
title("k="+ num2str(veck(j)-1));
xlabel("x");
ylabel("y");
zlabel("U(x,y)");
ax = gca;
ax.ZLim = ([0 1]); 
end

%movie
figure(4)
handle = surf(vecXMesh,vecXMesh,matUk(:,:,1));
handle.EdgeColor = 'none';
ax = gca;
ax.ZLim = ([0 1]);
for i=1:length(vecTMesh)
    handle.ZData = matUk(:,:,i);
    pause(0.2);
end

disp('Max nodal error:')
max(max(max(abs(matUk-matExact))))
disp('Mean squared error: ')
mean_square_error(matUk,matExact)
