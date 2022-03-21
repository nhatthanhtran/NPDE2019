clc
clear
format short e
dblStart = 0;
dblEnd = 2;
intNumTrials = 5;
funExact = @(x) sin(3*x);
matROC = zeros(intNumTrials,2);
intHId = 1;
intAId = 2;
vecEvalue = 0:(1/999):2;
dblGamma = 3*cos(6);
for k = 0:intNumTrials-1
    dblH = 2^(-k)/400;
    vecMesh = dblStart:dblH:dblEnd;
    [vecUi,celUh] = Uh_dn(vecMesh,dblGamma);    
    matROC(k+1,intHId) = dblH;
    matROC(k+1,intAId) = L2_norm(funExact,vecMesh,celUh,vecEvalue);
end
matROC = rate_of_convergent(matROC);
diary 'problem2_roc_result.txt'
display_ROC(matROC)
diary off