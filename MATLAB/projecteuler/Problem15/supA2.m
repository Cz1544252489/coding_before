function [  c ] =supA2( m,n,p )
%   ���ù�ʽ A(m,n)=A(m,n-1)+A(m-1,n)-A(m-1,n-1)
%   ����֪�� A(1,n)=n+1;A(1,m)=m+1;
%   a,b���ڵ�����c�����������ֵ��
load('A110','A');
if n<p+1&&m<p+1
    c=A(m,n);
else
    if m==n
        c=supA2(m-1,n,p)+supA2(m,n-1,p)-supA2(m-1,n-1,p);
    else
        c=supA2(m-1,n,p)+supA2(m,n-1,p);
    end
end
end

