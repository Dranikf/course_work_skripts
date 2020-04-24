% conjugate gradient method visualivation
% by Fedor Kobak github.com/Dranikf

% expr is a symbolic expression which is function
% eps describes accuracy
% sPoint - is a start point

function conjGradMethodVis(expr , eps, sPoint) 

 %initiatisation+++++++++++++++++++++++++++++++++++++++++++++++
    
    vars = symvar(expr);
    if(numel(vars) ~= 2)
        disp('incorrect function');
        return;
    end
    
    sx = sPoint(1); sy = sPoint(2); sz = subs(expr, {vars(1) , vars(2)} , {sPoint(1), sPoint(2)}); % here will be bata for visualisation
    
    %initiatisation+++++++++++++++++++++++++++++++++++++++++++++++

    pathLength = 1; % its a number of points, getted now

    %+++++++++++++++++++++++++first step++++++++++++++++++++++++++
    % buiding of solution and saving output
    grad = KFGrad(expr);
    contourPoints = []; % points vich will be used for building contour Lines
    gradXk = [0 0];
    
    while(true)
        
        pathLength = numel(sx);
        contourPoints = [contourPoints , sz(pathLength)];
        gradXkPrev = gradXk;
        gradXk = subs(grad ,  {vars(1) , vars(2)}  , {sx(pathLength), sy(pathLength)});
        if(get1Norm(gradXk) < eps)
            break;
        end
        
        b = gradXk*gradXk' + gradXkPrev*gradXkPrev';
        
        direction = gradXk + gradXkPrev*b;
        
        disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        
        [nx, ny , nz] = getMinByDir(expr , direction , eps , eps , [sx(pathLength) sy(pathLength)]);
        sx = [sx , nx]; sy = [sy , ny]; sz = [sz, nz];
        
    end
    %+++++++++++++++++++++++++first step++++++++++++++++++++++++++
    
    %second step - building of a plot+++++++++++++++++++++++++++++
    
    gradPathVisualisation(expr , sx , sy , sz , contourPoints)
    
    %second step - building of a plot+++++++++++++++++++++++++++++

end