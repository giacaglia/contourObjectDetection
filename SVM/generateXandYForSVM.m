addpath('./../chamfer_distance');
addpath('./../TrainingExamples');

trainingx = [];
% size(C,2) is the number of training examples.

tau = 0.01;
d_t   = chamfer_distance( E, tau, DistanceToClosestT );
o_d_t = oriented_chamfer_matching(E, closestTPoint, anglesTemplateForBdry, anglesEdgeList, centerT);

d_e   = chamfer_distance( T, tau, DistanceToClosestE );
o_d_e = oriented_chamfer_matching(T, closestEPoint, anglesEdgelsForBdry, anglesTemplateList, centerE);


trainingx = [trainingx; [d_t o_d_t d_e o_d_e]];

