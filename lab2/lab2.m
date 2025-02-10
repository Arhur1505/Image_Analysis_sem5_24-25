clear;clc;close all;

im=imread('zubr.jpg');
im=double(im)/255;
imshow(im);

h=3;
w=2;
subplot(h,w,1);
imshow(im(:,:,1));
subplot(h,w,2);
imhist(im(:,:,1));
subplot(h,w,3);
imshow(im(:,:,2));
subplot(h,w,4);
imhist(im(:,:,2));
subplot(h,w,5);
imshow(im(:,:,3));
subplot(h,w,6);
imhist(im(:,:,3));

for i=1:3
    subplot(3,2,2*i-1);
    imshow(im(:,:,i));
    subplot(3,2,2*i);
    imhist(im(:,:,i));
end

gim=mean(im,3);
imshow(gim);

YUV=[.299,.587,.114];
YUV=permute(YUV,[1,3,2]);
gim=sum(im.*YUV,3);
imshow(gim);

gim=rgb2gray(im);

b=.2;
bim=gim+b;
bim(bim>1)=1;
bim(bim<0)=0;

subplot(3,3,1);
imshow(gim);
subplot(3,3,2);
imhist(gim);
subplot(3,3,4);
imshow(bim);
subplot(3,3,5);
imhist(bim);

subplot(3,3,6);
x=0:1/255:1;
y=x*b;
y(y>1)=1;
y(y<0)=0;
plot(x,y);
ylim([0,1]);

c=.5;
cim=gim*c;
cim(cim>1)=1;
cim(cim<0)=0;
subplot(3,3,7);
imshow(cim);
subplot(3,3,8);
imhist(cim);

subplot(3,3,9);
x=0:1/255:1;
y=x*c;
y(y>1)=1;
y(y<0)=0;
plot(x,y);
ylim([0,1]);

figure;
g=.5;
gaim=gim.^g;
x=0:1/255:1;
y=x.^g;
y(y>1)=1;
y(y<0)=0;
plot(x,y);
ylim([0,1]);
subplot(2,2,1);
imshow(gaim);
subplot(2,2,2);
imhist(gaim);

gim=rgb2gray(im);
him=histeq(gim);
subplot(2,2,1);
imshow(gim);
subplot(2,2,2);
imhist(gim);
subplot(2,2,3);
imshow(him);
subplot(2,2,4);
imhist(him);
