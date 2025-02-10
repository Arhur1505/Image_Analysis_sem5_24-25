clear; clc;

a=3;
if a>2
    a=1;
elseif a<3
    a=5;
else
    a=7;
end

while a>2
    a=a-1;
end

for i=1:10
    i;
end

%break
%continue

clear; clc;

A=[1,2,3,4; 4,9,16,25; 1,7,2,3; 2,3,5,7];
b=[1;2;3;4];
dA=det(A)
for i=1:4
    c=A;
    c(:,i)=b;
    x(i)=det(c)/dA
end

y=linsolve(A,b)