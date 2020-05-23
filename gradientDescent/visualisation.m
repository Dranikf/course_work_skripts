f = sym('(0.5*x^2) + (y^2)');
[X Y] = meshgrid(-5:0.1:5);
Z = subs(f , {'x' 'y'} , {X , Y})
[xVis , yVis , zVis] = gradientDescentVis([4.5 4.5] , f , 2 , 0.001, 20)


subplot(1 , 2 , 1);
view([-10 -5 10])
%surf(X ,Y ,Z);
alpha(0.4)
hold on;
plot3(4.5 , 4.5 , subs(f , {'x' 'y'} , {4.5 , 4.5}) , '.' , 'MarkerSize'  , 40)
plot3(xVis , yVis , zVis , 'r' , 'LineWidth'  , 20)


subplot(1 , 2 , 2);
contour(X , Y, Z);
hold on
plot(4.5 , 4.5 , '.' , 'MarkerSize'  , 40);
plot(xVis , yVis , 'r' , 'LineWidth'  , 20);
