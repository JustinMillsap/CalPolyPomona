% ARO 4090 - Space Vehicle Dyn. & Cntrl. | Dr. Maggia | Justin Millsap | Homework 4 %
%% Problem 1
clc; clear;
% Inputs to Block 5 & 6

B_0 = 0.3
B_1 = 0.64
B_2 = 0.242
B_3 = 0.13

Beta = [B_0 ; B_1 ; B_2 ; B_3] ;

%% Problem 2
clc; clear;

% a) Calculate the Euler Angle Rates (psi_dot , theta_dot , and phi_dot)

w_B_BI = [2; 1; -1]; % angular velocity of the refernce from B realtive to the reference fram I

psi = 60; % [deg]
theta = 30; % [deg]
phi = 45; % [deg]


B_inv = [0 sind(phi) cosd(phi);
        0 cosd(phi)*cosd(theta) -sind(phi)*cosd(theta);
        cosd(theta) sind(phi)*sind(theta) cosd(phi)*sind(theta)];   

B_inv = (1/cosd(theta))*B_inv

Theta_dot = B_inv*w_B_BI;

% b) Compute the direction cosine matrix (D.C.M) R_BI & its instantaneous rate of change R_BI_dot

w_B_skew = [0 -1 -1;
            1  0  2;
            1 -2  0]

R_BI = [cosd(theta)*cosd(psi) , cosd(theta)*sind(psi) , -sind(theta);
        sind(phi)*sind(theta)*cosd(psi)-cosd(phi)*sind(psi) , sind(phi)*sind(theta)*sind(psi)+cosd(phi)*cosd(psi) , sind(phi)*cosd(theta);
        cosd(phi)*sind(theta)*cosd(psi)+sind(phi)*sind(psi) , cosd(phi)*sind(theta)*sind(psi)-sind(phi)*cosd(psi) , cosd(phi)*cosd(theta)]

R_BI_dot = w_B_skew*R_BI

% c) Calculate the quaternion vector Beta and its rate of change Beta_dot

% Sheppards method

    % 1) first calculate B_0^2 ..... B_3^2  will be defined as B_1_check1
    % % ALL VALUES ARE SQUARED

        B_0_check = (1/4)*(1+ R_BI(1,1) + R_BI(2,2) + R_BI(3,3));
        B_1_check = (1/4)*(1+ R_BI(1,1) - R_BI(2,2) - R_BI(3,3));
        B_2_check = (1/4)*(1+ R_BI(2,2) - R_BI(1,1) - R_BI(3,3));
        B_3_check = (1/4)*(1+ R_BI(3,3) - R_BI(1,1) - R_BI(2,2));

        B_check = [B_0_check ; B_1_check ; B_2_check ; B_3_check]

       B_max = max(B_check)

  
        if B_max == B_0_check % B_0 is max
            B_0 = sqrt(B_0_check);
             B_1 = (1/(4*B_0))*( R_BI(2,3) - R_BI(3,2));
             B_2 = (1/(4*B_0))*( R_BI(3,1) - R_BI(1,3));
             B_3 = (1/(4*B_0))*( R_BI(1,2) - R_BI(2,1));

        elseif B_max == B_1_check % B_1 is max
            B_1 = sqrt(B_1_check)
             B_0 = (1/(4*B_1))*( R_BI(2,3) - R_BI(3,2));
             B_2 = (1/(4*B_1))*( R_BI(2,1) - R_BI(1,2));
             B_3 = (1/(4*B_1))*( R_BI(1,3) - R_BI(3,1));
        
        elseif B_max == B_2_check % B_2 is max
            B_2 = sqrt(B_2_check);
             B_0 = (1/(4*B_2))*( R_BI(3,1) - R_BI(1,3));
             B_1 = (1/(4*B_2))*( R_BI(2,1) + R_BI(1,2));
             B_3 = (1/(4*B_2))*( R_BI(3,2) + R_BI(2,3));

        elseif B_max == B_3_check % B_3 is max
            B_3 = sqrt(B_3_check);
             B_0 = (1/(4*B_2))*( R_BI(1,2) - R_BI(2,1));
             B_1 = (1/(4*B_2))*( R_BI(1,3) + R_BI(3,1));
             B_2 = (1/(4*B_2))*( R_BI(3,2) + R_BI(2,3));
        end


B = [B_0 ; B_1 ; B_2 ; B_3];

if B < 0
    B = -1*B
    else B = B
end

% B_dot

B_beta = [ -B(2) , -B(3) , -B(4);
            B(1) , -B(4) , B(3);
            B(4) , B(1) , -B(2);
            -B(3) , B(2) , B(1)]

Beta_dot = (1/2)*B_beta*w_B_BI;




