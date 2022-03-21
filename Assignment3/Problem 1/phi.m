function funPhi = phi(vecMesh,intI)
dblH = vecMesh(intI) - vecMesh(intI-1);
funPhi = @(x) 1/dblH*(x-vecMesh(intI-1)) + ... 
    (-1/dblH)*(x-vecMesh(intI-1)) + 1;
end

