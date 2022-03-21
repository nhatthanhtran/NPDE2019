function dblError = mean_square_error(matUk,matExact)
[intXSize,intYSize,intTSize] = size(matUk);

matError = (matUk - matExact).^2;
dblError = 0;
for k =1:intTSize
   dblError = dblError + sqrt(sum(sum(matError(:,:,k))))/intXSize;
end
dblError = dblError/intTSize;
end

