function dY=dydt_HH(t,Y,...
                    C,gbar_Na,gbar_Nap,gbar_Ca,gbar_KV,gbar_A,gbar_L,E_Na,E_Ca,E_K,E_L,Ifun)
V=Y(1);
m=Y(2);
h=Y(3);
mp=Y(4);
hp=Y(5);
r=Y(6);
s=Y(7);
n=Y(8);
q=Y(9);
b=Y(10);
tau_h=3.44;tau_hp=300;tau_r=10.5;tau_s=90;tau_b=200;

m_inf=1./(1 + exp((V-(-34.74))/(-9.32)));
tau_m=(6.98*exp(0.16*(V-(-34.74))/(-9.32)))*m_inf;
[h_inf]=h_and_tau_h(V);
[mp_inf, tau_mp]=mp_and_tau_mp(V);
[hp_inf]=hp_and_tau_hp(V);
r_inf=1/(1+exp((V-(-18.08))/(-7.2)));
s_inf=1/(1+exp((V-(-24.0))/8.7));
[n_inf, tau_n]=n_and_tau_n(V);
[q_inf, tau_q]=q_and_tau_q(V);
[b_inf]=b_and_tau_b(V);
%I=eval([Ifun '(t)']);
%I=-15; % micro Amp /cm^2, uA/cm^2
I=Ifun;% uA/cm^2 and a critical value is 6 (for oringinal HH) according  to http://icwww.epfl.ch/~gerstner/SPNM/node14.html

dY=zeros(10,1);
dY(1)=(-1/C)*( gbar_Na*m^3*h*(V-E_Na) + gbar_Nap*mp^3*hp*(V-E_Na) + gbar_Ca*r*s*(V-E_Ca) + gbar_KV*n^4*(V-E_K) + gbar_A*q^2*b*(V-E_K)...
              + gbar_L*(V-E_L) - I );
dY(2)=( m_inf-m )/tau_m;
dY(3)=( h_inf-h )/tau_h;
dY(4)=( mp_inf-mp )/tau_mp;
dY(5)=( hp_inf-hp )/tau_hp;
dY(6)=( r_inf-r )/tau_r;
dY(7)=(1/tau_s)*( s_inf-s );
dY(8)=(1/tau_n)*( n_inf-n );
dY(9)=(1/tau_q)*( q_inf-q );
dY(10)=(1/tau_b)*( b_inf-b );
end
