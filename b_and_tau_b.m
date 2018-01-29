function [b_inf]= b_and_tau_b(V)

aux=(V-(-69.1))/8.8;

b_inf=1./(1+exp(aux));

end

