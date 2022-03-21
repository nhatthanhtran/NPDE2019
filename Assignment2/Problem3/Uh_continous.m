function [celResult] = Uh_continous(vecMesh,vecUi)

intSize = length(vecMesh);
celResult = cell(intSize,2);
%fill in first row
dblH1 = vecMesh(2) - vecMesh(1);
celResult{1,2} = @(x) vecUi(1)*(-1/dblH1.*(x-vecMesh(1)) + 1);
%fill in last row
dblH = vecMesh(intSize) - vecMesh(intSize-1);
celResult{intSize,1} = @(x) vecUi(intSize)*(1/dblH.*(x-vecMesh(intSize-1)...
    ));
%fill in all the mesh
for i = 2:intSize-1
    %split the function into 2 branch.
    %First branch is positive, 2nd branch is negative slope
    dblH = vecMesh(i) - vecMesh(i-1);
    dblH1 = vecMesh(i+1) - vecMesh(i);
    funPhi = @(x) vecUi(i)*((1/dblH)*(x-vecMesh(i-1)));
    celResult{i,1} = funPhi; 
    funPhi1 = @(x) vecUi(i)*((-1/dblH1)*(x-vecMesh(i)) + 1);
    celResult{i,2} = funPhi1;
end
end

