x = faceCenterE;
N = 12;
w = ones(1, 12);
v = final_distance_without_features(x, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
b = calculate_b(w, Z, theta_m, N, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT, C);
a = calculate_a(w, Z, theta_m, N, b, E, lambda_m, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT, C);
h = a * delta_less_or_equal( v, theta_m  ) + b;
sign(h)