function [ d ] = oriented_chamfer_matching(E, closestTPoint, anglesTemplateForBdry, anglesEdgeList, centerT)
%oriented_chamfer_matching Calculates the priented chamfer distance given the sets T 
%(template) and the set E (edges). Equation 4 of 
% Contour-Based Learning for Object Detection
addpath('../Test');
N_e = size(E,2);
d = 0;

% E is framed at centerE
% compare it to the points framed at (500,500)
% So first I frame the edge to the right frame (center) then to the point (500,500)
for i = 1:N_e,
    min_of_adt = pi/16;
    e = E(:,i);
    xAndy = e + [500;500];
    t = closestTPoint(int32(xAndy(1)), int32(xAndy(2))); % closest T Point to point i - 500 and j - 500
    t = double(t{1,1});
    t = t + centerT;
    o_e = atan(anglesEdgeList(i));
    o_t = atan(anglesTemplateForBdry(t(1), t(2)));
    dist = norm(o_t - o_e);
    min_inside_sum = max(dist, min_of_adt);
    d = d + min_inside_sum;
end
d = d/N_e;

end

