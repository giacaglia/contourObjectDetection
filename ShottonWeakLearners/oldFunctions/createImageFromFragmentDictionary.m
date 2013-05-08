function [  ] = createImageFromFragmentDictionary( p, T, centroid )

new_img = zeros(480,360);
%center = [200;200];
index = 1;
for i = 1:size(p,2),
    if isequal(p(:,i), [Inf; Inf]),
        index = index + 1;
    else
        fragment = p(:,i);
        T_i = getNElementOfT(index,T);
        center_fragment = [fragment(1) + centroid(1), fragment(2) + centroid(2) ];
        for j = 1:size(T_i,2),           
            new_img(center_fragment(1) + T_i(1,j), center_fragment(2) + T_i(2,j)) = 1;
        end
    end
end
imshow(new_img);


end

