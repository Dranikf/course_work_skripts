% function realise gradient descent metod for getting minum of function
% and buildig a visualiasation of way
% by Fedor Kobak github.com/Dranikf

%input +++++++++++++++++
%x - is a start point
%expr - is expression describes function
%step - is a start step of motiond
%eps - is accuracy

%uotput++++++++++++++++
% point- point of min
%val - value in getted point

function [point , val] = gradientDescent(x , expr , step , eps)

	grad = KFGrad(expr);%gettig gradient
	vars = symvar(expr);

	xVis = x(1); % x coords array for visualisation
	yVis = x(2); % y coords array for visualisation
	zVis = subs(expr, vars, x); 

	while(true)
			
		gi = subs(grad, vars ,  x);%grad at x
		if(eps > get1Norm(gi))
			val = subs(expr, vars,  x);
            point = x;
			break;
		end	

		while(true) 
			dir = normaliseVec(gi);% direciton of motion
			nx = x - dir*step;

			% is it any sens to make step smaller?
			if(subs(expr, vars , x) > subs(expr, vars , nx))
				%no it isnt
				x = nx;
				xVis = [xVis , x(1)];
				yVis = [yVis , x(2)];
				zVis = [zVis , subs(expr, vars, x)];
				break;
			end
			% yes it is
			step = step / 2;

		end	
		subs(expr , vars , x)

	end

	gradPathVisualisation(expr , xVis , yVis, zVis , 4);	

end
