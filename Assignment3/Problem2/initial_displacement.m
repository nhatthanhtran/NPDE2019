function matV = initial_displacement(vecXMesh,vecYMesh,dblR)
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
matV = zeros(intXSize,intYSize);
funCondition = @(x,y) sqrt((x-1/2)^2+(y-1/2)^2);
for i=2:intXSize-1
   for j = 2:intYSize-1
       dblValue =feval(funCondition,vecXMesh(i),vecYMesh(j));
       if dblValue <= dblR
          matV(i,j) = (cos(pi/2*dblValue/dblR))^2;
       end
   end
end
end

