max1 = 0;
min1 = 1001;
for i = 1: size(binaryE,1),
    for j = 1: size(binaryE,2),
        if binaryE(i,j) == 1,
            if max1 <  i*1001 + j,
                max1 =  i*1001 + j;
            end
            if min1 > i*1001 + j,
                min1 = i*1001 + j;
            end
        end
    end
end