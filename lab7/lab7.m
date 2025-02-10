clear; clc;
im = imread('ptaki.jpg');

r = imbinarize(im(:,:,1));
b = imbinarize(im(:,:,3));

bin = r | ~b;

bin = imopen(bin, ones(5));
bin = imclose(bin, ones(5));
l = bwlabel(bin);
n = max(l(:));
a = regionprops(l==4, 'all');

f = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M = zeros(9,8);
for i = 1:9
    for j = 1:8
          M(i,j) = f{j}(l==i);
    end
end

M;

mg=mean(M);
sg = std(M);
c=(M - mg)./sg;

for i=1:n
  tM=M;
  tM(i,:)=[];
  mg=mean(tM);
  sg = std(tM);
  c(i,:)=(M(i,:)-mg)./sg;
end

tM;

imshow(bin);
figure;

test=abs(c)>3;
test=sum(test,2)>1;
M(test,:);
indx=find(test);
bin(l==indx)=3;
M=(indx,:)=[];



