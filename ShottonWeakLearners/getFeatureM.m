function [ T_m, p_m] = getFeatureM( m, T, p)
%GetFeatureM
addpath('./Test');
T_m = [];
p_m = [];
index_of_T = 1;
index_of_p = 1;

for ii = 1:m-1,
    while T(1, index_of_T) ~= Inf,
        index_of_T = index_of_T + 1;
    end
    while p(1, index_of_p) ~= Inf,
        index_of_p = index_of_p + 1;
    end
end

while T(1, index_of_T) ~= Inf,
    T_m  = [T_m, T(index_of_T)];
end

while p(1, index_of_p) ~= Inf,
   p_m = [p_m, p(index_of_p)]; 
end

sigma_m = sigma(m);
lambda_m = lambda(m);
theta_m = theta(m);

end

