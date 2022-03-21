function [matB] = mass_matrix_dn(vecMesh)
intSize = length(vecMesh)-2;
vecDiag = zeros(intSize+1,1);
vecSub = zeros(intSize+1,1);
vecSup = vecSub;
intNumOfQuad = 2;
for i = 2:intSize-1
    dblH = vecMesh(i+1) - vecMesh(i);
    funPhi1 = @(x) (-1/dblH*(x-vecMesh(i))+1);
    funPhi2 = @(x) (1/dblH)*(x-vecMesh(i));

    %Calculate integral from x(i-1) to x(i)
    [x,w]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
    
    %Calculate integral from x(i) to x(i+1)
    dblH = vecMesh(i+2) - vecMesh(i+1);
    funPhi3 = @(x) (-1/dblH*(x-vecMesh(i+1))+1);
    funPhi4 = @(x) (1/dblH)*(x-vecMesh(i+1));
    [x1,w1]=lgwt(intNumOfQuad,vecMesh(i+1),vecMesh(i+2));

    %diag
    vecDiag(i,1) = (sum((feval(funPhi2,x).*feval(funPhi2,x)).*w) + sum((feval(funPhi3,x1).*feval(funPhi3,x1)).*w1)); 
    %subdiag
    vecSub(i-1,1) = (sum((feval(funPhi1,x).*feval(funPhi2,x)).*w));
    %superdiag
    vecSup(i+1,1) = (sum((feval(funPhi3,x1).*feval(funPhi4,x1)).*w1));
end
%Fill in first row
i = 1;
dblH = vecMesh(i+1) - vecMesh(i);

funPhi2 = @(x) (1/dblH)*(x-vecMesh(i));

%Calculate integral from x(i-1) to x(i)
[x,w]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
    
%Calculate integral from x(i) to x(i+1)
dblH = vecMesh(i+2) - vecMesh(i+1);
funPhi3 = @(x) (-1/dblH*(x-vecMesh(i+1))+1);
funPhi4 = @(x) (1/dblH)*(x-vecMesh(i+1));
[x1,w1]=lgwt(intNumOfQuad,vecMesh(i+1),vecMesh(i+2));

%diag
vecDiag(i,1) = (sum((feval(funPhi2,x).*feval(funPhi2,x)).*w) + sum((feval(funPhi3,x1).*feval(funPhi3,x1)).*w1));
%superdiag
vecSup(i+1,1) = (sum((feval(funPhi3,x1).*feval(funPhi4,x1)).*w1));

%Fill in last row
i = intSize;
dblH = vecMesh(i+1) - vecMesh(i);
funPhi1 = @(x) (-1/dblH*(x-vecMesh(i))+1);
funPhi2 = @(x) (1/dblH)*(x-vecMesh(i));

%Calculate integral from x(i-1) to x(i)
[x,w]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
    
%Calculate integral from x(i) to x(i+1)
dblH = vecMesh(i+2) - vecMesh(i+1);
funPhi3 = @(x) (-1/dblH*(x-vecMesh(i+1))+1);
[x1,w1]=lgwt(intNumOfQuad,vecMesh(i+1),vecMesh(i+2));
%diag
vecDiag(i,1) = (sum((feval(funPhi2,x).*feval(funPhi2,x)).*w) + sum((feval(funPhi3,x1).*feval(funPhi3,x1)).*w1));
%subdiag
vecSub(i-1,1) = (sum((feval(funPhi1,x).*feval(funPhi2,x)).*w));
%Contruct sparse matA
 matB = spdiags([vecSub vecDiag vecSup],[-1 0 1], intSize,intSize);
end

