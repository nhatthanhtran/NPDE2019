function vecB = load_vector_dn(vecMesh,dblGamma)
intSize = length(vecMesh)-1;
vecB = zeros(intSize,1);
for i = 1:intSize-1
    dblH = vecMesh(i+1) - vecMesh(i);
    dblH1 = vecMesh(i+2) - vecMesh(i+1);
    %Calculate integral from x(i-1) to x(i)
    funV = @(x) 1/dblH*(x-vecMesh(i));
    [x,w]=lgwt(2,vecMesh(i),vecMesh(i+1));
    dblInt = sum(feval(force_dn,x).*feval(funV,x).*w); 
    %Calculate integral from x(i) to x(i+1)
    funV1 = @(x) -1/dblH1*(x-vecMesh(i+1))+1;
    [x1,w1]=lgwt(2,vecMesh(i+1),vecMesh(i+2));
    dblInt1 = sum(feval(force_dn,x1).*feval(funV1,x1).*w1);
    %fill in value
    vecB(i,1) = dblInt + dblInt1;
end
%insert the last row
i = intSize;
dblH = vecMesh(i+1) - vecMesh(i);
%Calculate integral from x(i-1) to x(i)
funV = @(x) 1/dblH*(x-vecMesh(i));
[x,w]=lgwt(2,vecMesh(i),vecMesh(i+1));
dblInt = sum(feval(force_dn,x).*feval(funV,x).*w); 
%fill in value
vecB(i,1) = dblInt+1*feval(sigma_dn,vecMesh(i+1))*dblGamma;
end

