function matU = findU(vecXMesh,vecYMesh,vecTMesh,matU,dblDx,dblDy,dblDt,dblC)
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
intTSize = length(vecTMesh);

for m=2:intTSize
   for i=2:intXSize-1
      for j=2:intYSize-1
          matU(i,j,m+1) = dblDt^2*dblC/dblDx^2*(matU(i+1,j,m) - 2 ...
              *matU(i,j,m) + matU(i-1,j,m)) + ...
              dblDt^2*dblC/dblDy^2*(matU(i,j+1,m) - 2 ...
              *matU(i,j,m) + matU(i,j-1,m)) + 2*matU(i,j,m) - matU(i,j,m-1);
      end
   end
end
end

