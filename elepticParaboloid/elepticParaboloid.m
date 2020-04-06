% visualisation of steepest descent method
% by Fedor Kobak github.com/Dranikf

[X , Y] = meshGrid(-2:0.1:2 , -2:0.1:2);
Z = (X.^2) - 4 * X* Y + 17*(Y.^2) + 5 * Y;

surf(X, Y, Z);
alpha(0);

hold on;
plot3(1 ,1 , 2 , 'r.' , 'MarkerSize' , 40);


while(true)
    
end

