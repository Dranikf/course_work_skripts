% function build visualisation of path in gradient metods
% by Fedor Kobak github.com/Dranikf

% expr - is a sympolic function describing surface

function gradPathVisualisation(expr , px , py , pz , cp)

    vars = symvar(expr);
    pathLength = numel(px);

    minX = px(pathLength);
    minY = py(pathLength);
    
    sPoint = [px(1) py(1)];
    
    distX = abs(minX - sPoint(1));
    distY = abs(minY - sPoint(2));
    
    
    [X,Y] = meshgrid(-distX:0.1:distX , -distY:0.1:distY);
    Z = subs(expr , {vars(1) , vars(2)} , {X , Y});
    
%     subplot(1 ,2 , 1);
%     surf(X, Y, Z);
%     alpha(0);
%     hold on;
%     plot3(px, py , pz , 'LineWidth' , 3);
%    
%     
%     subplot(1 ,2 , 2);
    contour(X , Y ,Z , cp);
    hold on;
    plot(px, py , 'LineWidth' , 5);
    xlim([-40, 40]);
    ylim([-40, 40]);
    

end