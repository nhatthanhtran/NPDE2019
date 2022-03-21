function dblError = mean_square_error(matError)
[intXSize,intYSize,intTSize] = size(matError);

matError = (matError).^2;
dblError = 0;
for k =1:intTSize
   dblError = dblError + sqrt(sum(sum(matError(:,:,k))))/intXSize;
end
dblError = dblError/intTSize;
end

