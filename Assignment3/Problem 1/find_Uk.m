function [matUk] = find_Uk(vecXMesh,vecYMesh,vecUk1,vecTMesh,matUk)
[matAx,matAy] = stiff_matrix_2D(vecXMesh,vecYMesh);
[matBx,matBy] = mass_matrix_2D(vecXMesh,vecYMesh);

matA = kron(matAx,matBy) + kron(matBx,matAy);
matB = kron(matBx,matBy);
%matA = dblTStepSize/2*matA;
dblTStepSize = vecTMesh(2) - vecTMesh(1);
%Cholesky fact
[matR] = chol(matB + dblTStepSize/2*matA);
for m=2:length(vecTMesh)
    y = matR'\((matB-dblTStepSize/2*matA)*vecUk1);
    vecUk1 = matR\y;
    i = 1;
    j = 2;
    for k = 1:length(vecUk1)
       if rem(k,length(vecYMesh)-2) == 1
          i = i + 1;
          j = 2;
       end
       matUk(i,j,m) = vecUk1(k);
       j = j + 1;
    end    
end
end

