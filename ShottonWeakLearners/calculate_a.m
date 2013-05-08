function [ a ] = calculate_a(w, Z, theta_m, N, b, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT, C)
%calculate_b 
numerator   = 0;
denominator = 0;
for jj = 1:N
    x = C(:,jj);
    d = final_distance_without_features(x, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
    numerator = numerator + w(jj) * Z(jj) * (1 - delta_less_or_equal(d, theta_m));
    denominator = denominator + w(jj) * (1 - delta_less_or_equal(d, theta_m));
end


if denominator == 0,
    a = 0;
else
    a = numerator/denominator - b;
end

end