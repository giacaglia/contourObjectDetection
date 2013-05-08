Theta = [220, 230, 250, 280];
Lambda = [8, 20, 30, 40, 50];

%% Create the template and angles Template framed at the righ   t point
file = '/Users/giu/Documents/Winston/BSR/grouping/data/LowerBody3_ucm.bmp';

CenterT = [76; 141];
ucm = imread(file, 'bmp');
bdryT = (ucm >= 60);
T = [];
N_T = size(T,2);
anglesTemplate = zeros(size(bdryT,1), size(bdryT,2));
for i = 1:size(bdryT,1)
    for j = 1:size(bdryT,2)
        if (bdryT(i,j) == 1),
            T = [T, [i;j]];
            t = [i;j];
            anglesTemplate(i,j) = getAngleOfElementsOnBall5x5(t, bdryT);
        end
    end
end
T = T - repmat(CenterT, 1, size(T,2));

%% Learning the distance to Template framed at point (500,500)
% DistanceToClosestT = zeros(1001,1001);
% closestTPoint  = cell(1001,1001);
% 
% for i = 1:size(DistanceToClosestT,1),
%     i
%     for j = 1:size(DistanceToClosestT,2),
%         distance = Inf;
%         for k = 1:size(T,2),
%             t = T(:,k);
%             new_d = norm( [i-500;j-500] - t );
%             distance = min(distance, new_d);
%             if new_d == distance,
%                 closestPoint = t;
%             end
%         end
%         closestTPoint{i,j} = closestPoint;
%         DistanceToClosestT(i,j) = distance;
%     end
% end