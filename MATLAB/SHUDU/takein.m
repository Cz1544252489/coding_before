function [ place,spot,time1 ] = takein( L )
%	��һ��3*3������ܳ��ֵ��������ж�Ҫ���������
%�Ƚ�9����һ�����٣������е����ּ�����һ��
%�ҳ�ֻ��һ������������λ�ã������ж����
C=[];
for m=1:3
    for n=1:3
        C=[C,L{m,n}];
    end
end
C(C==0)=[];
% %tabulate������һ����������
% %ԭ�����ڵ�һ��,���ĸ������ڵڶ��У��ٷֱȷ��ڵ�����
% D=tabulate(C);
% [hang,~]=size(D);%hangΪ������������������
% spot=zeros(1,9);
% place=zeros(2,9);
% time1=0;
% for i=1:hang
%     if D(i,2)==1
%         time1=time1+1;
%         spot(time1)=D(i,1);
%     end
% end

spot=zeros(9,1);
place=zeros(9,2);
time1=0;
for i1=1:9
    if sum(C==i1)==1
        time1=time1+1;
        spot(time1)=i1;
    end
end
place0=[1 1;1 2;1 3;2 1;2 2;2 3;3 1;3 2;3 3];
if sum(spot)~=0
    time2=1;
    for m=1:9
        for m1=1:time1
            if sum(L{place0(m,1),place0(m,2)}==spot(m1))==1
%                 ||...
%                     (length(L{place0(m,1),place0(m,2)})==1&&...
%                     sum(L{place0(m,1),place0(m,2)}==spot(m1))>1)
                %���L{m,n}�����������spot(m1)����
                %���� Ϊ��
                place(time2,1:2)=place0(m,1:2);
                time2=time2+1;
            end
        end
    end
end

% if sum(spot)~=0
%     for m=1:9
%         if sum(L{place0(m,1),place0(m,2)}==spot(m1))==1||...
%                 length(L{place0(m,1),place0(m,2)})==1
%         end
%     end
% end
            

spot(spot==0)=[];
place(place==0)=[];
if isempty(place)
    time1=0;
end
% if time1>1
%     time1=1;
% end
end

