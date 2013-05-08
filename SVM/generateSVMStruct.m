addpath('./TrainingExamples');
addpath('./chamfer_distance');
addpath('./TrainingExamples/data');
addpath('./SVM/data');

xFinal = [];
yFinal = [];

load distanceFaceTemplate;

load distanceEdgels20;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels28;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels33;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels113;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels144;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels192;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels195;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgels221;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, 1];

load distanceEdgelsupperbody;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, -1];

load distanceEdgelslowerbody3;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, -1];

load distanceEdgelslowerbody4;
generateXandYForSVM;
xFinal = [xFinal, trainingx];
yFinal = [yFinal, -1];

xFinal = xFinal';
svmStruct = svmtrain(xFinal, yFinal, 'showplot',true);

save('faceXYSVM', 'xFinal', 'yFinal', 'svmStruct');