function [E, anglesEdge, x] =  createEdgelsAndAngles( file )
%[E, ANGLESEDGE, X] CREATEEDGELSANDANGLES; Summary of this function goes here
%   Detailed explanation goes here
ucm = imread(file, 'bmp');
bdryE = (ucm >= 60);

E = [];
for i = 1:size(bdryE, 1),
    for j = 1:size(bdryE, 2),
        if (bdryE(i,j)),
            E = [E, [i;j]];
        end
    end
end
anglesEdge = zeros(1, size(E,2));
for i = 1:size(E,2)
     e = E(:,i);
     anglesEdge(i) = getAngleOfElementsOnBall5x5(e, bdryE);
end
x = floor(size(bdryE)/2)';
E = E - repmat(x, 1, size(E,2));

end

