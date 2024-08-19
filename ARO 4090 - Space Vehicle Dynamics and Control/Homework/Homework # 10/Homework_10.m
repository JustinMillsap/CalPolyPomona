%% Part a) Design a PD compensator
clc; clear;

% Constants
wn = 0.2;   % Natural Frequency [rad/s]
zeta = 0.7; % Damping Ratio
Ixx = 40;
Iyy = 50;
Izz = 40;
Rc = 300;
mu = 398600;
w_0 = sqrt(mu / Rc^3);

% PD Controller Parameters
kd = 11.2;
kp = 80.63;  % Corrected from 'kp - 80.63;'
s = tf('s');  % Define the Laplace variable s

% Transfer Functions
G_cs = kp + kd * s;
G_s = 1 / (Iyy * s^2 + 3 * w_0^2 * (Ixx - Izz));

% Closed-loop Transfer Function
T_s = feedback(G_cs * G_s, 1);

% Step Response and Performance Metrics
figure(1); 
step(T_s);  % Changed from step(E_s) to show the output response
info = stepinfo(T_s);  % Get step response characteristics

% Display the information

disp('Step Response Information:');
disp(info);
