%% �����������Ľ⣨���ڽ������������
%  ������
clear all;clc;
load('shudu.mat');
A=xinshou{1,1};

B=A;
Maxtime=10;%�����������
time=0;
while(~(sum(sum(A))==405||time>Maxtime))   %�������
    for i=1:9
        for j=1:9
            A=select1(A,i,j);
        end
    end
    time=time+1;
end
disp('ԭ����Ϊ:');
B
if time>Maxtime&&sum(sum(A))~=405
    disp('�Բ��𣬽ⲻ����');
else
    disp('�ܼ���������������:');
    disp('�������Ϊ');
    fprintf('%d',time);
    disp('��');
end
clear i j Maxtime ans 
A
