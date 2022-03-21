function [vecUInitial,matUInitial] = u_initial(vecXMesh,vecYMesh,dblC)
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
matUInitial = zeros(intXSize,intYSize);
vecUInitial = zeros((intXSize-2)*(intYSize-2),1);
k = 1;
for i=2:intXSize-1
   for j=2:intYSize-1
       vecUInitial(k) = feval(initial_function(dblC),vecXMesh(i), ...
           vecYMesh(j));
       matUInitial(i,j) = vecUInitial(k);
       k = k + 1;
   end 
end
end

