function [L,len] = select( A,i,j )
%   ����ÿ������ܵ�ֵ
%   ������������ڵ��С��к�3*3�����ж��������ܼ����ֵ
L=[1,2,3,4,5,6,7,8,9];
if A(i,j)==0
    %�ж���
    for s=1:9
        for p=1:9
            if A(i,s)==p
                L(p)=0;
            end
        end
    end
    %�ж���
    for s=1:9
        for p=1:9
            if A(s,j)==p
                L(p)=0;
            end
        end
    end
    %�ж�3*3����
    i1=floor((i-1)/3);j1=floor((j-1)/3);
    for s=(3*i1+1):(3*i1+3)
        for t=(3*j1+1):(3*j1+3)
            for p=1:9
                if A(s,t)==p
                    L(p)=0;
                end
            end
        end
    end
    L(L==0)=[];
    len=length(L);
else
    L=0;
    len=0;
end
end
