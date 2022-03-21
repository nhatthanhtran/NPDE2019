clc
clear
format short e

dblStart = 0;
dblEnd = 1;
intNumTrials = 5;
funExact = @(x) sin(pi*x);
matROC = zeros(intNumTrials,2);
intHId = 1;
intAId = 2;
vecEvalue = 0:(1/4999):1;
for k = 0:intNumTrials-1
    dblH = 2^(-k)/100;
    vecMesh = dblStart:dblH:dblEnd;
    [vecUi,celUh] = Uh_dirichlet(vecMesh);
    matROC(k+1,intHId) = dblH;
    matROC(k+1,intAId) = L2_norm(funExact,vecMesh,celUh,vecEvalue);
end
matROC = rate_of_convergent(matROC);
diary 'problem1_roc_result.txt'
display_ROC(matROC)
diary off