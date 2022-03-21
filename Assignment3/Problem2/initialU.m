function matU = initialU(vecXMesh,vecYMesh,vecTMesh,dblDx,dblDy,dblDt, ...
    dblC,dblR)
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
intTSize = length(vecTMesh);
matU = zeros(intXSize,intYSize,intTSize);
m = 1;
matU(:,:,m) = initial_displacement(vecXMesh,vecYMesh,dblR);
for i=2:intXSize-1
  for j=2:intYSize-1
%       matU(i,j,m+1) = matU(i,j,m) + dblDt*((matU(i,j,m) - matU(i-1,j,m)) ...
%           /dblDx + (matU(i,j,m) - matU(i,j-1,m))/dblDy) + dblDt^2*dblC^2 ...
%           /2*((matU(i+1,j,m) - 2*matU(i,j,m) + matU(i-1,j,m))/dblDx^2 + ...
%           (matU(i,j+1,m) - 2*matU(i,j,m) + matU(i,j-1,m))/dblDy^2);
      matU(i,j,m+1) = matU(i,j,m) + dblDt^2*dblC ...
          /2*((matU(i+1,j,m) - 2*matU(i,j,m) + matU(i-1,j,m))/dblDx^2 + ...
          (matU(i,j+1,m) - 2*matU(i,j,m) + matU(i,j-1,m))/dblDy^2);  
  end
end
end

