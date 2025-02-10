clear; clc;
im=imread('ptaki2.jpg');

t=graythresh(im);
bim2=~imbinarize(im(:,:,3));

bim2 = imclose(bim2, ones(5));
bim2 = imopen(bim2, ones(5));

l2=bwlabel(bim2);
n2=max(l2(:));

for i=1:n2
    if sum(l2==i, 'all')<1000
        l2(l2==i)=0;
    end
end

bim2=l2>0;
l2=bwlabel(bim2);
n2=max(l2(:));

f = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M2 = zeros(n2,8);
for i = 1:n2
    for j = 1:8
          M2(i,j) = f{j}(l2==i);
    end
end

M2;

im = imread('ptaki.jpg');

r = imbinarize(im(:,:,1));
b = imbinarize(im(:,:,3));

bim = r | ~b;

bim = imopen(bim, ones(5));
bim = imclose(bim, ones(5));
l = bwlabel(bim);
n = max(l(:));
a = regionprops(l==4, 'all');

M = zeros(n,8);
for i = 1:n
    for j = 1:8
          M(i,j) = f{j}(l==i);
    end
end

M;

ug=M(1:end-2,:)'; %8x5
uj=M2(1:end-2,:)'; %8x4
tg=M(end-1:end,:)'; %8x2
tj=M2(end-1:end,:)'; %8x2
uo=[ones(1,n-2),zeros(1,n2-2)]; %1x9

nn=feedforwardnet;
nn=train(nn, [ug,uj],uo);

nn(M(1,:)');
nn(M2(1,:)');
nn([tg,tj])

