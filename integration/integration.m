tic
m = 100000;
a = 0;
b = pi/2;
dx = (b-a)/m;
x = a+dx/2:dx:b-dx/2;
int = sum(cos(x)*dx)
toc
disp(1.0-int)