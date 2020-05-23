f = sym('(0.5*x^2) + (y^2)');
[X Y] = meshgrid(-5:0.1:5);
Z = subs(f , {'x' 'y'} , {X , Y})
[xVis , yVis , zVis ,c] = conjugateGradientVis([4.5 4.5] , f , 0.001 , 1, 3)

grad = KFGrad(f);
gi = subs(grad, {'x' 'y'} , {4.5 4.5})%grad at x

tempX = [];
tempY = [];
sv= [4.5 4.5];
while(sv(1) < 4.8 && sv(2) < 4.8)
    sv = sv + gi * 0.001;
    tempX = [ sv(1) , tempX];
    tempY = [sv(2) , tempY];
end

sv= [4.5 4.5];
while(sv(1) > -4.8 && sv(2) > -4.8)
    sv = sv - gi * 0.001;
    tempX = [tempX , sv(1)];
    tempY = [tempY , sv(2)];
end

tempZ = subs(f , {'x',  'y'} , {tempX , tempY});

subplot(1 , 2 , 1);
view([-10 -5 10])
surf(X ,Y ,Z);

alpha(0.4)
hold on;
plot3(tempX , tempY , tempZ , '--r' ,  'LineWidth' , 5 )
plot3(4.5 , 4.5 , subs(f , {'x' 'y'} , {4.5 , 4.5}) , '.' , 'MarkerSize'  , 40)
 plot3(xVis , yVis , zVis , 'r' , 'LineWidth'  , 20)


subplot(1 , 2 , 2);
contour(X , Y, Z);
hold on
plot(4.5 , 4.5 , '.' , 'MarkerSize'  , 40);
plot(tempX , tempY, '--r' ,  'LineWidth' , 3 )
plot(xVis , yVis , 'r' , 'LineWidth'  , 20);
plot(2 , -0.5 , '.' , 'MarkerSize'  , 40)

 subplot(1 , 2, 1);
 plot3(2 , -0.5 , subs(f , {'x' 'y'} , {2 , -0.5}) , '.' , 'MarkerSize'  , 40)
% 
% gi = subs(grad, {'x' 'y'} , {2 -0.5})%grad at x

tempX = [];
tempY = [];
sv= [2 -0.5];
while(sv(1) < 4.8 && sv(2) < 4.8)
    sv = sv + gi * 0.001;
    tempX = [ sv(1) , tempX];
    tempY = [sv(2) , tempY];
end

sv= [2 -0.5];
while(sv(1) > -4.8 && sv(2) > -4.8)
    sv = sv - gi * 0.001;
    tempX = [tempX , sv(1)];
    tempY = [tempY , sv(2)];
end

% tempZ = subs(f , {'x',  'y'} , {tempX , tempY});
% 
% plot3(tempX , tempY , tempZ , '--r' ,  'LineWidth' , 3 )
% 
% subplot(1 , 2 , 2);
% plot(tempX , tempY , '--r' ,  'LineWidth' , 3 )
