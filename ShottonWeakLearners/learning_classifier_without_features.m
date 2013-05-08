function [set_min, Lambda_star, Theta_star] = learning_classifier_without_features( anglesTemplate, Lambda, Theta, anglesEdge, C, Z, DistanceToClosestT, closestTPoint, faceCenterT, E)  

addpath('./Test');

% F* is Sigma x Lamda x Theta
Lambda_star = [];
Theta_star = [];
set_min = [];
sizeOfT = 1;
sizeSigma = 1;
N = 12; % number of training examples
M = sizeOfT * size(Lambda,2) * size(Theta,2) * sizeSigma;
trials = 10;
% number of features F_m which is equal to |T| x |SIGMA| x |LAMBDA| x |THETA|

%% Initiate weights
w = ones(1, N);
    
for t = 1:trials,
    t
    min_J = Inf;
    a = zeros(1, M);
    b = zeros(1, M);
    h = zeros(1, N);
    min_m = 0;
    theta_min = Inf;
    lambda_min = Inf;
    
    %% Line 7 of the algorithm
    for m = 1:M
        m
        [elementOfT, elementOfLambda, elementOfTheta, elementOfSigma] = getElements(m, size(Lambda,2), size(Theta,2), sizeSigma);

        %% Initialize
        lambda_m = Lambda(elementOfLambda);
        theta_m  = Theta(elementOfTheta);

        %% Calculate a_m and b_m
        b(m) = calculate_b(w, Z, theta_m, N, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT, C);
        a(m) = calculate_a(w, Z, theta_m, N, b(m), E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT, C);
        if ~a(m) == 0
            %% Evaluate Error
            J = 0;
            for ii = 1:N,
                x = C(:,ii);
                v = final_distance_without_features(x, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
                h(ii) = a(m) * delta_less_or_equal( v, theta_m  ) + b(m);
                J = J + w(ii) * ((Z(ii) - h(ii)).^2);
            end

            %% find m that minimizes J
            if (J < min_J) && ~any(m==set_min),
                min_m = m;
                min_J = J;
                theta_min = theta_m;
                lambda_min = lambda_m;
            end     
        end

    end

    for ii = 1:N,
        x = C(:,ii);
        v = final_distance_without_features(x, E, lambda_min, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
        h(ii) = a(min_m) * delta_less_or_equal( v, theta_min  ) + b(min_m);
        w(ii) = w(ii) * exp(-Z(ii) * h(ii));
    end    

    %% Add the Feature m that minimizes J
    Theta_star = [Theta_star, theta_min];
    Lambda_star = [Lambda_star, lambda_min];
    set_min = [set_min; min_m];
end