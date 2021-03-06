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
    
    df = diff(f);
    
    critical = double(solve(df));
    val = subs(f , critical);
    [m , i] = min(val);
    aFMin = critical(i);
   
end

