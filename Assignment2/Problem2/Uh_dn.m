function [vecResult,celResult]= Uh_dn(vecMesh,dblGamma)
matA = stiff_matrix_dn(vecMesh);
vecB = load_vector_dn(vecMesh,dblGamma);
vecResult = zeros(length(vecMesh),1);
%Need to do Cholesky
%A =R'R. Ax = b : R'Rx = b: y = Rx : R'y = b: R'\b = y: R\y = x
matR = chol(matA);
y = matR'\vecB;
vecResult(2:length(vecMesh),1) = matR\y;
celResult = Uh_continous(vecMesh,vecResult);
end

