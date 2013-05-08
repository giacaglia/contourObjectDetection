load EdgelsAndTemplate;

%% learning classifier
[set_min, Lambda, Theta] = learning_classifier_without_features(anglesTemplate, Lambda, Theta, anglesEdge, C, Z, DistanceToClosestT, closestTPoint, faceCenterT, E);
clear C;
clear DistanceToClosestE;
clear E;
clear N_T;
clear Z;
clear anglesTemplate;
clear bdryE;
clear bdryT;
clear closestEPoint;
clear closetPoint;
clear distance;
clear anglesEdge;
clear e;
clear face;
clear faceCenterE;
clear faceCenterT;
clear i;
clear j;
clear k;
clear new_d;
clear point;
clear t;
clear ucm;

save learnedFeatures2;