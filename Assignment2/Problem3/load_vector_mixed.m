function vecB = load_vector_mixed(vecMesh,dblGamma)
intSize = length(vecMesh);
vecB = zeros(intSize,1);
for i = 2:intSize-1
    dblH = vecMesh(i) - vecMesh(i-1);
    dblH1 = vecMesh(i+1) - vecMesh(i);
    %Calculate integral from x(i-1) to x(i)
    funV = @(x) 1/dblH*(x-vecMesh(i-1));
    [x,w]=lgwt(2,vecMesh(i-1),vecMesh(i));
    dblInt = sum(feval(force_mixed,x).*feval(funV,x).*w); 
    %Calculate integral from x(i) to x(i+1)
    funV1 = @(x) -1/dblH1*(x-vecMesh(i))+1;
    [x1,w1]=lgwt(2,vecMesh(i),vecMesh(i+1));
    dblInt1 = sum(feval(force_mixed,x1).*feval(funV1,x1).*w1);
    %fill in value
    vecB(i,1) = dblInt + dblInt1;
end
%fill in the first column
i = 1;
dblH1 = vecMesh(i+1) - vecMesh(i);
%Calculate integral from x(i) to x(i+1)
funV1 = @(x)-1/dblH1*(x-vecMesh(i)) + 1;
[x1,w1]=lgwt(2,vecMesh(i),vecMesh(i+1));
dblInt1 = sum(feval(force_mixed,x1).*feval(funV1,x1).*w1); 
vecB(1,1) = dblInt1 - 1*2*1;
%fill in the last row
i = intSize;
dblH = vecMesh(i) - vecMesh(i-1);
%Calculate integral from x(i-1) to x(i)
funV = @(x) 1/dblH*(x-vecMesh(i-1));
[x,w]=lgwt(2,vecMesh(i-1),vecMesh(i));
dblInt = sum(feval(force_mixed,x).*feval(funV,x).*w); 
%fill in value
vecB(i,1) = dblInt+dblGamma*1;
end

