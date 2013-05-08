function [ tam ] = getSizeOfT( T )

tam = 1;
for i = 1:size(T,2),
    if ~isequal(T(:,i), [Inf; Inf]),
        tam = tam + 1;
    else
        break;
    end
end

if tam ~= 1
    tam = tam - 1;
end


end

