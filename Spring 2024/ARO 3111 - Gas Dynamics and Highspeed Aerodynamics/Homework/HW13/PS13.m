% ARO - 3111 - Gas Dynamics & Highspeed Aerodynamics PS13
% Written By: Justin Millsap
% Instructor: Dr. Tony Lin
% Date: 04/17/2024
% Tool Version: R2023b
% other .m files required: RotationMatrix.m [function]
% Reference: John D Anderson Modern Compressible flow Textbook

%% Problem # 4.17 
clc;clear;
alpha = [0, 5, 10, 15, 20, 25, 30];
pBottom1 = [1, 1.458, 2.055, 2.820, 3.783, 4.881, 6.331];
pTop1 = [1, 0.670, 0.430, 0.269, 0.159, 0.09, 0.048];

tempBottom1 = [270, 301, 335, 375, 422, 474, 541];
tempTop1 = [270, 241, 212, 186, 160, 136, 114];

lift1 = [0, 7.93*10^4, 1.62*10^5, 2.49*10^5, 3.44*10^5, 4.37*10^5, 5.50*10^5];
drag1 = [0, 6.94*10^3, 2.85*10^4, 6.68*10^4, 1.25*10^5, 2.05*10^5, 3.18*10^5];
lOverd1 = [11.4, 5.68, 3.73, 2.75, 2.14, 1.73];


figure(1) 
hold on
plot(alpha , pTop1)
plot(alpha ,pBottom1)
title("Pressure (top & bottom) vs AoA")
legend ("Top Pressure" , "Bottom Pressure")
grid on
hold off

figure(2)
hold on
plot(alpha , tempTop1)
plot(alpha ,tempBottom1)
title("Temperature (top & bottom) vs AoA")
legend ("Top Temperature" , "Bottom Temperature")
grid on
legend on
hold off

figure(3)
hold on
plot(alpha, lift1)
title("Lift vs AoA")
grid on

hold off

figure(4)
hold on
plot(alpha,drag1)
title("Drag vs AoA")
grid on

hold off

figure(5)
hold on
plot(alpha(2:7),lOverd1)
title("Lift/drag vs AoA")
grid on

hold off

%% Problem 9.9
clc;clear;
alpha = [0, 5, 10, 15, 20, 25, 30];
pBottom1 = [1.01*10^5, 1.4*10^5, 1.8*10^5, 2.19*10^5, 2.58*10^5, 2.97*10^5, 3.37*10^5];
pTop1 = [1.01*10^5, 0.619*10^5, 0.22*10^5, 0, 0, 0, 0];

pBottom1 = pBottom1 ./ 101325;
pTop1 = pTop1 ./ 101325;

tempBottom1 = [270, 296, 318, 337, 353, 367, 381]; 
tempTop1 = [270, 235, 174, 0, 0, 0, 0];

lift1 = [0, 0.782*10^5, 1.57*10^5, 2.36*10^5, 3.14*10^5, 3.92*10^5, 4.72*10^5];
drag1 = [0, 0.068*10^5, 0.276*10^5, 0.618*10^5, 1.10*10^5, 1.71*10^5, 2.47*10^5];
lOverd1 = [11.5, 5.69, 3.82, 2.85, 2.29, 1.91];

figure(1) 
hold on
plot(alpha , pTop1)
plot(alpha ,pBottom1)
title("Pressure (top & bottom) vs AoA")
legend ("Top Pressure" , "Bottom Pressure")
grid on
hold off

figure(2)
hold on
plot(alpha , tempTop1)
plot(alpha ,tempBottom1)
title("Temperature (top & bottom) vs AoA")
legend ("Top Temperature" , "Bottom Temperature")
grid on
legend on
hold off

figure(3)
hold on
plot(alpha, lift1)
title("Lift vs AoA")
grid on

hold off

figure(4)
hold on
plot(alpha,drag1)
title("Drag vs AoA")
grid on

hold off

figure(5)
hold on
plot(alpha(2:7),lOverd1)
title("Lift/drag vs AoA")
grid on

hold off

