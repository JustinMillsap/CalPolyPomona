            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %                 Homework #1                %
            % Justin Millsap | ARO 3191 Space Enviroment %                                 
            %               Professor Steven Nanning     %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem #1 
clc; clear; close all
    %{ 

Problem Statement:
Given a gas sample at a pressure of 7.35 Atm consisting of 1.44 mols total;
0.37 mole is Oxygen (O_2). What is the PP of the O_2

    %}
%~~~~~~~~~~~~~~~~~~~~~~~~~%
% Givens :

Mole_total = 1.44 ;
Mole_oxygen = 0.37;

Pressure = 7.35; % Atm
%~~~~~~~~~~~~~~~~~~~~~~~~~%
% Solution:

% Using P_i = X_i*P

Partial_Pressure_O2 = Pressure*(Mole_oxygen/Mole_total);

fprintf("The Partial Pressure of the Oxygen is %.2f atm " , Partial_Pressure_O2)

%% Problem #2 
clc; clear; close all
    %{ 

Problem Statement:
What is the Molar Mass of Titan's Atmoshpere @ ground level given:
  
Constituents: 
        N2 = 98.4 %
        Methane (CH4) = 1.4%
        H2 = 0.2%
   Molar Masses:
        N2 = 28.014
        Methane (CH4) = 16.043
        H2 = 2.016

    %}
%~~~~~~~~~~~~~~~~~~~~~~~~~%
% Givens :

% Constituents
  N2 = 98.4;
  CH4 = 1.4;
  H2 = 0.2;

% Molar Masses

  N2_mm = 28.014;
  CH4_mm = 16.043;
  H2_mm = 2.016;
%~~~~~~~~~~~~~~~~~~~~~~~~~%
% Solution:

Molar_Mass_Titan_atmosphere = (N2*N2_mm + CH4*CH4_mm + H2*H2_mm)/100 ;

fprintf("The Molar Mass of Titan's Atmosphere is %.2f" , Molar_Mass_Titan_atmosphere);

%% Problem 3

   %{ 



    %}


