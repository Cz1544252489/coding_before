function [ n ] = finishat1( m )
% n �� n/2 (n is even)
% n �� 3n + 1 (n is odd)

if mod(m,2)==0
    n=m/2;
else
    n=3*m+1;
end
end

