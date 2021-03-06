%function for getting minimum of functon by one of the varistion of conjugate graddient metod
% and buid visualisation
%input +++++++++++++++++
%xw - is a start point
%expr - is symbolic in which function describes
%eps - is accuracy
% type - for type of this metod =
%{
% 	1 if need to use steepest descent
%	2 if need to use Fletcher-Rivs formula
%	3 if need to use Polak-Raiber formula
%}

%outpur ++++++++++++++++
% point- point of min
% val - value in getted point

function [vX , vY , vZ ,c] = conjugateGradientVis(wx, expr , eps, type, itCount)

	grad = KFGrad(expr);
	vars = symvar(expr);
	vX = [] ; vY = [] ; vZ =[] ; c = [];
	
	prevGrad = 1; % gradient at previous point
    dir = 0;

    i =0;
    
	while(true)

        if(i >= itCount)
            return;
        end
        
		gi = subs(grad, vars ,  wx);%grad at x
		if(eps > get1Norm(gi))
			val = subs(expr, vars , wx);
			point = wx;
			break;
		end

		if(type == 1)
			dir = -gi;
		elseif(type == 2)
			dir = gi + dir *  ((gi*gi') / (prevGrad*prevGrad'));	
		elseif(type == 3)
			dir = gi + dir * ((gi*((gi - prevGrad))')/(prevGrad * prevGrad'));	
		end
		prevGrad = gi;

		a = getMinByDirAn(expr , dir , wx);
        px = wx;
		wx = wx - dir * a(1);
        c = [c , subs(expr ,vars , wx)]
        
        [nx , ny] = arrayBetweenPoints(px, wx , 0.01);
		nz = subs(expr , vars , {nx , ny});
        vX = [vX , nx];
        vY = [vY , ny];
        vZ = [vZ , nz];

        i = i + 1;
        
	end

	%gradPathVisualisation(expr , vX , vY , vZ , c);

end
