% Inputs to Homework 3 Simulink Model
clear; clc;
% Inputs for Block 1 

alpha = 104.47               % Rotation Angles [ degrees ]
a = [-1 ; 1 ; -sqrt(3)]      % Axis of Rotation Versor

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% Inputs for Block 3

psi =  90            % Yaw [ Degrees ]
theta = 45            % Pitches [ Degrees ]
phi =   90       % Roll [ Degrees ]


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% Inputs for Block 5

B_0 = 0.824
B_1 = 0.2006
B_2 = 0.3919
B_3 = 0.3604

Beta = [B_0 ; B_1 ; B_2 ; B_3] ; % Quaternion Matrix [4x1]




