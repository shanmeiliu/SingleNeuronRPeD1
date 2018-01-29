function [h_inf, tau_h]= h_and_tau_h(V)
%alpha_h=0.07*exp( -(V+70)/20 );
%beta_h=1./( 1 + exp( -(V+40)/10 ) );
aux=(V-(-59.95))/9.4;
%h_inf=alpha_h./(alpha_h + beta_h);
%tau_h=1./(alpha_h + beta_h);
h_inf=1./(1+exp(aux));
tau_h=3.44; %ms
end

