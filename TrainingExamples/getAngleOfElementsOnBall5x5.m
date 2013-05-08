function [angle] = getAngleOfElementsOnBall5x5(t, bdryT)

ballT = [];
x = t(1);
y = t(2);
for i = 1:11,
    for j = 1:11
        newX = x + i - 6;
        newY = y + j - 6;
        if newX >= 1 && newX <= size(bdryT,1) && newY>=1 && newY <= size(bdryT,2),
            if  bdryT(newX,newY) == 1,
                ballT = [ ballT, [newX; newY] ];
            end
        end
    end
end


if isempty(ballT),
    angle = 0;
else
    x = ballT(1,:)';
    y = ballT(2,:)';
    p = polyfit(x,y,1);
    angle = p(1);
end

end