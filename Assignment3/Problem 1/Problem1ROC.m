clc;clear
dblC = 1;
dblXStart = 0;
dblXEnd = 1;
dblYStart = 0;
dblYEnd = 1;
dblTStart = 0;
dblTEnd = 0.5;
format short e
matError = zeros(6,2);
for j=0:5
   h = 2^(-j)/10;
   dt = h;
   vecXMesh = dblXStart:h:dblXEnd;
   vecYMesh = dblYStart:h:dblYEnd;
   vecTMesh = dblTStart:dt:dblTEnd;
   intXSize = length(vecXMesh);
   intYSize = length(vecYMesh);
   intTSize = length(vecTMesh);
   matUk = zeros(intXSize,intYSize,intTSize);
   [vecUInitial,matUk(:,:,1)] = u_initial(vecXMesh,vecYMesh,dblC);
   [matUk] = find_Uk(vecXMesh,vecYMesh,vecUInitial,vecTMesh,matUk);
   matExact = exact_solution(vecXMesh,vecYMesh,vecTMesh);
   matError(j+1,1) = h;
   matError(j+1,2) = mean_square_error(matUk,matExact);
   matError(j+1,4) = max(max(max(abs(matUk-matExact))));
end
matError = rate_of_convergent(matError);
display_ROC(matError)
