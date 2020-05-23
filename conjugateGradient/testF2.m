



epsils = [0.1 0.01 0.001];
points = [17 25; 14 3];

posintsSize = size(points);

results = [];

for(poi = 1:posintsSize(1))
	for(ep = epsils)  

        pa = 0;
        sumT = 0;
        tic;
        for(i = 1:20)
           f = sym('-3*x - 5*y + 0.125*(x^2) + 0.5*(y^2)');
           [p, v ,counter] = conjugateGradientT(points(poi , :) ,f , ep, 2)
           clc
           a = toc;
           sumT = sumT + (a - pa);
           pa = a;
        end
             
        aV = sumT/20
             
        results = [results ; {points(poi , :) , ep , p, counter, aV}];
            
    end
end

