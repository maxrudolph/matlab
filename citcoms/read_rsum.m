function [result,x,y] = read_rsum( filename )

fh = fopen(filename,'r');
% result = fread(fh,'float32');
tmp = fscanf(fh,'%e');
x = tmp(1:3:end);
y = tmp(2:3:end);
result = tmp(3:3:end);
result = reshape(result,[360 180]);
x = reshape(x,[360 180]);
y = reshape(y,[360 180]);
fclose(fh);