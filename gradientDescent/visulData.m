

expr = sym('-3*x - 5*y + 0.125*(x^2)+ 0.5*(y^2)');
[X , Y] = meshgrid(0:0.5:19 , -15:0.5:25);
Z = subs(expr , {'x'  'y'} , {X Y});
%surf(X, Y , Z);

[x y z] = gradientDescentVis( [17 25], sym('-3*x - 5*y + 0.125*(x^2)+ 0.5*(y^2)') , 100 , 0.1);
plot(x , y , 'LineWidth' , 4)

hold on;
[x y z] = gradientDescentVis( [17 25], sym('-3*x - 5*y + 0.125*(x^2)+ 0.5*(y^2)') , 0.1 , 0.1);
plot(x , y , 'r' , 'LineWidth' , 4)
legend('начальный шаг - 100' , 'начальный шаг - 0,1','Location' , 'EastOutside' );

contour(X , Y , Z)