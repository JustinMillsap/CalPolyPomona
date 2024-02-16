% HW1 - P1

clc;clear;close all

v_A = [1,2,3]';
v_B = [3.56186,1.13448,0.16150]';

w_A = [-1,2,1]';
w_B = [1.33712,1.31501,-1.57572]';

% Part (a)
dot(v_A,w_A)
dot(v_B,w_B)

% Part (b)
z_A = cross(v_A,w_A)
z_B = cross(v_B,w_B)

% Part (c)
% Since:
% [v_B1]   [r11 r12 r13][v_A1]
% [v_B2] = [r21 r22 r23][v_A2]
% [v_B3]   [r31 r32 r33][v_A3]
% 
% [w_B1]   [r11 r12 r13][w_A1]
% [w_B2] = [r21 r22 r23][w_A2]
% [w_B3]   [r31 r32 r33][w_A3]
%
% [z_B1]   [r11 r12 r13][z_A1]
% [z_B2] = [r21 r22 r23][z_A2]
% [z_B3]   [r31 r32 r33][z_A3]
% 
% then:
% 
% [v_A1 w_A1 z_A1]   [r11 r12 r13][v_B1 w_B1 z_B1]
% [v_A2 w_A2 z_A2] = [r21 r22 r23][v_B2 w_B2 z_B2]
% [v_A3 w_A3 z_A3]   [r31 r32 r33][v_B3 w_B3 z_B3]
% 
% or
% 
% B = R_BA*A

A = [v_A'; w_A'; z_A']';
B = [v_B'; w_B'; z_B']';

R_BA = B*inv(A)

% Check
v_A = R_BA'*v_B
w_A = R_BA'*w_B
z_A = R_BA'*z_B



