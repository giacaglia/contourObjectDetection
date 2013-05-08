function [ p, T ] = fragment_dictionary( binary_mask, centroid )
%fragment_dictionary F is a matrix 4 x number_of_fragments
%Example; 
%F =
%
%     1     4     6
%     3     6     8
%     2     5     7
%     4     7     9
%   binary_mask
% F = (T, p, sigma, lambda, theta, a, b)
% This function returns a set of tuples (p, T)
% such that p is the centroid of the fragment
% and T are the fragments
% Each entry is separated by the point (Inf, Inf)

addpath('./imageHelpers');
number_of_fragments = 10;
p = [];
T = [];

%array_of_segments is adjusted to the centroid of the image
[m, n] = size(binary_mask);
array_of_segments = [];
for i = 1:m,
    for j = 1:n,
        if (binary_mask(i, j) == 1),
            array_of_segments = [array_of_segments, [i - centroid(1); j - centroid(2)]];
        end
    end
end

number_of_segments = size( array_of_segments, 2 );

% 10 + 5 * random number (percentagewise)
for i = 1:number_of_fragments,
    % It's getting a random point (segment or edge) from the array_of_segments
    
    %% finds centroid of fragment
    centroid_fragment = array_of_segments(:, ceil(rand() * number_of_segments));
    
    a = floor( ( 0.3 + 0.05*rand() ) * m );
    b = floor( ( 0.3 + 0.05*rand() ) * n );

    plus_or_minus = 2 * ((rand() > 0.5) - 0.5);
    random_translation_x =  floor( 0.1 * a * (1 + plus_or_minus*rand()) );
    random_translation_y =  floor( 0.1 * b * (1 + plus_or_minus*rand()) );
    random_translation = [random_translation_x; random_translation_y];

    centroid_fragment = centroid_fragment + random_translation;
    centroid_fragment = adjust_to_the_image(centroid_fragment, m, n, centroid);

    min_fragment = centroid_fragment - [floor(a/2);floor(b/2)];
    max_fragment = centroid_fragment + [floor(a/2);floor(b/2)];
    
    %% The box around the fragment
    % min and max are at the frame of the centroid
    min_fragment = adjust_to_the_image(min_fragment, m, n, centroid);
    max_fragment = adjust_to_the_image(max_fragment, m, n, centroid);
    
    %fragment = [min_fragment, max_fragment];
    
    %% Create template T
    %finding the template T
    fragment_T = [];
    for jj = (min_fragment(1,1) + centroid(1)):(max_fragment(1,1) + centroid(1)),
        for kk = (min_fragment(2,1) + centroid(2)):(max_fragment(2,1) + centroid(2)),
            if (binary_mask(jj,kk) == 1),
                x_rel_centroid_fragment = (jj - centroid(1)) - centroid_fragment(1,1);
                y_rel_centroid_fragment = (kk - centroid(2)) - centroid_fragment(2,1);
                fragment_T = [fragment_T, [x_rel_centroid_fragment; y_rel_centroid_fragment]];
            end
        end
    end
    fragment_T = [fragment_T, [Inf;Inf]];
    centroid_fragment = [centroid_fragment, [Inf;Inf]];
    p = [p, centroid_fragment];
    T = [T, fragment_T];
end


end