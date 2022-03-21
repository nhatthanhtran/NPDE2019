function [vecResult,celResult] = Uh_mixed(vecMesh,dblGamma)
matA = stiff_matrix_mixed(vecMesh);
vecB = load_vector_mixed(vecMesh,dblGamma);
%Need to do Cholesky
%A =R'R. Ax = b : R'Rx = b: y = Rx : R'y = b: R'\b = y: R\y = x
matR = chol(matA);
vecResult = matR'\vecB;
vecResult = matR\vecResult;
celResult = Uh_continous(vecMesh,vecResult);
end

