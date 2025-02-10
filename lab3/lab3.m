clear;clc;close all;

im=rgb2gray(double(imread('zubr.jpg'))/256);

a=2;
b=2;
subplot(a,b,1);
imshow(im);

k=3;
f=ones(k)/k^2;
fim=imfilter(im,f);
subplot(a,b,2);
imshow(fim);

k=3;
f=-ones(k);
f((k+1)/2,(k+1)/2)=k^2;
fim=imfilter(im,f);
subplot(a,b,3);
imshow(fim);

k=3;
f=-ones(k);
f((k+1)/2,(k+1)/2)=k^2-1;
fim=imfilter(im,f);
subplot(a,b,4);
imshow(fim);

figure;
subplot(a,b,1);
imshow(im);

k=3;
fim=medfilt2(im,[k,k]);
subplot(a,b,2);
imshow(fim);

t=.5;
t=graythresh(im)
bim=im;
bim=imbinarize(im,t);
bim(bim>t)=1;
bim(bim<=t)=0;
subplot(a,b,3);
imshow(bim);

subplot(a,b,4);
t=.55;
bim=im;
bim=imbinarize(im,t);
bim=~bim;
imshow(bim);

close;
close;
figure;

subplot(a,b,1);
imshow(im);

subplot(a,b,2);
t=.55;
bim=im;
bim=imbinarize(im,t);
bim=~bim;
k=3;
bim=medfilt2(bim,[k,k]);
imshow(bim);

ebim=imerode(bim, ones(3));
subplot(a,b,3);
imshow(ebim);

dbim=imdilate(bim, ones(3));
subplot(a,b,4);
imshow(dbim);

subplot(a,b,3);
imo=imopen(bim, ones(3));
imshow(imo);

subplot(a,b,4);
imc=imclose(bim, ones(3));
imshow(imc);


