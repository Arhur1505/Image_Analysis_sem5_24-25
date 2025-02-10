clear;clc;close all;

im=imread('ptaki.jpg');

r=imbinarize(im(:,:,1));
b=imbinarize(im(:,:,3));

bim=r|~b;
bim=imopen(bim, ones(5));
bim=imclose(bim, ones(5));

l=bwlabel(bim);
n=max(l(:));

a=regionprops(l==4, 'all');

f={@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, AO5RMalinowska, AO5RShape};
featuresMatrix = zeros(9, 8);

for i = 1:9
    for j = 1:8
        featuresMatrix(i, j) = f{j}(l==i);
    end
end

featuresMatrix;