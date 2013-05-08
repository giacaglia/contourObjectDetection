bdryT = [0, 1, 1 ,1, 0; 0, 0, 1, 0, 0; 0, 0, 1, 0, 0; 0, 0, 1, 0, 0; 0, 1, 1, 1, 0];
faceCenterT = [3;3];
bdryE = [0, 0, 0, 0, 0; 1, 1, 1, 1, 1; 0, 0, 1, 0, 0; 0, 0, 1, 0, 0; 0, 0, 1, 0, 0];
faceCenterE = [3;3];

point = faceCenterE;
E = [];
anglesEdge = zeros(size(bdryE,1), size(bdryE,2));
T = [];
for i = 1:size(bdryE,1),
    for j = 1:size(bdryE,2)
        if bdryE(i,j) == 1,
            E = [E, [i;j]];
            e = [i;j];
            anglesEdge(i,j) = getAngleOfElementsOnBall5x5(e, bdryE);
        end
        if bdryT(i,j) == 1,
            T = [T, [i;j]];
        end
    end
end
E = E - repmat(faceCenterE, 1, size(E,2));

%11x11
DistanceToClosestE = zeros(11,11);
closestEPoint  = cell(11,11);
centerOfGrid = [6;6];
for i = 1:size(DistanceToClosestE,1),
    for j = 1:size(DistanceToClosestE,2),
        distance = Inf;
        for k = 1:size(E,2),
            e = E(:,k);
            new_d = norm( [i-6;j-6] - e );
            distance = min(distance, new_d);
            if new_d == distance,
                closetPoint = e;
            end
        end
        closestEPoint{i,j} = closetPoint;
        DistanceToClosestE(i,j) = distance;
    end
end

%% Learning the angles for the template
N_T = size(T,2);
anglesTemplate = zeros(N_T);
for i = 1:size(T,2),
    t = T(:,i);
    anglesTemplate(i) = getAngleOfElementsOnBall5x5(t, bdryT);
end

