function [ n ] = numberOfTemplates( T )
%NUMBEROFTEMPLATES Summary of this function goes here
%   Detailed explanation goes here
n = 0;
for i = 1:size(T,2),
    if isequal(T(:,i), [Inf; Inf]),
        n = n + 1;
    end
end

end

