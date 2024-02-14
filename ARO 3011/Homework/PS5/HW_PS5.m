%% Homework PS5 | ARO 3011 - Fluid Dynamics | Justin Millsap

%% 5.2.8
clear ; clc; clear all
u = symunit;

%Givens
rho_1 = 0.00238 * (u.slug) * ((1/u.ft)^3) ; %Density
V1 = 6 * (u.ft / u.sec) ;   %Velocity out of chimney
V2 = 15 * (u.ft / u.sec);   %Velocity of Wind
A1 = (pi) * (2*u.ft)^2 ;     %Area of chimney


mdot_1 = (rho_1)*(V1)*(A1);

mdot = vpa(mdot_1)



F_x =  V2*mdot


%% 5.2.11
clear ; clc; clear all
u = symunit;

%givens
rho = 1000 * u.N / (u.m)^2
A1 = (pi) * (0.15* u.m)^2 ;
A2 = (pi) * (0.08* u.m)^2 ;
V1 = 2 *(u.m / u.s) ;
P1 = 100000 * u.N / (u.m)^2

V2 = (A1 / A2)*V1 ;

mdot_1 = (rho)*(V1)*(A1);

mdot = vpa(mdot_1) ;  % mass flow rate simplified value

Velocity_2 = vpa(V2); 

F_x = P1*A1 + mdot*(V2-V1);

Fx = vpa(F_x)

%% 5.2.31
clear ; clc; clear all


%% 5.2.38
clear ; clc; clear all

%a
syms I_in

I_out = 20 ;
V_out = 1500 ;
m_dot_out = 16 ;
theta_out = 8; %degrees
 
V_in = 300 ;
m_dot_in = 16 ;
theta_in = 0 ;%degrees


M = (I_out) * (V_out) * (m_dot_out) * sind(theta_out) - (I_in) * (V_in) * (m_dot_in) * cosd(theta_in);

PitchingMoment = vpa(M)
%b

V_in_b = V_out *cosd(theta_out);

T = (V_out) * (cosd(theta_in)) * (m_dot_out) - (V_in_b)*(m_dot_in);
Thrust = vpa(T)




