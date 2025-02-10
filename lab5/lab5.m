clear;clc;close all;

im=rgb2gray(double(imread('kaczki.jpg'))/255);

t=graythresh(im);
bim=imbinarize(im,t);
bim=~bim;

k=5;
bim=imclose(bim, ones(11));

bim([1,end],:)=1;
bim(:,[1,end])=1;
d=bwdist(bim, 'chessboard');
imshow(d, [0, max(d(:))]);

l=watershed(d);
imshow(label2rgb(l));