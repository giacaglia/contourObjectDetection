function [ k ] = classifier( c, set_of_features)
%classifier classifies data given set of features and centroid
%feature F = (T, p, sigma, lamba, theta,a, b)
% T is the template set
% p is the position of the feature vector
% sigma is the standard deviation
% lambda is the penalty 
% theta is the angle of the feature
% a and b are the constants for the additive SVM
k = 0;
for i = 1:size(set_of_features,1),
    F = set_of_features(i);
    theta = F(5);
    a = F(6);
    b = F(7);
    k = k + b;
    if (feature_response(F, E, c) > theta),
        k = k + a;
    end
end


end