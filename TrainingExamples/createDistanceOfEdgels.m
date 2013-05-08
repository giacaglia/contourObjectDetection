binaryE = zeros(1001,1001);
for k = 1:size(E,2),
    e = E(:,k);
    binaryE(e(1) + 500, e(2) + 500) = 1;
end
 
[DistanceToClosestE, IDX] = bwdist(binaryE);

% Generate the closestEPoint from IDX
closestEPoint  = cell(size(IDX,1),size(IDX,2));
for i = 1:size(IDX,1),
    for j = 1:size(IDX,2),
        number = IDX(i,j);
        colNumber = ceil( double(number) / double(size(IDX,2)));
        rowNumber = number - (colNumber - 1) * size(IDX,2);
        closestEPoint{i,j} = double([rowNumber ; colNumber ]) - [500;500];
    end
end

clear i;
clear j;
clear k;
clear colNumber;
clear e;
clear number;
clear rowNumber;
clear string;
clear IDX;