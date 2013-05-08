function [ map ] = classification_map( image, set_of_features )
%classification_map 
%
[m, n] = size(image);
size_of_step = 4;
map = zeros(floor(m/size_of_step), floor(n/size_of_step));
for i = 1:floor(m/size_of_step),
    for j = 1:floor(n/size_of_step),
        c = [i*size_of_step, j*size_of_step];
        map(i, j) = classifier(c, set_of_features);
    end
end
end