% function return norm of A as max sum of strings elements
% powered by Kobak F. , github.com/Dranikf

function res =  get1Norm(A)

	ASize = size(A);	
	sumVec = [];
	for i = 1:ASize(1)
		sumVec = [sumVec ,  sum(abs(A(i ,:)))];
	end

	res = max(sumVec);
end
