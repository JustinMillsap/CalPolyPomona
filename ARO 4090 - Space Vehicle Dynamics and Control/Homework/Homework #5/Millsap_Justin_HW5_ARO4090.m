% ARO 4090 - Space Vehicle Dyn. & Cntrl. | Dr. Maggia | Justin Millsap %
clc; clear; close all;

%% Problem 1 

Yaw = 50;

Pitch = 30;

Roll = 60;

w_0 = [200 ; 30 ; 10]


%% Problem 2

I_B = [4.038, 0, 0.1; 0, 1.3136, 0; 0.1, 0, 5.1186]

[R_BP , I_p] = eig(I_B)




