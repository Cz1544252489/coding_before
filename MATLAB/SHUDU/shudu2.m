%% �����������Ľ⣨���ڽ����ϰ������
%  ������
clear all;clc;
load('shudu.mat');
A=jianxi{2,2};

B=A;
Maxtime=50;%�����������
time=0;%����ʵʱ����
flag=0;%�жϣ�������һ�κ�����û�б仯��ʱ���������

%��whileѭ����һ��������
%��sum(sum(A))==405��tiem>Maxtime��flag����һ������
%��sum(...)==405||time>...||flagΪ�棬���Ϊ�٣���ֹͣ����
while(~(sum(sum(A))==405||time>Maxtime||flag))   %�������
    C=A;
    A=select2(A);
    time=time+1;
    if sum(sum(abs(C-A)))==0
       flag=1; %�������û�б仯����flagΪ1
    end
end
%��������� flag=1  ˵����������û�дﵽ
%��������� time=Maxtime+1  ˵���������������Ӧ��������������
%��������� flag=0����time<=Maxtime  
%˵����ɼ���ﵽҪ�����пո����������ֲ��ҷ���Ҫ��
disp('����Ϊ');
B
disp('ͨ��');
fprintf('%d',time);
disp('�μ����õ��������:');
A
clear C
