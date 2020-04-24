% function return a grad for symbolic
% by Fedor Kobak github.com/dranikf
function grad = KFGrad(expression)

	vars = symvar(expression);

	grad = [];

	for i = 1:numel(vars)
		grad = [grad , diff(expression, vars(i))];
	end
end
