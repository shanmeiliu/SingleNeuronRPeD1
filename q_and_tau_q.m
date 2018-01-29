function [q_inf, tau_q]= q_and_tau_q(V)

aux=(V-(-62.3))/(-8.3);
q_inf=1./(1+exp(aux));
tau_q=16.1*exp(0.087*aux)*q_inf;
end

