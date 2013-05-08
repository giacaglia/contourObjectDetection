load faceTemplate;
load faceXYSVM;

file = '/Users/giu/Documents/Winston/Object-Detection/testImages/PeopleImagesAlreadyCropped/2007_005114/cropped1_ucm.bmp';
[E, anglesEdge, x]  = createEdgelsAndAngles(file);

tau = 0.01;
d = chamfer_distance( x, E, tau, DistanceToClosestT);
o_d = oriented_chamfer_matching(x, E, closestTPoint, anglesTemplate, anglesEdge, faceCenterT);
newX = [d o_d];

svmStruct = svmtrain(xFinal, yFinal, 'showplot',true);
newFace = svmclassify(svmStruct, newX,'showplot',true);