%function for visualivation of steepest descent method
% but solution of one-dimensional minimization problem 
% builded analytically 
% at first step its compute and save output
% at second it draw visualisation by getted output
% by Fedor Kobak github.com/Dranikf

% expr is a symbolic expression which is function
% eps describes accuracy
% sPoint - is a start point

function stDesMetodAnVis(expr , eps, sPoint)
    
    %initiatisation+++++++++++++++++++++++++++++++++++++++++++++++
    vars = symvar(expr);
    if(numel(vars) ~= 2)
        disp('incorrect function');
        return;
    end
    
    sx = sPoint(1); sy = sPoint(2); sz = subs(expr, {vars(1) , vars(2)} , {sPoint(1), sPoint(2)}); % here will be bata for visualisation
    
    %initiatisation+++++++++++++++++++++++++++++++++++++++++++++++

    pathLength = 1; % its a number of points, getted now
    grad = KFGrad(expr);
    contourPoints = []; % points vich will be used for building contour Lines

    %+++++++++++++++++++++++++first step++++++++++++++++++++++++++
    % buiding of solution and saving output
    while(true)
        
        pathLength = numel(sx);
        contourPoints = [contourPoints , sz(pathLength)];
        gradXk = subs(grad ,  {vars(1) , vars(2)}  , {sx(pathLength), sy(pathLength)});
        if(get1Norm(gradXk) < eps)
            break;
        end
        
        disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        
        
        mP = getMinByDirAn(expr , gradXk , [sx(pathLength) sy(pathLength)]);
        [nx ny] = buildLine([sx(pathLength) sy(pathLength)] , mP, eps);
        nz = subs(expr ,vars ,{nx ny});
        sx = [sx , nx]; sy = [sy , ny]; sz = [sz, nz];
       
        
    end
    %+++++++++++++++++++++++++first step++++++++++++++++++++++++++
    
    %second step - building of a plot+++++++++++++++++++++++++++++
    gradPathVisualisation(expr , sx , sy , sz , contourPoints)
    %second step - building of a plot+++++++++++++++++++++++++++++

end