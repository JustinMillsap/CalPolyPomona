% ARO - 4090 Homework 6
% Written By: Justin Millsap
% Instructor: Dr. Maggia
% Date: 03/14/2024
% Tool Version: R2023b
% other .m files required: RotationMatrix.m [function]

%% a) Compute the instantenous rotation matrix between the I - RF & B - RF

% Yaw = 40
% Pitch = 0
% Roll = 30

addpath('C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4090 - Space Vehicle Dynamics and Control\Functions') % This is the path to access all functions regarding Space Dynamics & Control

R_BI = RotationMatrix(45 , 0 , 30 , 321) ; % ( Yaw, Pitch, Roll, Rot_Seq )

R_IB = R_BI' ;
disp("The instantenous roation matrix for the B-RF is");
disp("")
disp(R_BI);
disp("The instantenous roation matrix for the I-RF is");
disp("")
disp(R_IB);


R_BI_PE = RotationMatrix(180 , 0 , 180 , 321)

H_B = [0 ; 0.01363 ; -0.00148];

H_I = R_IB*H_B

w = [0 ; 18.8 ; -7.4]


