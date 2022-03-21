function dblResult = L2_norm(funExact,vecMesh,celUh,vecEvalue)

intSize = length(vecEvalue);

dblResult = 0;
for i=1:intSize-1
a = vecEvalue(i);
b = vecEvalue(i+1);
    dblResult = dblResult + (b-a)*(abs(Uh_eval(vecMesh,celUh,[a]) ...
        - feval(funExact,[a])).^2 + abs(Uh_eval(vecMesh,celUh,[b])...
        - feval(funExact,[b])).^2)/2;
end
dblResult = sqrt(dblResult);    
end

