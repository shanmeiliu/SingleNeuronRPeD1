function [hp_inf]= hp_and_tau_hp(V)
aux=(V-(-46))/7.43;
%h_inf=alpha_h./(alpha_h + beta_h);
%tau_h=1./(alpha_h + beta_h);
hp_inf=1./(1+exp(aux));

end

