function dblResult = L2_norm(funExact,vecMesh,celUh,vecEvalue)

intSize = length(vecEvalue);
dblResult = 0;
for i=1:intSize-1
dbla = vecEvalue(i);
dblb = vecEvalue(i+1);
    dblResult = dblResult + (dblb-dbla)*(abs(Uh_eval(vecMesh,celUh, ...
        [dbla]) - feval(funExact,[dbla])).^2 + abs(Uh_eval(vecMesh, ...
        celUh,[dblb]) - feval(funExact,[dblb])).^2)/2;
end
dblResult = sqrt(dblResult);    
end

