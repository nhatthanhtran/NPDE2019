function [matAx,matAy]= stiff_matrix_2D(vecXMesh,vecYMesh)
matAx = stiff_matrix_dn(vecXMesh);
matAy = stiff_matrix_dn(vecYMesh);
end

