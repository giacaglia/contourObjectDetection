function [ v ] = feature_response_without_features( T, sigma, lambda, c, DistanceToClosestE, anglesTemplate, anglesEdge)
% Refer to equation 6 in Contour-Based Learning for Object Detection
%feature_response Calculates the feature response, given a edge set E, a
%feature F = (T, p, sigma, lamba, theta,a, b)
% T is the template set
% p is the position of the feature vector
% sigma is the standard deviation
% lambda is the penalty 
% theta is the angle of the feature
% a and b are the constants for the additive SVM
%c is the centroid

tamanho = 4;
minimum_value = Inf;
r = [0;0];

for j = -tamanho:tamanho,
    for k = -tamanho:tamanho,
        position = [c(1) + j; c(2) + k];
        W = mvnpdf(c, position, [sigma^2,0;0, sigma^2]);
        if W ~= 0,
            W = log(W);
        end
        value = final_distance_without_features(position, T, lambda, DistanceToClosestE, anglesTemplate, anglesEdge) - W;
        if (value < minimum_value),
            minimum_value = value;
            r = position;
        end
    end
end

v = final_distance_without_features(r, T, lambda, DistanceToClosestE, anglesTemplate, anglesEdge);

end

