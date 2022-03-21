function matA = stiff_matrix_mixed(vecMesh)
intSize = length(vecMesh);
vecDiag = zeros(intSize+1,1);
vecSub = zeros(intSize+1,1);
vecSup = vecSub;
intNumOfQuad = 2;
for i = 2:intSize-1
    dblH = vecMesh(i) - vecMesh(i-1);
    dblH1 = vecMesh(i+1) - vecMesh(i);
    %Calculate integral from x(i-1) to x(i)
    [x,w]=lgwt(intNumOfQuad,vecMesh(i-1),vecMesh(i));
    dblInt = sum(feval(sigma_mixed,x).*w); 
    %Calculate integral from x(i) to x(i+1)
    [x1,w1]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
    dblInt1 = sum(feval(sigma_mixed,x1).*w1);
    %diag
    vecDiag(i,1) = dblInt*(1/dblH)^2 + dblInt1*(-1/dblH1)^2;
    %subdiag
    vecSub(i-1,1) = dblInt*(1/dblH)*(-1/dblH);
    %superdiag
    vecSup(i+1,1) = dblInt1*(-1/dblH1)*(1/dblH1);
end
%Fill in first row
i = 1;
dblH1 = vecMesh(i+1) - vecMesh(i);
%Calculate integral from x(i) to x(i+1)
[x1,w1]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
dblInt1 = sum(feval(sigma_mixed,x1).*w1);
%diag
vecDiag(i,1) = dblInt1*(-1/dblH1)^2;
%superdiag
vecSup(i+1,1) = vecSub(i,1);
%Fill in last row
i = intSize;
dblH = vecMesh(i) - vecMesh(i-1);
%Calculate integral from x(i-1) to x(i)
[x,w]=lgwt(intNumOfQuad,vecMesh(i-1),vecMesh(i));
dblInt = sum(feval(sigma_mixed,x).*w); 
%diag
vecDiag(i,1) = dblInt*(1/dblH)^2 + 1*1; 
%subdiag
vecSub(i-1,1) = vecSup(i,1);

%Construct sparse matrix A
 matA = spdiags([vecSub vecDiag vecSup],[-1 0 1], intSize,intSize);
end

