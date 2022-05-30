function [ Flynew , Turn ] = fun1( Flyend )
%fun1 ֪�������һ��״̬����һ��״̬
XHT01=Flyend(1);
YHT01=Flyend(2);
VxHT01=Flyend(3);
VyHT01=Flyend(4);
XFY01=Flyend(5);
YFY01=Flyend(6);
VxFY01=Flyend(7);
VyFY01=Flyend(8);
XFY02=Flyend(9);
YFY02=Flyend(10);
VxFY02=Flyend(11);
VyFY02=Flyend(12);

t0=0.5;   %ʱ����
lamda=0.4;  %
VE=250;    %HT���ٶ�
VP=200;    %FY���ٶ�
RE=500;     %HT����Сת��뾶
RP=350;     %FY����Сת��뾶
%%%%%%  HT01 �ķ��з�ʽ
Pointx=(XFY01+XFY01)/2*(1-lamda)+XHT01*lamda;
Pointy=(YFY01+YFY01)/2* +YHT01*lamda;
%%% FY01 ��ǰ������
PVxFY01=(XFY01-Pointx)/sqrt((XFY01-Pointx)^2+(YFY01-Pointy)^2);
PVyFY01=(YFY01-Pointy)/sqrt((XFY01-Pointx)^2+(YFY01-Pointy)^2);
%%% FY02 ��ǰ������
PVxFY02=(XFY02-Pointx)/sqrt((XFY02-Pointx)^2+(YFY02-Pointy)^2);
PVyFY02=(YFY02-Pointy)/sqrt((XFY02-Pointx)^2+(YFY02-Pointy)^2);
%%%  FY01 ��HT01�ĽǶȣ�ʵ�ʷ���
PVxFY01HT01=(XFY01-XHT01)/sqrt((XFY01-XHT01)^2+(YFY01-YHT01)^2);
PVyFY01HT01=(YFY01-YHT01)/sqrt((XFY01-XHT01)^2+(YFY01-YHT01)^2);
%%%  FY02 ��HT01�ĽǶȣ�ʵ�ʷ���
PVxFY02HT01=(XFY02-XHT01)/sqrt((XFY02-XHT01)^2+(YFY02-YHT01)^2);
PVyFY02HT01=(YFY02-YHT01)/sqrt((XFY02-XHT01)^2+(YFY02-YHT01)^2);
%%%  ��Ҫǰ���ķ���
PVxHT01=(Pointx-XHT01)/sqrt((Pointx-XHT01)^2+(Pointy-YHT01)^2);
PVyHT01=(Pointy-YHT01)/sqrt((Pointx-XHT01)^2+(Pointy-YHT01)^2);
%%%  �ж�ת�仹��ֱ��
thetaFY=VP*t0/RP;
thetaHT=VE*t0/RE;
%%% 0 ��ʾֱ�� 1��ʾ�������� 2��ʾ�����Ϻ�ֱ�� -1��ʾ���� -2��ʾ�����º�ֱ��
TurnHT01=0;
TurnFY01=0;
TurnFY02=0;
%%%  FY01
if PVyFY01HT01<PVyFY01  %ǰ��������ʵ�ʷ�����
    if abs(atan(PVyFY01HT01/PVxFY01HT01)-atan(PVyFY01/PVxFY01))>thetaFY
        Flynew(7)=cos(atan(VyFY01/VxFY01)+thetaFY);%������ת
        Flynew(8)=sin(atan(VyFY01/VxFY01)+thetaFY);
        TurnFY01=-1;
    else
        deltaFY01=abs(atan(PVyFY01HT01/PVxFY01HT01)-atan(PVyFY01/PVxFY01));
        Flynew(7)=cos(atan(VyFY01/VxFY01)+deltaFY01);%������ת
        Flynew(8)=sin(atan(VyFY01/VxFY01)+deltaFY01);
        TurnFY01=-2;
    end
elseif PVyFY01HT01>PVyFY01
    if abs(atan(PVyFY01HT01/PVxFY01HT01)-atan(PVyFY01/PVxFY01))>thetaFY
        Flynew(7)=cos(atan(VyFY01/VxFY01)-thetaFY);%������ת
        Flynew(8)=sin(atan(VyFY01/VxFY01)-thetaFY);
        TurnFY01=1;
    else
        Flynew(7)=cos(atan(VyFY01/VxFY01)-deltaFY01);%������ת
        Flynew(8)=sin(atan(VyFY01/VxFY01)-deltaFY01);
        TurnFY01=2;
    end
else
    Flynew(7)=PVxFY01;
    Flynew(8)=PVyFY01;
end
%%%  FY02
if PVyFY02HT01<PVyFY02 %ǰ��������ʵ�ʷ�����
    if abs(atan(PVyFY02HT01/PVxFY02HT01)-atan(PVyFY02/PVxFY02))>thetaFY
        Flynew(11)=cos(atan(VyFY02/VxFY02)+thetaFY);%������ת
        Flynew(12)=sin(atan(VyFY02/VxFY02)+thetaFY);
        TurnFY01=-1;
    else
        deltaFY02=abs(atan(PVyFY02HT01/PVxFY02HT01)-atan(PVyFY02/PVxFY02));
        Flynew(11)=cos(atan(VyFY02/VxFY02)+deltaFY02);%������ת
        Flynew(12)=sin(atan(VyFY02/VxFY02)+deltaFY02);
        TurnFY01=-2;
    end
elseif PVyFY01HT01>PVyFY01
    if abs(atan(PVyFY02HT01/PVxFY02HT01)-atan(PVyFY02/PVxFY02))>thetaFY
        Flynew(11)=cos(atan(VyFY02/VxFY02)-thetaFY);
        Flynew(12)=sin(atan(VyFY02/VxFY02)-thetaFY);%������ת
        TurnFY01=1;
    else
        Flynew(11)=cos(atan(VyFY02/VxFY02)-deltaFY02);
        Flynew(12)=sin(atan(VyFY02/VxFY02)-deltaFY02);%������ת
        TurnFY01=2;
    end
else
    Flynew(11)=PVxFY01;
    Flynew(12)=PVyFY01;
end
%%%  HT01
if PVyHT01>VyHT01     %ǰ��������ʵ�ʷ����·�
    if abs(atan(VyHT01/VxHT01)-atan(PVyHT01/PVxHT01))>thetaHT
        Flynew(3)=cos(atan(VyHT01/VxHT01)-thetaHT);%������ת
        Flynew(4)=sin(atan(VyHT01/VxHT01)-thetaHT);%������ת
        TurnHT01=-1;
    else
        deltaHT01=abs(atan(VyHT01/VxHT01)-atan(PVyHT01/PVxHT01));
        Flynew(3)=cos(atan(VyHT01/VxHT01)-deltaHT01);%������ת
        Flynew(4)=sin(atan(VyHT01/VxHT01)-deltaHT01);%������ת
        TurnHT01=-2;
    end
elseif PVyHT01<VyHT01
    if abs(atan(VyHT01/VxHT01)-atan(PVyHT01/PVxHT01))>thetaHT
        Flynew(3)=cos(atan(VyHT01/VxHT01)+thetaHT);%������ת
        Flynew(4)=sin(atan(VyHT01/VxHT01)+thetaHT);%������ת
        TurnHT01=1;
    else
        Flynew(3)=cos(atan(VyHT01/VxHT01)+deltaHT01);%������ת
        Flynew(4)=sin(atan(VyHT01/VxHT01)+deltaHT01);%������ת
        TurnHT01=2;
    end
else
    Flynew(3)=PVxHT01;
    Flynew(3)=PVyHT01;
end
%%% λ�õı仯
%%% HT01
if TurnHT01==0
    Flynew(1)=XHT01+VE*t0*VxHT01;
    Flynew(2)=YHT01+VE*t0*VyHT01;
elseif TurnHT01==1
    Flynew(1)=XHT01+RE*(2*cos(atan(VyHT01/VxHT01))-cos(atan(VyHT01/VxHT01)+thetaHT)-1);
    Flynew(2)=YHT01+RE*(sin(atan(VyHT01/VxHT01)+thetaHT)-sin(atan(VyHT01/VxHT01)));
elseif TurnHT01==2
    Flynew(1)=XHT01+RE*(2*cos(atan(VyHT01/VxHT01))-cos(atan(VyHT01/VxHT01)+thetaHT)-1);
    Flynew(2)=YHT01+RE*(sin(atan(VyHT01/VxHT01)+thetaHT)-sin(atan(VyHT01/VxHT01)));
    Flynew(1)=Flynew(1)+RE*tan(thetaHT-deltaHT01)*Flynew(3);
    Flynew(2)=Flynew(2)+RE*tan(thetaHT-deltaHT01)*Flynew(4);
elseif TurnHT01==-1
    Flynew(1)=XHT01+RE*(2*cos(atan(VyHT01/VxHT01))-cos(atan(VyHT01/VxHT01)+thetaHT)-1);
    Flynew(2)=YHT01-RE*(sin(atan(VyHT01/VxHT01)+thetaHT)-sin(atan(VyHT01/VxHT01)));
elseif TurnHT01==-2
    Flynew(1)=XHT01+RE*(2*cos(atan(VyHT01/VxHT01))-cos(atan(VyHT01/VxHT01)+thetaHT)-1);
    Flynew(2)=YHT01-RE*(sin(atan(VyHT01/VxHT01)+thetaHT)-sin(atan(VyHT01/VxHT01)));
    Flynew(1)=Flynew(1)+RE*tan(thetaHT-deltaHT01)*Flynew(3);
    Flynew(2)=Flynew(2)-RE*tan(thetaHT-deltaHT01)*Flynew(4);
end
if TurnFY01==0
    Flynew(5)=XFY01+VP*t0*VxFY01;
    Flynew(6)=YFY01+VP*t0*VyFY01;
elseif TurnFY01==1
    Flynew(5)=XFY01-RP*(2*cos(atan(VyFY01/VxFY01))-cos(atan(VyFY01/VxFY01)+thetaFY)-1);
    Flynew(6)=YFY01+RP*(sin(atan(VyFY01/VxFY01)+thetaFY)-sin(atan(VyFY01/VxFY01)));
elseif TurnFY01==2
    Flynew(5)=XFY01-RP*(2*cos(atan(VyFY01/VxFY01))-cos(atan(VyFY01/VxFY01)+thetaFY)-1);
    Flynew(6)=YFY01+RP*(sin(atan(VyFY01/VxFY01)+thetaFY)-sin(atan(VyFY01/VxFY01)));
    Flynew(5)=Flynew(5)-RP*tan(thetaFY-deltaFY01)*Flynew(7);
    Flynew(6)=Flynew(6)+RP*tan(thetaFY-deltaFY01)*Flynew(8);
elseif TurnFY01==-1
    Flynew(5)=XFY01-RP*(2*cos(atan(VyFY01/VxFY01))-cos(atan(VyFY01/VxFY01)+thetaFY)-1);
    Flynew(6)=YFY01-RP*(sin(atan(VyFY01/VxFY01)+thetaFY)-sin(atan(VyFY01/VxFY01)));
elseif TurnFY01==-2
    Flynew(5)=XFY01+RP*(2*cos(atan(VyFY01/VxFY01))-cos(atan(VyFY01/VxFY01)+thetaFY)-1);
    Flynew(6)=YFY01-RP*(sin(atan(VyFY01/VxFY01)+thetaFY)-sin(atan(VyFY01/VxFY01)));
    Flynew(5)=Flynew(5)+RP*tan(thetaFY-deltaFY01)*Flynew(7);
    Flynew(6)=Flynew(6)-RP*tan(thetaFY-deltaFY01)*Flynew(8);
end
if TurnFY02==0
    Flynew(9)=XFY02+VP*t0*VxFY02;
    Flynew(10)=YFY02+VP*t0*VyFY02;
elseif TurnFY02==1
    Flynew(9)=XFY02-RP*(2*cos(atan(VyFY02/VxFY02))-cos(atan(VyFY02/VxFY02)+thetaFY)-1);
    Flynew(10)=YFY02+RP*(sin(atan(VyFY02/VxFY02)+thetaFY)-sin(atan(VyFY02/VxFY01)));
elseif TurnFY02==2
    Flynew(9)=XFY02-RP*(2*cos(atan(VyFY02/VxFY02))-cos(atan(VyFY02/VxFY02)+thetaFY)-1);
    Flynew(10)=YFY02+RP*(sin(atan(VyFY02/VxFY02)+thetaFY)-sin(atan(VyFY02/VxFY02)));
    Flynew(9)=Flynew(9)-RP*tan(thetaFY-deltaFY02)*Flynew(11);
    Flynew(10)=Flynew(10)+RP*tan(thetaFY-deltaFY02)*Flynew(12);
elseif TurnFY02==-1
    Flynew(9)=XFY02-RP*(2*cos(atan(VyFY02/VxFY02))-cos(atan(VyFY02/VxFY02)+thetaFY)-1);
    Flynew(10)=YFY02-RP*(sin(atan(VyFY02/VxFY02)+thetaFY)-sin(atan(VyFY02/VxFY02)));
elseif TurnFY02==-2
    Flynew(9)=XFY01+RP*(2*cos(atan(VyFY02/VxFY02))-cos(atan(VyFY02/VxFY02)+thetaFY)-1);
    Flynew(10)=YFY01-RP*(sin(atan(VyFY02/VxFY02)+thetaFY)-sin(atan(VyFY02/VxFY02)));
    Flynew(9)=Flynew(9)+RP*tan(thetaFY-deltaFY02)*Flynew(11);
    Flynew(10)=Flynew(10)-RP*tan(thetaFY-deltaFY02)*Flynew(2);
end  
Turn=[TurnHT01,TurnFY01,TurnFY02];
end

