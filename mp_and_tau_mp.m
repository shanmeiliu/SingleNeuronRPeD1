function [mp_inf, tau_mp]= mp_and_tau_mp(V)

aux=(V-(-18))/(-16.4);

mp_inf=1./(1+exp(aux));
tau_mp=11.7+0.004*exp(V/(-7.6));
end

