function matExact = exact_solution(vecXMesh,vecYMesh,vecTMesh)
intXSize = length(vecXMesh);
intYSize = length(vecYMesh);
intTSize = length(vecTMesh);
matExact = zeros(intXSize,intYSize,intTSize);
funX = @(x) sin(pi*x);
funY = @(y) sin(pi*y);
funT = @(t) exp(-pi^2*t);
for k =1:intTSize
    matExact(:,:,k) = kron(feval(funX,vecXMesh),feval(funY,vecYMesh)').*feval(funT,vecTMesh(k));   
end
end

