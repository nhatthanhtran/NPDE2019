function [vecResult,celResult]= Uh_dirichlet(vecMesh)
matA = stiff_matrix_dirichlet(vecMesh);
vecB = load_vector_dirichlet(vecMesh);
vecResult = zeros(length(vecMesh),1);
%Need to do Cholesky
%A =R'R. Ax = b : R'Rx = b: y = Rx : R'y = b: R'\b = y: R\y = x
matR = chol(matA);
y = matR'\vecB;
vecResult(2:length(vecMesh)-1,1) = matR\y;
celResult = Uh_continous(vecMesh,vecResult);
end

