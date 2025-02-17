clear;clc;close all;

im=rgb2gray(double(imread('opera.jpg'))/255);
fim=fft2(im);
A=abs(fim);
phi=angle(fim);
%imshow(fftshift(log(A)), [0,log(max(A(:)))]);

%A(1,8)=10^5;
z=A.*exp(1i*phi);
im2=abs(ifft2(z));
%imshow(im2);
%imshow(phi,[-pi, pi]);

k=7;
f=ones(k)/k^2;
[h,w]=size(im);
ff=fft2(f,h,w);
fA=abs(ff);
fphi=angle(ff);
%imshow(log(fA), log([min(fA(:)), max(fA(:))]));

%imshow(fphi,[-pi, pi]);

z=A.*fA.*exp(1i*phi);
im2=abs(ifft2(z));
%imshow(im2);

k=50;
m=zeros(h,w);
m([1:k,end-k:end],[1:k, end-k:end])=1;
%imshow(m);

z=m.*A.*exp(1i*phi);
im2=abs(ifft2(z));
imshow(im2);