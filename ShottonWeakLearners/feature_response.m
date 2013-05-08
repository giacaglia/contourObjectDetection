function [ v ] = feature_response( T, p, sigma, lambda, E, c, DistancePoints)
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
index = 1;
minimum_value = Inf;
r = [0;0];

for j = -tamanho:tamanho,
    for k = -tamanho:tamanho,
        position = [p(1) + j; p(2) + k];
        W = mvnpdf(position, c + p, [sigma^2,0;0, sigma^2]);
        if W ~= 0,
            W = log(W);
        end
        value = final_distance(position, T, lambda, DistancePoints) - W;
        if (value < minimum_value),
            minimum_value = value;
            r = position;
        end
    end
end

v = final_distance(r, T, lambda, DistancePoints);

end

