function dblResult = L2_norm(funExact,vecMesh,celUh,vecEvalue)

intSize = length(vecEvalue);
intNumQuad = 2;
dblResult = 0;
for i=1:intSize-1
%     [x,w] = lgwt(intNumQuad,vecEvalue(i),vecEvalue(i+1));
%     dblResult = dblResult + sum((Uh_eval(vecMesh,celUh,x)...
%         - feval(funExact,x)).^2.*w);
a = vecEvalue(i);
b = vecEvalue(i+1);
    dblResult = dblResult + (b-a)*(abs(Uh_eval(vecMesh,celUh,[a]) - feval(funExact,[a])).^2 + abs(Uh_eval(vecMesh,celUh,[b]) - feval(funExact,[b])).^2)/2;
end
dblResult = sqrt(dblResult);    
end

