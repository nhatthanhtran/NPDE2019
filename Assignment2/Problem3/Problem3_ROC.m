%Problem 3 Rate of convergent
clc
clear
format short e
dblGamma = 3*exp(2);

dblStart = 0;
dblEnd = 1;
intNumTrials = 5;
funExact = @(x) exp(2*x);
matROC = zeros(intNumTrials,2);
intHId = 1;
intAId = 2;
vecEvalue = 0:(1/1999):1;
for k = 0:intNumTrials-1
    dblH = 2^(-k)/200;
    vecMesh = dblStart:dblH:dblEnd;
    [vecUi,celUh] = Uh_mixed(vecMesh,dblGamma);
    vecExact = feval(funExact,vecMesh)';
    
    matROC(k+1,intHId) = dblH;
    matROC(k+1,intAId) = L2_norm(funExact,vecMesh,celUh,vecEvalue);
end
matROC = rate_of_convergent(matROC);
diary 'problem3_roc_result.txt'
display_ROC(matROC)
diary off