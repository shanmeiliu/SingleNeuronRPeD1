function NumSpikes = SpikeNum( v,threshold )
%SPIKENUM Calculate the Number of spikes in a certain input vector v, v represents the voltage trace over time
%   if v[i]>threshold, count it as a spike
% By Shanmei Liu
% June, 22, 2015
len=length(v);
NumSpikes=0;
for i=1:len-1
    if v(i) < threshold && v(i+1) >= threshold
        NumSpikes=NumSpikes+1;
    end

end

