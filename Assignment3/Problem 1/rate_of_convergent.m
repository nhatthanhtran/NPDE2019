function matROC = rate_of_convergent(matError)
intNumRows = size(matError,1);
intEId = 2;
intRId = 3;
vecZeros = zeros(intNumRows, 1);
matROC = matError;
matROC = [matROC vecZeros];
matROC(1,intRId) = NaN;
for i=2:intNumRows
    matROC(i,intRId) = log(abs(matROC(i-1,intEId)/matROC(i,intEId)))/log(2);
    matROC(i,5) = log(abs(matROC(i-1,4)/matROC(i,4)))/log(2);
end
end

