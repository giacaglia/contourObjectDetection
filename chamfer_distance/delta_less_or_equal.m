function [ r ] = delta_less_or_equal( d, theta_m ) 
%delta_less_or_equal Returns 1 if d <= theta_m
% 0 otherwise
if d <= theta_m
    r = 1;
else
    r = -1;
end

end