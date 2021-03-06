%function for getting minimum of functon by one of the varistion of conjugate graddient metod

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

function [point, val , counter] = conjugateGradientT(wx, expr , eps, type)

	grad = KFGrad(expr);
	vars = symvar(expr);

	prevGrad = 1; % gradient at previous point
    dir = 0;
    counter= 0;

	while(true)

		gi = subs(grad, vars ,  wx);%grad at x
		if(eps > get1Norm(gi))
			val = subs(expr, vars , wx);
			point = wx;
			return;
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
		wx = wx - dir * a(1)
        counter = counter +1;

	end

end
