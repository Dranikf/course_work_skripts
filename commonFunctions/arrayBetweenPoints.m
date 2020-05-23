function [x ,y] = arrayBetweenPoints(p1 , p2, step)

    if(p1(1) > p2(1))
        step = - step;
    end
        
    x = p1(1):step:p2(1);
    
    y = (((x-p1(1))*(p2(2) - p1(2))) / (p2(1) - p1(1))) + p1(2);

end