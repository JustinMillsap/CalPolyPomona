%% Setup
clearvars; clc; close all;

% Base excitation data
base_exc = [0.0; 0.00571634384576599; 0.0172961399245937; 0.0215661733228299; 0.0138433053175935; 
            0.00475824598689792; 0.00940235333989425; 0.0298244388227628; 0.0502561943723699; 
            0.0516260538077677; 0.0311672997795811; 0.00657207675777726; -0.00043850430233673; 
            0.0150661812622991; 0.0369781637016863; 0.0444861334353839; 0.032063551445643; 
            0.0130695841363085; 0.00450012342523607; 0.00980150594910536; 0.0175350556867159; 
            0.0158705130787799; 0.00603906690334467; 0.0];

% Constants
mass = 1;
spring_k = 100;
damp_ratio = 0.15;
nat_freq = sqrt(spring_k/mass);
damp_coeff = 2 * mass * nat_freq * damp_ratio;
period = pi/2;

% Data points
data_points = length(base_exc);
harmonics = 4;

% Fourier coefficients
t_vals = linspace(0, period, data_points);
fourier_a0 = 2 * sum(base_exc) / data_points;
a_coeffs = zeros(harmonics, 1);
b_coeffs = zeros(harmonics, 1);

for i = 1:harmonics
    a_coeffs(i) = 2 * sum(base_exc .* cos(2 * pi * i * t_vals' / period)) / data_points;
    b_coeffs(i) = 2 * sum(base_exc .* sin(2 * pi * i * t_vals' / period)) / data_points;
end

% Extended time and recreated base excitation
ext_time = linspace(0, 2*period, 2*10*data_points - 1);
recreated_base = fourier_a0/2 * ones(size(ext_time));
for i = 1:harmonics
    recreated_base = recreated_base + a_coeffs(i) * cos(2 * pi * i * ext_time / period) ...
                                     + b_coeffs(i) * sin(2 * pi * i * ext_time / period);
end

% System response
init_cond = [0; 0];
options = odeset('RelTol',1e-5);
[t_response, x_response] = ode45(@(t,x) system_dynamics(t, x, mass, damp_coeff, spring_k, recreated_base, ext_time, period), [0 2*period], init_cond, options);



%% Problem 2 (Frequency Analysis)
freq_anal = linspace(0, 4*nat_freq, 500);
ratio = freq_anal/nat_freq;
damping_levels = [0.05, 0.1, 0.2, 0.25, 0.5, 1.0];

transmissibility = zeros(500, length(damping_levels));

for j = 1:length(damping_levels)
    current_damping = damping_levels(j);
    transmissibility(:,j) = sqrt((1 + (2.*current_damping.*ratio).^2).^0.5 ./ ((1 - ratio.^2).^2 + (2.*current_damping.*ratio).^2));
end
%% Plotting
figure(1);
% Base Excitation Subplot
subplot(3,1,1)
hold on;
plot(ext_time(1:end/2), recreated_base(1:end/2), 'b-', 'LineWidth', 2); % Change color to blue and increase line width
plot(ext_time(end/2+1:end), recreated_base(end/2+1:end), 'r-', 'LineWidth', 2); % Change color to red and increase line width
xlabel('Time (sec)');
ylabel('Base Excitation [m]');
title('Problem 1a: Base Excitation over Time');
grid on;
hold off;

% Displacement Response Subplot
subplot(3,1,2)
plot(t_response, x_response(:,1), 'k', 'LineWidth', 2); % Change to black color and increase line width
xlabel('Time (sec)');
ylabel('Displacement [m]');
title('Problem 1b: System Displacement Response');
grid on;

% Transmissibility Analysis Subplot
subplot(3,1,3)
hold on;
colors = lines(length(damping_levels)); % Use the 'lines' colormap for distinct colors
for j = 1:length(damping_levels)
    plot(ratio, transmissibility(:, j), 'LineWidth', 2, 'Color', colors(j, :)); % Assign color from colormap
end
ylim([0 10]); % Adjust the y-axis limit
line([sqrt(2) sqrt(2)], [0 10], 'Color', 'black', 'LineStyle', '--', 'LineWidth', 1.5, 'DisplayName', '√2 Resonance');
line([1 1], [0 10], 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5, 'DisplayName', '1:1 Resonance');
legend('ζ=0.05', 'ζ=0.1', 'ζ=0.2', 'ζ=0.25', 'ζ=0.5', 'ζ=1.0', '√2 Resonance', '1:1 Resonance');
grid on;
xlabel('Frequency Ratio (ω/ω_n)');
ylabel('Transmissibility');
title('Problem 2: Transmissibility vs. Frequency Ratio');
hold off;


function dy = system_dynamics(t, y, m, c, k, recreated, ext_time, T)
    y_t = interp1(ext_time, recreated, mod(t, T), 'linear', 'extrap');
    dy = [y(2); (1/m) * (-(c * y(2)) - (k * y(1)) + c * y_t)];
end
