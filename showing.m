f = sym('-3*x - 5*y + 0.125*(x^2) + 0.5*(y^2)');

[X , Y] = meshgrid(11.5:0.5:15, 2:0.5:6);
spoint = [14 3]
epsil = 0.01;


subplot(1 , 2 ,1);
Z = subs(f , {'x' 'y'} , {X Y});
surf(X , Y ,Z);
alpha(0.4);
xlabel('x');
ylabel('y');
zlabel('z');


subplot(1, 2 ,2);
contour(X , Y ,Z);
xlabel('x');
ylabel('y');

[xvis , yvis , zvis] = gradientDescentVis(spoint , f , 0.1 , epsil , 100);
hold on
plot(xvis , yvis ,'r');
subplot(1 , 2, 1);
hold on
plot3(xvis , yvis , zvis ,'r' , 'LineWidth' , 5);

[xvis , yvis , zvis ,c] = conjugateGradientVis(spoint , f , epsil ,1 , 100);
subplot(1 ,2 , 1);
plot3(xvis , yvis , zvis , 'LineWidth' , 5);
subplot(1 , 2 ,2);
plot(xvis , yvis );

[xvis , yvis , zvis ,c] = conjugateGradientVis(spoint , f , epsil ,2 , 100);
subplot(1 ,2 , 1);
plot3(xvis , yvis , zvis , 'm' , 'LineWidth' , 5);
subplot(1 , 2 ,2);
plot(xvis , yvis ,'m' );

