% function for minimising by direction, whith step crushing
% its returns path of minimisation for building visualisation
% by Fedor Kobak gitnub.com/Dranikf

% expr sympolic expression
% direction for mim\nimizing
% eps - accuracy
% sStep - start step of mooving
% sPoint - start point
% sx , sy , sz - points of the path, INCLUDING sPoint

function [sx , sy , sz] = getMinByDir(expr , dir , eps , sStep , sPoint)

    dir = normaliseVec(dir);
    vars = symvar(expr);
    step = sStep;
    
    sx = sPoint(1);
    sy = sPoint(2); 
    sz = subs(expr, {vars(1) , vars(2)} , {sx, sy});
    
    while(true)
            
         pathLength = numel(sx);
         nx = sx(pathLength) - step*dir(1);
         ny = sy(pathLength) - step*dir(2);
         nz = subs(expr, {vars(1) , vars(2)} , {nx, ny});
            
         if(nz > sz(pathLength))
             break;
         end
            
         sx = [sx , nx]; sy = [sy , ny]; sz = [sz, nz];
         sz(pathLength + 1)
         
    end
end
