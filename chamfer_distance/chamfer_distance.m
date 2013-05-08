function [ d ] = chamfer_distance(E, tau, DistanceToClosestT)
%chamfer_distance Calculates the chamfer distance given the sets T (template) and
%the set E (edges), tau is a constant to give a threshold.
d = 0;
N_e = size(E,2);

% E is framed on center E
% compare it to the points framed at (500,500)
for i = 1:N_e,
    e = E(:,i);
    e = e + [500;500];
    min_inside_sum = DT_E(e, DistanceToClosestT);
    min_inside_sum = max(min_inside_sum, tau);
    d = d + min_inside_sum;
end
d = d/N_e;

end