%% ---Q.1-Q.2
clear;close all; clc;
a = 5;
b = exp(a);
c = log(b);
save('task2');
%% ---Q.2
clear;close all;clc;
load('task2.mat')
%% ---Q.3
clear; close all; clc;
x = [0 pi/2 3*pi/2 2*pi]
sin(x)
%% ---Q.4
clear; close all; clc;
a = 1+7i;
b = 2-3i;
disp(abs(a+b));
%% ---Q.5
clear;close all; clc;
a = [3 -9 8 4];
a = a';
%% --Q.6
clear; close all; clc;
A = zeros(3,4); 
B = ones(3,4);
C = rand(3,4);
%% --Q.7
clear; close all; clc;
a = 2:2:50
%% --Q.8
clear; close all; clc;
a = 10:1:50
sum(a);
%% --Q.9
clear; close all; clc;
a = [1 3 -2 4 12 -9 0 1 8];
max(a);
min(a)
b = find(a < 0);
c = a(a > 0);
%% --Q.10
clear; close all; clc;
disp([3 4; -9 6; 1 -3] * [0 6 -4; 1 -5 0]);
%% --Q.11
clear; close all; clc;
A = [1:2:10; 2:2:10];
%% --Q.12
clear; close all; clc;
A = [1 2 9 4 3; 3 3 4 11 3; 9 12 8 7 1];
B = A';
a = B(2,3);
b = B(2,:);
c = B(2:5,1);

disp(size(B));
disp(B)
%% --Q.13
clear; close all; clc;
A = [1 1 9; 2 8 12; 7 4 7; 4 1 3];
[rows,n] = size(A);
a = A(4,2);
b = A(3,:);
c = A(2:3, :);
%% --Q.14
clear; close all; clc;
a = [4 5 9 20 -4 3 6 9 32 0 3];
b = a(a > 5 & a <= 10);
disp(max(b));
disp(min(b));
%% --Q.15
clear; close all; clc;
A = randi(2,2);
B = randi(2,2);

disp(A * B)
disp(A^3);
disp(det(B));
%% --Q.16
clear; close all; clc;
A = [1+2i, 3-4i; -5+6i, 7+8i];
disp(A');
disp(A.')

a = real(A);
b = imag(A);

disp(a);
disp(b);
%% --Q.17
clear; close all; clc;
a = func(3);


%% --Q.18,Q.19
clear; close all; clc;
x = linspace(0, 2*pi, 10);
y = sin(x);
plot(x,y);
xticks(x);
xlabel('x(radians)');
ylabel('y(values)');
legend('y=sin(x)');


%% funcs
% Q.17
function fx = func(x)
    if x < 0
        fx = 0;
    end
    if x >= 0
        fx = x;
    end
end




