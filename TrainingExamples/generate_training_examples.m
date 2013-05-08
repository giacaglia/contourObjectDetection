function [T, points, outputs] = generate_training_examples( binary_mask, center )

addpath('./imageHelpers');
T = [];
for i = 1:size(binary_mask,1)
    for j = 1:size(binary_mask,2)
        if (binary_mask(i,j) == 1),
            T = [T, [i - center(1); j - center(2)]];
       end
    end
end
x_max = size(binary_mask, 1);
y_max = size(binary_mask, 2);
c = [floor(size(binary_mask, 1)/2); floor(size(binary_mask, 2)/2)];
d1 = 5;
d2 = 50;
[ points, outputs ] = create_points_and_classification(c, d1, d2, x_max, y_max, center);


end
