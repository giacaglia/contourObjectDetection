function [ d ] = final_distance_without_features(x, E, lambda, DistanceToClosestT, closestTPoint, anglesTemplate, anglesEdge, faceCenterT)
%UNTITLED4 final distance (chamfer)
    tau = 0.01;
    o_d = oriented_chamfer_matching(x, E, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
    d =  chamfer_distance(x, E, tau, DistanceToClosestT) + lambda * o_d;
end

