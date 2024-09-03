clear; clc; close all
x = 0:0.01:1;
a = 9;
b = 1;
c = 4;
y = myfunc(x,a,b,c);
plot(x,abs(y));
