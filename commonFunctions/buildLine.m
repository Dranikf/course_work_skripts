% function for building line points array (2 dimentions)
% by Fedor Kobak github.com/Dranikf

% p1, p2 - points lies on the line
% step - is a distans between x(i) and x(i+1)
% ax , ay - arrays of lines

function [ax , ay] = buildLine(p1 , p2, step)

    a = p2(1) - p1(1);
    b = p2(2) - p1(2);
       
    if(p1(1) > p2(1))
        step= -step;
    end
    
    ax = p1(1):step:p2(1);
    
    ay = (((ax - p2(1)).*b) ./ a) + p2(2);
    ax = [ax , p2(1)];
    ay = [ay , p2(2)];

end