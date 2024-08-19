% ARO - 3111 Gas Dynamics & Highspeed Aerodynamics
% Computer Assignment - Taylor-Maccoll Program
% Written By: Justin Millsap
% Date: 03/21/2024
% Tool Version: R2023b
% other .m files required: RungeKutta.m 
% Other files required: NONE
% Reference: John D. Anderson - Modern Compressible Flow

tic
%% Nomenclature
%{
- Station 1 is the free stream
- Station 2 is right behind the shock
- Station c is at the surface of the cone
- Subscript o is stagnation values
- Cone angles is theta_c
- Conical shock angle is theta_s or beta
- Initial turning of the streamline as the flow crosses the shock from 1 to 2
  is delta which is < theta_c
%}
clc;
clear

%% Givens


theta_s = 12:-0.1:0; % Shock wave angle [deg]
theta_s = deg2rad(theta_s);
M_1 = 6;
gamma = 1.4;
beta = 12; % [deg]
beta = deg2rad(beta);


% Solve for M2 & Delta (flow deflection angle)
M_n1 = M_1 * sin(beta);

% Theta-Beta-M relation [Eq 4.17]
num_tbm = (M_1)^2 * (sin(beta))^2 - 1;                                     
den_tbm = (M_1)^2 * (gamma + cos(2*beta)) + 2;                              
delta = atan(2 * cot(beta) * (num_tbm / den_tbm));

% Solve for M_n2
num_Mn2 = (M_n1)^2 + (2 / (gamma - 1));
den_Mn2 = ((2 * gamma) / (gamma - 1)) * (M_n1)^2 - 1;
M_n2 = sqrt(num_Mn2 / den_Mn2);

% Solve for M2
M_2 = M_n2 / sin(beta - delta);

% Solve for V_prime, V_r_prime, V_theta_prime
V_prime = (2 / ((gamma - 1) * (M_2)^2) + 1)^(-0.5);                           
V_theta_prime = sin(beta - delta) * V_prime*(-1);                             
V_r_prime = cos(beta - delta) * V_prime;                                   

%%

[V_r , V_theta] = RungeKutta(V_r_prime, V_theta_prime , theta_s, gamma);


V_r = V_r(1:51);
V_theta = V_theta(1:51);

V = sqrt(V_r.^2 + V_theta.^2);
M = zeros(1,160);
 for i = 1:51
 M(i+108) = sqrt(2/((V(i)^-2 - 1)*(gamma-1)) );
 end

M(1:109) = M_1;
M(160) = 5.3457;
angles_for_plots_Mach = 22.9:-0.1:7;
angles_for_plots_Mach(109) = 12;

%% Ratios

% Pressure ratio (Isolating for P/P1)
P2overP1 = (1 + ((2*gamma)/(gamma+1))*(M_n1^2 -1) ) ;                        % Equation 3.30
PoverPo2 = (1+((gamma-1)/2).*M.^2).^(-gamma/(gamma-1));                      % Equation 3.30
P2overPo2 = (1+((gamma-1)/2).*M_2.^2).^(-gamma/(gamma-1));                   % Equation 3.30
PoverP1 = (PoverPo2/P2overPo2)*P2overP1;

% Density ratio (Isolating for rho/rho1)

rho2overrho1 = (((gamma+1)* M_n1^2) / ((gamma-1) * (M_n1^2)+2)) ;                       
rhooverrhoo2 = (1 +((gamma-1)/2).*M.^2).^(-1/(gamma-1));                    % Equation 3.30
rho2overrhoo2 = (1 +((gamma-1)/2).*M_2^2).^(-1/(gamma-1));                  % Equation 3.30
rhooverrho1 = (rhooverrhoo2/rho2overrhoo2)*rho2overrho1;

% Tempertuare ratio (Isolating for T/T1)
T = 1 + (gamma-1)/2.*M.^2;
T1 = 1+ (gamma -1)*M_1^2 / 2;
ToverT1 = T1./T;

figure(1);
set(gcf, 'Position', [100, 100, 800, 600]); 
hold on;
plot(angles_for_plots_Mach, M(1:160), 'LineWidth', 2);
set(gca, 'XDir', 'reverse');
ylim([4.8 6.2]);
yticks(4.8:0.2:6.2);
xlim([7 20]);
xticks(7:1:20);
ylabel('Mach Number', 'FontSize', 14); 
xlabel('\theta_s', 'FontSize', 14); 
title('Mach Number vs \theta_s', 'FontSize', 16); 
set(gca, 'FontSize', 12);
grid on;
hold off;


angles_for_plots_ratio = 18:-0.1:7;
rhooverrho1 = rhooverrho1(50:160);
PoverP1 = PoverP1(50:160);
ToverT1 = ToverT1(50:160);

PoverP1(1:60) = 1;
rhooverrho1(1:60) = 1;
ToverT1(1:60) = 1;
    
angles_for_plots_ratio(60) = 12;

figure(2);
set(gcf, 'Position', [100, 100, 800, 600]); 
hold on;
plot(angles_for_plots_ratio, PoverP1, 'Color', 'b', 'LineWidth', 2); 
plot(angles_for_plots_ratio, rhooverrho1, 'Color', '[1, 0.5, 0]', 'LineWidth', 2); 
plot(angles_for_plots_ratio, ToverT1, 'Color', 'r', 'LineWidth', 2); 
legend('P/P_1', '\rho/\rho_1', 'T/T_o', 'Location', 'best', 'FontSize', 12);
set(gca, 'XDir', 'reverse');
ylim([0 3]);
yticks(0:0.2:3);
xlim([7 20]);
xticks(7:1:20);
ylabel('P/P1 , \rho/\rho1 , T/T1', 'FontSize', 14); 
xlabel('\theta_s [Degrees]', 'FontSize', 14); 
title('P/P1 , \rho/\rho1 , T/T1 vs \theta_s', 'FontSize', 16); 
set(gca, 'FontSize', 12); 
grid on;
hold off;



angles_for_plots_Vtheta = [20 , 19 , 18 , 17 , 16 , 15 , 14 , 13 , 12.1 , 12]*pi/180;

Vtheta = -V_prime*sin(angles_for_plots_Vtheta);
Vr = V_prime*cos(angles_for_plots_Vtheta);
angles_for_plots_Vtheta = [angles_for_plots_Vtheta theta_s(1:51)]*180/pi;
V_theta = [Vtheta V_theta];
figure(3);
hold on;
set(gcf, 'Position', [100, 100, 800, 600]); 
plot(angles_for_plots_Vtheta, V_theta, 'LineWidth', 2); 
set(gca, 'XDir', 'reverse');
legend('V_\theta', 'FontSize', 12); 
ylim([-0.5 0.1]);
yticks([-0.5:0.1:0.2]);
xlim([7 20]);
xticks(7:1:20);
ylabel('V_\theta', 'FontSize', 14); 
xlabel('\theta_s [Degrees]', 'FontSize', 14);
title("V_\theta vs. \theta_s", 'FontSize', 16); 
set(gca, 'FontSize', 12); 
grid on;
hold off;



V_r = [Vr V_r];
M = M(110:160);
MachCalc = [6 6 6 6 6 6 6 6 6 6];
Mach = [MachCalc M];
ones = [1 1 1 1 1 1 1 1 1 1];
T_overT1 = [ones ToverT1(61:111)];
rho_over_rho1 = [ones rhooverrho1(61:111)];
P_overP1 = [ones PoverP1(61:111)];
toc

fprintf('θ_s | V_r | V_θ | Mach # | P/P_1 | ρ/ρ_1 | T/T_1\n');

fprintf('-------------------------------------------------------------------------\n');

for i = 1:61
    fprintf('%7.1f | %5.3f | %7.3f | %6.2f | %5.3f | %9.3f | %5.3f\n', ...
            angles_for_plots_Vtheta(i), V_r(i), V_theta(i), Mach(i), P_overP1(i), rho_over_rho1(i), T_overT1(i));
end



%% Runge Kutta Function
function [V_r, V_theta] = RungeKutta(V_r_prime, V_theta_prime, theta_s, gamma)
%{
RungeKutta method that solves for V_r & V_theta. 
The inputs are the initial conditions of V_r and V_theta (V_r_prime, V_theta_prime),
a vector of theta values (theta_s), and the specific heat ratio (gamma).
%}

h = -0.1 * pi / 180; % Convert step size to radians if theta_s is in degrees
V_r = zeros(1, length(theta_s)); % Initialize V_r
V_theta = zeros(1, length(theta_s)); % Initialize V_theta

% Set the initial conditions
V_r(1) = V_r_prime;
V_theta(1) = V_theta_prime;

for i = 1:(length(theta_s) - 1)

    f1 = @(theta_s, V_r, V_theta) V_theta; 
    f2 = @(theta_s, V_r, V_theta) (V_theta^2 * V_r - (gamma - 1) / 2 * (1 - V_r^2 - V_theta^2) * (2 * V_r + V_theta * cot(theta_s))) / ((gamma - 1) / 2 * (1 - V_r^2 - V_theta^2) - V_theta^2);

    k11 = h * f1(theta_s(i), V_r(i), V_theta(i));
    k12 = h * f2(theta_s(i), V_r(i), V_theta(i));

    k21 = h * f1(theta_s(i) + 0.5 * h, V_r(i) + 0.5 * k11, V_theta(i) + 0.5 * k12);
    k22 = h * f2(theta_s(i) + 0.5 * h, V_r(i) + 0.5 * k11, V_theta(i) + 0.5 * k12);

    k31 = h * f1(theta_s(i) + 0.5 * h, V_r(i) + 0.5 * k21, V_theta(i) + 0.5 * k22);
    k32 = h * f2(theta_s(i) + 0.5 * h, V_r(i) + 0.5 * k21, V_theta(i) + 0.5 * k22);

    k41 = h * f1(theta_s(i) + h, V_r(i) + k31, V_theta(i) + k32);
    k42 = h * f2(theta_s(i) + h, V_r(i) + k31, V_theta(i) + k32);

    V_r(i + 1) = V_r(i) + (1 / 6) * (k11 + 2 * k21 + 2 * k31 + k41);
    V_theta(i + 1) = V_theta(i) + (1 / 6) * (k12 + 2 * k22 + 2 * k32 + k42);
end

end



