function [elementOfT, elementOfLambda, elementOfTheta, elementOfSigma] = getElements( m, sizeOfLambda, sizeOfTheta, sizeOfSigma )
% There is a bijection between the cross products and the index
% This function gives back the coming back function from m to the elements
% for example 6 <-> (2,3), 5 <-> (2,2), 4 <-> (2,1), 3 <-> (1,3), 2 <->
% (1,2), 1 <-> (1,1)

elementOfT = ceil(m /(sizeOfLambda * sizeOfTheta * sizeOfSigma));
m = m - (elementOfT - 1) * (sizeOfLambda * sizeOfTheta * sizeOfSigma);

elementOfLambda = ceil(m /(sizeOfTheta * sizeOfSigma));
m = m - (elementOfLambda - 1) * (sizeOfTheta * sizeOfSigma);

elementOfTheta = ceil(m / sizeOfSigma);
m = m - (elementOfTheta - 1) * sizeOfSigma;

elementOfSigma = m;

end

