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
