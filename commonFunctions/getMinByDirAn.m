% funcrion for analitic solution of minimisation task on direction
% by Fedor Kobak github.com/Dranikf

% expr - symbolic expression of minimisation function
% dir - is a direction for minimisation
% sPoint - is a start point

function aFMin = getMinByDirAn(expr, dir , sPoint)

    syms a;
    vars = symvar(expr);
    
    f = sPoint - a*dir;
    
    f = subs(expr , vars , f);
    
    f = diff(f);
    
    aFMin = double(solve(f));
   
end

