clear; clc;

syms y s rho v cap_gamma ;

expression = rho*v*cap_gamma * sqrt(1 - (y/s)^2);
lower_limit = -s;
upper_limit = s;
integral_result = int(expression, y, lower_limit, upper_limit);

disp(integral_result);

pretty(integral_result)



%%

clear; clc;
AR = 13 ; %Aspect Ratio
b  = 2 ; % Wing Span
c  = b/AR  ; % Chord Length
S  =  b*c ; % Wing Area
AOA_deg = 5 ; % Angle of Attack Deg
AOA_rad =(AOA_deg)*(pi/180)  ; % Angle of Attack Rad
V = 1 ;
rho = 1 ; 


C_l_alpha_degrees = 0.107; % Degrees
C_l_alpha_rad = (C_l_alpha_degrees)*(180/pi) ; %Radians


% Iteration for y values
y_v1 = 0.5  ;
y_v2 = 1    ;
y_c1 = 0    ;
y_c2 = 0.75 ;

B1 = (1/2)*(c)*(C_l_alpha_rad)*(AOA_rad) 
B2 = (1/2)*(c)*(C_l_alpha_rad)*(AOA_rad)

B = [B1 ; B2]

% C_ij = (1/(2*pi))*(y_vi)/( y_vi^2 - y_cj^2)
% Conditions for k_ij ---->
%  if i => j -----> k = 1
%  if i < j  -----> k =0

 C_11 = (1/(2*pi))*(y_v1)/( y_v1^2 - y_c1^2);
 k_11 = 1;

 

 C_12 = (1/(2*pi))*(y_v1)/( y_v1^2 - y_c2^2);
 k_12 = 0;

 C_21 = (1/(2*pi))*(y_v2)/( y_v2^2 - y_c1^2);
 k_21 = 1;

 C_22 = (1/(2*pi))*(y_v2)/( y_v2^2 - y_c2^2);
 k_22 = 1;

 C_ij = [C_11 C_12 ; C_21 C_22]

 syms gamma_1 gamma_2
 gamma = [gamma_1 ; gamma_2]

A = [(1/2)*(c)*(C_l_alpha_rad)*C_11 + k_11 , (1/2)*(c)*(C_l_alpha_rad)*C_21 + k_21 ; (1/2)*(c)*(C_l_alpha_rad)*C_12 + k_12 , (1/2)*(c)*(C_l_alpha_rad)*C_22 + k_22 ]

gamma = A\B
GAMMA_1 = gamma(1) + gamma(2)
GAMMA_2 = gamma(2)

%Downwash velocities 
 
w_1 = C_11*gamma(1) + C_21*gamma(2)
w_2 = C_12*gamma(1) + C_22*gamma(2)

alpha_dw1 = w_1/V
alpha_dw2 = w_2/V

% Coefficients of Lift 

C_l1 = C_l_alpha_rad*(AOA_rad - alpha_dw1)
C_l2 = C_l_alpha_rad*(AOA_rad - alpha_dw2)



q = (1/2)*rho*V^2 % Dynamic pressure

delta_y1 = b/2 ;
delta_y2 = b/2 ;

% Calculating Lift Coefficient C_L

L = rho*V*(GAMMA_1*delta_y1 + GAMMA_2*delta_y2)

C_L = L/(q*S)

% Calculate induced drag coefficient C_di