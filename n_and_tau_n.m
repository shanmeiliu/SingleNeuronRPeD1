function [n_inf, tau_n]= n_and_tau_n(V)

aux=(V-(-42.5))/(-24.5);
n_inf=1./(1+exp(aux));
tau_n=62.56*exp(0.83*aux)*n_inf;
end

