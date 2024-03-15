clc, clear, close all
tic
% -------------MATLAB Script Information-------------
% Author Names: Francisco Sanudo
% Date: 3/5/24
% Tool Version: R2023b
% Purpose of Script: ARO 3191 Homework 6
% other .m files required: None
% other files required (not .m): None

%%%%%%%%%%%%%%%%%%%%%%%%% EDITABLE %%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1 Inputs 
% No given 

% Problem 2 Inputs 
n_e = 1E7; % [m^-3]
lambda_d = 55; % [m] debye length 

% Problem 3 Inputs 
k_1 = 8.979; % [m^3/2 * Hz]
f_pe3 = 5; % [MHz]

% Problem 4 Inputs
f = 100; % [MHz] Transmission frequency 
TEC = 1E15; % Total electron count
k_2 = 40.31; % [m^3 Hx^2]

% Problem 5 Inputs 
k_1 = 8.979; % [m^3/2 * Hz]
n_e5 = 2E11; % [m^-3] Electron number density
%%%%%%%%%%%%%%%%%%%%%%%%% EDITABLE %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% NON-EDITABLE %%%%%%%%%%%%%%%%%%%%%%%
% Problem 1: DeBye Length of a Plasma
fprintf('=====================================================\n')
fprintf('Problem 1\n')
fprintf('The DeBye length is the distance scale factor where the electric field is reduced to 1/e of the value it would have in the abscence of the plasma\n')

% Problem 2: Generalized Plasma Parameter
lambda = (4 * pi * n_e * lambda_d^3)/3; % [dimmensionless] Generalized plasma parameter

fprintf('=====================================================\n')
fprintf('Problem 2\n')
fprintf('The generalized plasma parameter is %d\n', lambda)

% Problem 3: Region of ionosphere
fprintf('=====================================================\n')
fprintf('Problem 3\n')

n_e3 = (f_pe3 * 1E6 /k_1)^2; % Equation 13.8, page 600
fprintf('F1 region, since %d is betweeen 2-5 x 10^11 electrons/m^3\n', n_e3)

% Problem 4: Range error
r = k_2 * (TEC/(f*1E6)^2); % Equation 13.36, oage 618)

fprintf('=====================================================\n')
fprintf('Problem 4\n')
fprintf('The range error is %0.8f meters \n', r)

% Problem 5: Critical frequency 
f_pe = k_1 * sqrt(n_e5); % [Hz} Critical frequency (Equation 13.8, page 600)

fprintf('=====================================================\n')
fprintf('Problem 5\n')
fprintf('The critical frequency is %0.8f Hz or %0.8f MHz \n', f_pe, f_pe/1E6)

%%%%%%%%%%%%%%%%%%%%%%% NON-EDITABLE %%%%%%%%%%%%%%%%%%%%%%%
toc