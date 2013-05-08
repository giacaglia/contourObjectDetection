function [] = createEdgels( filename, centerE, number)
    ucm = imread(filename, 'bmp');
    bdryE = (ucm >= 60);
    E = [];
    anglesEdgelsForBdry = zeros(size(bdryE,1), size(bdryE,2));
    for i = 1:size(bdryE,1)
        for j = 1:size(bdryE,2)
            if (bdryE(i,j) == 1),
                e = [i;j];
                E = [E, e];
                anglesEdgelsForBdry(i,j) = getAngleOfElementsOnBall5x5(e, bdryE);
            end
        end
    end
    anglesEdgeList = zeros(1,size(E,2));
    for i = 1:size(E,2),
        e = E(:,i);
        anglesEdgeList(i) = anglesEdgelsForBdry(int32(e(1)),int32(e(2)));
    end
    E = E - repmat(centerE, 1, size(E,2));
    string = strcat('Edgels', number);
    save(string);
end