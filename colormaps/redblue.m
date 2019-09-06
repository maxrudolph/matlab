function [ cmap ] = redblue()
%make a colormap that goes from red(+) to blue(-) via white
scale = linspace(0,1,32)';
scale = scale.^1.0;
cmap = zeros(64,3);
cmap(1:32,:) =  (scale) * [1 1 1];
cmap(33:64,:) =  (scale(end:-1:1)) * [1 1 1];
cmap(1:32,3) = 1;
cmap(33:64,1) = 1;


end

