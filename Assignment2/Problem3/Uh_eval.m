function vecResult = Uh_eval(vecMesh,celUh,vecEvalue)
%Use to evaluate the Uh_continous function
intEIdx = 1;
intUIdx = 1;

intSizeE = length(vecEvalue);
vecResult = zeros(intSizeE,1);
%fill in the first entry
if vecEvalue(1) == vecMesh(1)
    dblPhi = celUh{1,2}(vecEvalue(intEIdx));
    dblPhi1 = celUh{2,1}(vecEvalue(intEIdx));
    vecResult(1) = dblPhi+dblPhi1;
    intEIdx = intEIdx + 1;
end
%fill in the rest
while intEIdx <=intSizeE
    if vecEvalue(intEIdx) > vecMesh(intUIdx)
       intUIdx = intUIdx + 1;
       continue
    end
    dblPhi = celUh{intUIdx,1}(vecEvalue(intEIdx));
    dblPhi1 = celUh{intUIdx-1,2}(vecEvalue(intEIdx));
    vecResult(intEIdx,1) = dblPhi + dblPhi1;
    intEIdx = intEIdx + 1;
end
end

