% ARO 4090 - Space Vehicle Dyn. & Cntrl. | Dr. Maggia | Justin Millsap | Homework 2 %
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

% ~~~~~~~~~~~~~~ PART E ~~~~~~~~~~~~~~ %

% Solve for Eurler Angles by using most opitmal positions to compare between R_BI & Rotation Sequence Matrix


theta = asind(-R(1,3)) + 360;
phi   = atan2d(R(2,3) , R(3,3));
psi   = atan2d(R(1,2) , R(1,1));

% Check if Eurler angles work
R1 = [ 1 0 0  ; 0 cosd(phi) sind(phi) ; 0 -sind(phi) cosd(phi)];
R2 = [cosd(theta) 0 -sind(theta); 0 1 0; sind(theta) 0 cosd(theta)];
R3 = [ cosd(psi) sind(psi) 0 ; -sind(psi) cosd(psi) 0 ; 0 0 1];


Rot_Seq = R1*R2*R3;          % [3-2-1] Rotation Sequence
disp(' The Eurler Angles for the given R Matrix for a given Rotation Sequence are')
fprintf('psi = %.2f\n', psi)
fprintf('theta = %.2f\n' , theta)
fprintf('phi = %.2f\n' , phi)

 

%% Problem 2

clc; clear; close all
R = [0 sqrt(2)/2 -sqrt(2)/2 ; 0 sqrt(2)/2 sqrt(2)/2 ; 1 0 0];

I = [1 0 0 ; 0 1 0 ; 0 0 1];

% ~~~~~~~~~~~~~~ PART A ~~~~~~~~~~~~~~ %

% Show that R is a rotation Matrix
    % Must satisfy det(R) = 1 
    % & RR^T = I

condition_1 = det(R)
condition_2 = R*R'

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

a = [1 ; 0 ; 0]
% Find axis of rotation (a_hat)
if alpha >= 0 
    if alpha <= 180
        a = (1/(2*sind(alpha))) * [R(2,3) - R(3,2) ; R(3,1) - R(1,3) ; R(1,2) - R(2,1)]
    end
end

a_hat = a/norm(a)

 % Normalize the vector

fprintf('The angle of rotation is alpha = %.2f degrees ',alpha)
disp(' ')
disp('The axis of rotation is a=') 
disp(a_hat)




% ~~~~~~~~~~~~~~ PART D ~~~~~~~~~~~~~~ %

% Use alpha and unit vector a to retrive Matrix R

a_x = [ 0 -a_hat(3,1) a_hat(2,1) ; a_hat(3,1) 0 -a_hat(1,1) ; -a_hat(2,1) a_hat(1,1) 0]

R_prime = cosd(alpha)*I + (1 - cosd(alpha)) * a_hat * a_hat' - sind(alpha)*a_x

% ~~~~~~~~~~~~~~ PART E ~~~~~~~~~~~~~~ %

% Solve for Eurler Angles by using most opitmal positions to compare between R_BI & Rotation Sequence Matrix


theta = asind(-R(1,3));
phi   = atan2d(R(2,3) , R(3,3));
psi   = atan2d(R(1,2) , R(1,1));

% Check if Eurler angles work
R1 = [ 1 0 0  ; 0 cosd(phi) sind(phi) ; 0 -sind(phi) cosd(phi)];
R2 = [cosd(theta) 0 -sind(theta); 0 1 0; sind(theta) 0 cosd(theta)];
R3 = [ cosd(psi) sind(psi) 0 ; -sind(psi) cosd(psi) 0 ; 0 0 1];


Rot_Seq = R1*R2*R3;          % [3-2-1] Rotation Sequence
disp(' The Eurler Angles for the given R Matrix for a given Rotation Sequence are')
fprintf('psi = %.2f\n', psi)
fprintf('theta = %.2f\n' , theta)
fprintf('phi = %.2f\n' , phi)
