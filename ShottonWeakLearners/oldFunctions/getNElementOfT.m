function [ T_n ] = getNElementOfT( n, T )
%GETNELEMENTOFT Summary of this function goes here
%   Detailed explanation goes here
    index = 1;
    T_n = [];
    for i = 1:size(T,2),
        if index > n,
            break
        end
        if isequal( T(:,i), [Inf; Inf]),
            index = index + 1;
        else
            if (index == n),
                T_n = [T_n, T(:,i)];
            end
        end
    end
end

