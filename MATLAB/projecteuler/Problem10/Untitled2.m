%%
%The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

%%
%Find the sum of all the primes below two million.

%����ʹ��ɸѡ��
%����Ϊlen

clc;clear;
len=10;
box=zeros(1,len);
for i=2:len
    box(i)=i;
end
for i=2:5
    for j=4:len
        if mod(j,i)==0
            box(j)=0;
        end
    end
end
sum(box)