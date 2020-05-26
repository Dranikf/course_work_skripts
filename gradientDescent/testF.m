



epsils = [0.1 0.01 0.001];
points = [17 25; 14 3];
steps = [100 5 1 0.1];

posintsSize = size(points);

results = [];

for(ep = epsils)
    for(poi = 1:posintsSize(1))
        for(step = steps)
            pa = 0;
            sumT = 0;
            tic;
            for(i = 1:20)
                f = sym('-3*x - 5*y + 0.125*(x^2) + 0.5*(y^2)');
                [p, v ,counter] = gradientDescentTests(points(poi , :) ,f , step, ep)
                clc
%                 a = toc;
                sumT = sumT + (a - pa);
                pa = a;
            end
             
             aV = sumT/20
             
             results = [results ; { ep, points(poi , :) , step , p, counter, aV}];
            
        end
    end
end

