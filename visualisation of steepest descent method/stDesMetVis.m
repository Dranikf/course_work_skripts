% visualisation of steepest descent method
% by Fedor Kobak github.com/Dranikf

% expr - is function as a sympolic expression 
% gridVector - is a base vector for grid
% P0 - is a start point

% example in course work
%  stDesMetVis(sym('5*(X^2) - 4 * X* Y + 5*(Y^2) - X - Y') , -1:0.1:1 , [-1 1])

function stDesMetVis(expr , gridVector , P0)
    [X , Y] = meshGrid(gridVector , gridVector);
    
    vars = symvar(expr);
    if(numel(vars) ~= 2)
        disp('incorrect function');
        return;
    end
    
    if(numel(P0) ~= 2 || min(P0) < min(gridVector) || max(P0) > max(gridVector))
        disp('incorrect start point');
    end
    
    Z = subs(expr , {X, Y} , {vars(1) , vars(2)});

    surf(X, Y, Z);
    alpha(0);

    hold on;
    plot3(P0(1), P0(2) , subs(expr , {vars(1) , vars(2)} , P0) , 'r.' , 'MarkerSize' , 40);
    
    

end