function vecB = load_vector_dirichlet(vecMesh)
intSize = length(vecMesh)-2;
vecB = zeros(intSize,1);
intNumOfQuad = 2;
for i = 1:intSize
    dblH = vecMesh(i+1) - vecMesh(i);
    dblH1 = vecMesh(i+2) - vecMesh(i+1);
    %Calculate integral from x(i-1) to x(i)
    funV = @(x) 1/dblH*(x-vecMesh(i));
    [x,w]=lgwt(intNumOfQuad,vecMesh(i),vecMesh(i+1));
    dblInt = sum(feval(force_dirichlet,x).*feval(funV,x).*w); 
    %Calculate integral from x(i) to x(i+1)
    funV1 = @(x) -1/dblH1*(x-vecMesh(i+1))+1;
    [x1,w1]=lgwt(intNumOfQuad,vecMesh(i+1),vecMesh(i+2));
    dblInt1 = sum(feval(force_dirichlet,x1).*feval(funV1,x1).*w1);
    %fill in value
    vecB(i,1) = dblInt + dblInt1;
end
end

