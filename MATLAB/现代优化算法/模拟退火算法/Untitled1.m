clc,clear
load sj.mat %���صз�100 ��Ŀ������ݣ����ݰ��ձ���е�λ�ñ����ڴ��ı��ļ�sj.txt ��
x=sj(:,1:2:8);x=x(:);
y=sj(:,2:2:8);y=y(:);
sj=[x y]; d1=[70,40];
sj=[d1;sj;d1]; sj=sj*pi/180;
d=zeros(102); %�������d
for i=1:101
    for j=i+1:102
        temp=cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2));
        d(i,j)=6370*acos(temp);
    end
end
d=d+d';
S0=[];Sum=inf;
rand('state',sum(clock));
%%%%%%%% �ȸ���һ���Ƚ�����ĳ�ʼֵ %%%%%%%%
for j=1:1000
    S=[1 1+randperm(100),102];
    temp=0;
    for i=1:101
        temp=temp+d(S(i),S(i+1));
    end
    if temp<Sum
        S0=S;Sum=temp;
    end
end
n=100;                      %�����ģ��Ŀ�����
T=100*n;                    %��ʼ�¶�
L=100;                          %����Ʒ�������
K=0.99;                         %˥������
%%%%%%%%%%%%  Ŀ��ṹ�� %%%%%%%%%%%%%
target=struct([]);
for i=1:n
    target(i).x=sj(S0(i),1);
    target(i).y=sj(S0(i),2);
end
l=1;                                %��������
len(l)=func4(target,n);     %ÿ�ε������·�߳���
figure(1);
while T>0.001                       %ֹͣ�����¶�
    %%%%%%%%%%% ��ε����Ŷ����¶Ƚ���ǰ�������  %%%%%%%%%%%
    for i=1:L
        %%%%%%%%%%%% ����ԭ·���ܾ��� %%%%%%%%%%%%%%%%%
        len1=func4(target,n);
        %%%%%%%%%%%%  ��������Ŷ�  %%%%%%%%%%%%%%%
        %%%%%%%%%%%����û�������ͬ���е�����  %%%%%%%%%%
        p1=floor(1+n*rand());
        p2=floor(1+n*rand());
        while p1==p2
            p1=floor(1+n*rand());
            p2=floor(1+n*rand());
        end
        tmp_target=target;
        tmp=tmp_target(p1);
        tmp_target(p1)=tmp_target(p2);
        tmp_target(p2)=tmp;
        %%%%%%%%%%%%%%������·�ߵ��ܾ���  %%%%%%%%%%%
        len2=func4(tmp_target,n);
        %%%%%%%%%%%%  ����·�ߵĲ�ֵ���൱������ %%%%%%%
        delta_e=len2-len1;
        %%%%%%%%%%%  ��·�ߺ��ھ�·�ߣ����µĴ���ɵ� %%%%%%%
        if delta_e<0
            target=tmp_target;
        else
            %%%%%%%%%% �Ը���ѡ���Ƿ�����½� %%%%%%%%%%%%%
            if exp(-delta_e/T)>rand()
                target=tmp_target;
            end
        end
    end
    l=l+1;
    %%%%%%%%%%% ������·�߾��� %%%%%%%%%%%%%%%%%
    len(l)=func4(target,n);
    %%%%%%%%%%%%% �¶Ȳ����½� %%%%%%%%%%%%%%
    T=T*K;
    for i=1:n-1
        plot([target(i).x,target(i+1).x],[target(i).y,target(i+1).y],'bo-');
        hold on
    end
    plot([target(n).x,target(1).x],[target(n).y,target(1).y],'ro-');
    title(['�Ż���̾���:',num2str(len(l))]);
    hold off
    pause(0.005);
end
figure(2);
plot(len)
xlabel('��������');
ylabel('Ŀ�꺯��ֵ');
title('��Ӧ�Ƚ�������');













