% ARO 4090 - Space Vehicle Dyn. & Cntrl. | Dr. Maggia | Justin Millsap | Homework 5 %
clc; clear; close all;

%% Problem 1
clc; clear; close all
R = [0 1/2 sqrt(3)/2 ; -1 0 0 ; 0 -sqrt(3)/2 1/2];

I = [1 0 0 ; 0 1 0 ; 0 0 1];

% ~~~~~~~~~~~~~~ PART A ~~~~~~~~~~~~~~ %

% Show that R is a rotation Matrix
    % Must satisfy det(R) = 1 
    % & RR^T = I

condition_1 = det(R);
condition_2 = R*R';

% ~~~~~~~~~~~~~~ PART B ~~~~~~~~~~~~~~ %

% Find eigenvalues
eigenvalues = eig(R)

% Plot the eigenvalues on the complex plane
figure; % Opens a new figure window
plot(real(eigenvalues), imag(eigenvalues), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Real Part');
ylabel('Imaginary Part');
title('Eigenvalues in the Complex Plane');
grid on;
axis equal;
hold on;

% Additionally, plot the unit circle for reference
th = 0:pi/50:2*pi;
xunit = cos(th);
yunit = sin(th);
plot(xunit, yunit, 'r--'); % Unit circle in red dashed line
legend('Eigenvalues', 'Unit Circle');

hold off;

% ~~~~~~~~~~~~~~ PART C ~~~~~~~~~~~~~~ %

% Find the angle of rotation (alpha)

alpha = acosd( (trace(R) - 1) /2 )

% Find axis of rotation (a_hat)

a = [-1 ; 1 ; -sqrt(3)];

a_hat = -a/norm(a); % Normalize the vector

fprintf('The angle of rotation is alpha = %.2f degrees ',alpha)
disp(' ')
disp('The axis of rotation is a=') 
disp(a_hat)




% ~~~~~~~~~~~~~~ PART D ~~~~~~~~~~~~~~ %

% Use alpha and unit vector a to retrive Matrix R

a_x = [ 0 -a_hat(3,1) a_hat(2,1) ; a_hat(3,1) 0 -a_hat(1,1) ; -a_hat(2,1) a_hat(1,1) 0]

R_prime = cosd(alpha)*I + (1 - cosd(alpha)) * a_hat * a_hat' - sind(alpha)*a_x


