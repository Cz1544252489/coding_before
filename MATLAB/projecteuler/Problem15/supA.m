function [  c ] =supA( m,n )
%   ���ù�ʽ A(m,n)=A(m,n-1)+A(m-1,n)-A(m-1,n-1)
%   ����֪�� A(1,n)=n+1;A(1,m)=m+1;
%   a,b���ڵ�����c�����������ֵ��
if n>1&&m>1
    if m==n
        c=supA(m-1,n)+supA(m,n-1)-supA(m-1,n-1);
    else
        c=supA(m-1,n)+supA(m,n-1);
    end
else
    if m==1||n==1
        if m==1&&n~=1
            c=n+1;
        end
        if n==1&&m~=1
            c=m+1;
        end
        if n==1&&m==1
            c=0;
        end
    end
end

