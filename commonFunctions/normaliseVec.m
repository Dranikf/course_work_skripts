%function normalise the vector
% by Fedor Kobak 

% x - is a vecotor for normalisation

% nx - is a normalised x

function nx = normaliseVec(x)
    
    vecSumSqare = sum(x.^2);
    
     nx = x * (1/sqrt(vecSumSqare));
   
end