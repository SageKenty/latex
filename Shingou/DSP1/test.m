clear all
a=[0.1 -0.3 0.2];
x=-5:0.1:5;
y=a(1)+a(2)*cos(x)+a(3)*cos(2*x);
plot(x, y)