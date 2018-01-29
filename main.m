%Matlab codes for RPeD1 model.
%Shanmei Liu
% June 22, 2015
%------------------------------------------------
%F=farads
%V=mV
%A=amps
%F=Farads
C=1.0;       %micro F/cm^2
gbar_Na=1.5; %(micro A/mV)/cm^2 i.e. mS/cm^2 see http://icwww.epfl.ch/~gerstner/SPNM/node14.html
gbar_Nap=0.75;% mS/cm^2
gbar_Ca=0.15;% mS/cm^2
gbar_KV=0.6;   %(micro A/mV)/cm^2
gbar_A=0.03;
gbar_L=0.00075;   %(micro A/mV)/cm^2
E_Na=22;     %mV
E_Ca=80;     %mV
E_K=-70;     %mV
E_L=-12.2;     %mv
%V=Y(:,1);
%m=Y(:,2);
%h=Y(:,3);
%mp=Y(:,4);
%hp=Y(:,5);
%r=Y(:,6);
%s=Y(:,7);
%n=Y(:,8);
%q=Y(:,9);
%b=Y(:,10);



Y0=[-50,0,1,0,1,0,1,0,0,1];

% calculate frequency 
grade=50;
spike=zeros(grade,1);
Ifun=zeros(grade,1);
for i=1:grade
%Ifun(i)= -.005+0.0025*i;
    Ifun(i)= -.05+0.0025*i;
t=0:1:12000;% milisecond ms
options=odeset('RelTol',1.e-6);
[T, Y]=ode45(@dydt_HH,t,Y0,options,C,gbar_Na,gbar_Nap,gbar_Ca,gbar_KV,gbar_A,gbar_L,E_Na,E_Ca,E_K,E_L,...
             Ifun(i)); %'Ioft');
 spike(i)=SpikeNum(Y(:,1),-30);      
end


% Figure 1--Voltage vs Time
figure(1);
plot(T,Y(:,1)) % time course of V(t)
xlabel('Time (ms)')
ylabel('V (mV)')

%Figure 2 -- Mean spiking rate vs injected current
figure(2)
plot(Ifun,spike/20);
ylabel('frequency');
xlabel('current');

% Figure 3--I (or V') vs V 
figure(3);
vprime=diff(Y(:,1))./diff(T);
vcrec=(Y(1:(end-1),1)+Y(2:end,1))./2;
plot(vcrec,vprime)
% add an x-axis line at y=0 -- P.S.  the function was removed in R2014b (which introduced the new HG2 graphics system)
hy = graph2d.constantline(0, 'Color',[.7 .7 .7]);
changedependvar(hy,'y');
xlabel('V')
ylabel('dv/dt')

