% ARO - 4090 - Spacevehicle Dynamics & Control: Homework 9
% Written By: Justin Millsap
% Instructor: Dr. Maggia
% Date: 05/05/2024
% Tool Version: R2023b
% other .m files required: NONE
% Resources used:

%% Problem 1
%{

Design a flywhell (i.e., its size and sprin rate) for a dual-spin
stabilized spacecraft so that its rotational motion and tis body-fixed
z-axis is stable.

                 Spacecraft characteristics without wheel:

Mass: m = 1,609 kg
Dimensions along x-y-z axes: [2.49, 2.03, 2.24] m
Nominal rotation speed about body z-axis: 5 [deg/s]

Show the effectiveness of your design by providing the S/C rotational
response perturbed from the equilibrium state.
                           
%}

clear; clc; close all;

% Fly Wheel Design: (EDIT)

% Iw = I_aw - I_tw - m_w*z_w^2

flywheel_mass = 30;         % [kg]
flywheel_diameter = 2.0;    % [m]
flywheel_thickness = 0.2;   % [m]

z_w = 0;
Iaw = (1/4) * flywheel_mass * flywheel_diameter^2;
Itw = (1/12) * flywheel_mass * (0.75 * flywheel_diameter^2) + flywheel_thickness;
Iw = Iaw - Itw - (flywheel_mass * z_w^2);

m = 1630;                   % [kg]
dimX = 2.49;                % [m]
dimY = 2.03;                % [m]
dimZ = 2.24;                % [m]
n_deg = 5;                  % [deg/s]
n_rad = deg2rad(n_deg);     % [rad/s]
n_RPM = n_rad * 9.5493;     % [Revolutions Per Minute]

% Moments of Inertia

Ixx = (m/12) * (dimY^2 + dimZ^2);
Iyy = (m/12) * (dimX^2 + dimZ^2);
Izz = (m/12) * (dimX^2 + dimY^2);

sigmaX = (Izz - Iyy) / Ixx;
sigmaY = (Ixx - Izz) / Iyy;
sigmaZ = (Iyy - Ixx) / Izz;

stabilityCheck = sigmaX * sigmaY;

if stabilityCheck < 0
    disp('System is unstable');
elseif stabilityCheck >= 0
    disp('System has neutral stability');
end

% Moments of Inertia Matrix

I_BC = eye(3);
I_BC(1, 1) = Ixx;
I_BC(2, 2) = Iyy;
I_BC(3, 3) = Izz;

% Calculate Omega (CASE 1 since  Ixx does not equal Iyy)

Omega_1 = (n_rad / Iw) * (0.5 * (Ixx + Iyy) - Izz) - abs(n_rad * (Ixx - Iyy) * (1 / (2 * Iw)));
Omega_2 = (n_rad / Iw) * (0.5 * (Ixx + Iyy) - Izz) + abs(n_rad * (Ixx - Iyy) * (1 / (2 * Iw)));

fprintf('Spin Rates for Neutral Stability:   Omega < %0.1f   or   Omega > %0.1f \n\n', Omega_1, Omega_2);

% Initial conditions for Error

errorX_0 = 9; % [deg/s]
errorY_0 = 9; % [deg/s]
errorZ_0 = 9; % [deg/s]
error_0 = [errorX_0, errorY_0, errorZ_0] * (pi / 180); % [rad/s]

% Initial conditions for [p, q, r]

w = [0, 0, n_rad];

OmegaValues =  [15*pi, 20*pi, 66.667*pi];

syms t s ex ey ez real;

for i = 1:length(OmegaValues)
   
    A = [s, sigmaX * n_rad + (Iw / Ixx) * OmegaValues(i), 0; 
         sigmaY * n_rad - (Iw / Iyy) * OmegaValues(i), s, 0; 
         0, 0, s];

    % Convert error_0 to symbolic
    error_sym = sym(error_0);

    % Solve the system of equations
    Exyz = A \ error_sym';
    error_X(i) = ilaplace(Exyz(1), s, t);
    error_Y(i) = ilaplace(Exyz(2), s, t);
    error_Z(i) = ilaplace(Exyz(3), s, t);
end

time = [0:0.05:20];

for i = 1:length(time)
    eX1(i) = double(subs(error_X(1), t, time(i))) * (180/pi);
    eY1(i) = double(subs(error_Y(1), t, time(i))) * (180/pi);
    eZ1(i) = double(subs(error_Z(1), t, time(i))) * (180/pi);
end

for i = 1:length(time)
    eX2(i) = double(subs(error_X(2), t, time(i))) * (180/pi);
    eY2(i) = double(subs(error_Y(2), t, time(i))) * (180/pi);
    eZ2(i) = double(subs(error_Z(2), t, time(i))) * (180/pi);
end

for i = 1:length(time)
    eX3(i) = double(subs(error_X(3), t, time(i))) * (180/pi);
    eY3(i) = double(subs(error_Y(3), t, time(i))) * (180/pi);
    eZ3(i) = double(subs(error_Z(3), t, time(i))) * (180/pi);
end


%% Plots

subplot(3,1,1)
hold on; 
grid on
plot(time, eX1)
plot(time, eX2)
plot(time, eX3)
xlabel('Time (s)')
ylabel('\epsilon_{x} (t)')
legend('\Omega = 450 RPM', '\Omega = 600 RPM', '\Omega = 2000 RPM')



subplot(3,1,2)
hold on; 
grid on
plot(time, eY1)
plot(time, eY2)
plot(time, eY3)
xlabel('Time (s)')
ylabel('\epsilon_{y} (t)')
legend('\Omega = 450 RPM', '\Omega = 600 RPM', '\Omega = 2000 RPM')

subplot(3,1,3)
hold on; 
grid on
plot(time, eZ1)
plot(time, eZ2)
plot(time, eZ3)
xlabel('Time (s)')
ylabel('\epsilon_{z} (t)')
legend('\Omega = 450 RPM', '\Omega = 600 RPM', '\Omega = 2000 RPM')

