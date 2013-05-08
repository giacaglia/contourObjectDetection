function [ fragment ] = getNElementOfp( n, p )
%GETNELEMENTOFP Summary of this function goes here
%   Detailed explanation goes here
index = 1;
for i = 1:size(p,2),
    if isequal(p(:,i), [Inf; Inf]),
        index = index + 1;
    else
        if (index == n)
            fragment = p(:,i);
            break;
        end
    end
end

end

