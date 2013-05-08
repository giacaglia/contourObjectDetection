function [T_star, p_star, Sigma_star, Lambda_star, Theta_star, A_star, B_star] = learning_classifier( T, p, Sigma, Lambda, Theta, E, C, Z, DistancePoints )
% F* is [T,p] x Sigma x Lamda x Theta
T_star = [];
p_star = [];
Sigma_star = [];
Lambda_star = [];
Theta_star = [];
A_star = [];
B_star = [];
addpath('./Test');

sizeOfT = numberOfTemplates(T);
N = 10; % number of boosting steps
M = sizeOfT * size(Lambda,2) * size(Theta,2) * size(Sigma,2);
% number of features F_m which is equal to |T| x |SIGMA| x |LAMBDA| x |THETA|

for ii = 1:N,
    ii
    c = C(ii);
    w = ones(1, N);
    H = zeros(1, N);
    a = zeros(1, M);
    b = zeros(1, M);
    h_m = zeros(1, N);
    min_J = Inf;
    min_m = 0;

    for m = 1:M
        m
        [elementOfT, elementOfLambda, elementOfTheta, elementOfSigma] = getElements(m, size(Lambda,2), size(Theta,2), size(Sigma,2));

        %% Initialize
        T_m = getNElementOfT(elementOfT, T);
        p_m = getNElementOfp(elementOfT, p);
        lambda_m = Lambda(elementOfLambda);
        sigma_m = Sigma(elementOfSigma);    
        theta_m = Theta(elementOfTheta);
        
        % Need to find what is E and what is c
        v = feature_response( T_m, p_m, sigma_m, lambda_m, E, c, DistancePoints);
        b(m) = calculate_b(w, Z, c, T_m, theta_m, E, N);
        a(m) = calculate_a(w, Z, c, T_m, theta_m, E, N, b(m));

        %% Fit Stump
        d = oriented_chamfer_matching( c, T_m, v(ii) );
        h_m(ii) = a(m) * delta_less_or_equal( d, theta_m  ) + b(m);

        %% Update H and w
        H(ii) = H(ii) + h_m(ii);
        w(ii) = w(ii) * exp(-Z(ii) * h_m(ii));

        %% Evaluate Error
        J = 0;
        for kk = 1:N,
            J = J + w(kk) * ((Z(kk) - h_m(kk)).^2);
        end

        %% find m that minimizes J
        if (J < min_J),
            min_J = J;
            min_m = m;
            theta_min = theta_m;
            sigma_min = sigma_m;
            lambda_min = lambda_m;
        end
    end

    %% Add the Feature m that minimizes J
    Sigma_star = [Sigma_star, sigma_min]
    Theta_star = [Theta_star, theta_min]
    Lambda_star = [Lambda_star, lambda_min]

    m = min_m;
    T_m = getNElementOfT(m, T);
    p_m = getNElementOfp(m, p);
    b = calcultate_b(w, z, c, T_m, theta_m, v, N);
    a = calculate_a(w, z, c, T_m, theta_m, v, N, b(m));

    T_star = [T_star, T_m];
    T_star = [T_star, [Inf;Inf]]
    p_star = [p_star, p_m];
    p_star = [p_star, [Inf;Inf]]
    A_star = [A_star, a]
    B_star = [B_star, b]
end

end