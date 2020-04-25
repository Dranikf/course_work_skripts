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

function [point, val] = conjugateGradientVis(wx, expr , eps, type)

	grad = KFGrad(expr);
	vars = symvar(expr);
	visParam = 0.1;
	vX = [] ; vY = [] ; vZ =[] ;
	
	prevGrad = 1; % gradient at previous point
    dir = 0;

	while(true)

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


		[nx , ny , nz] = getMinByDir(expr, dir ,eps, 0.01 , wx);

		a = getMinByDirAn(expr , dir , wx);
		wx = wx - dir * a;
		
		vX = [vX , nx];
		vY = [vY , ny];
		vZ = [vZ , nz];	

	end

	gradPathVisualisation(expr , vX , vY , vZ , 4);

end
