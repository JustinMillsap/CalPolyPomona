
%%
clear; clc; close all

%% GIVENS
% excitation data points
y = [0.0; 0.00571634384576599; 0.0172961399245937; 0.0215661733228299; 0.0138433053175935; 
     0.00475824598689792; 0.00940235333989425; 0.0298244388227628; 0.0502561943723699; 
     0.0516260538077677; 0.0311672997795811; 0.00657207675777726; -0.00043850430233673; 
     0.0150661812622991; 0.0369781637016863; 0.0444861334353839; 0.032063551445643; 
     0.0130695841363085; 0.00450012342523607; 0.00980150594910536; 0.0175350556867159; 
     0.0158705130787799; 0.00603906690334467; 0.0];

mass = 1; 
spring_constant = 100; 
damping_ratio = 0.15; 
natural_freq = sqrt(spring_constant/mass); 
damping_coefficient = 2 * mass * natural_freq * damping_ratio;
period = pi/2; % period of the base motion
% Number of data points and harmonics
N = length(y);
num_harmonics = 4;
% Calculate Fourier coefficients
a0 = 2 * sum(y) / N;
a = zeros(num_harmonics, 1);
b = zeros(num_harmonics, 1);
t = linspace(0, period, N); % Time vector for one period
for n = 1:num_harmonics
    a(n) = 2 * sum(y .* cos(2 * pi * n * t' / period)) / N;
    b(n) = 2 * sum(y .* sin(2 * pi * n * t' / period)) / N;
end
t_prime = linspace(0, 2*period, 10*2*N - 1);  
y_prime = a0/2 * ones(size(t_prime));
for n = 1:num_harmonics
    y_prime = y_prime + a(n) * cos(2 * pi * n * t_prime / period) ...
                                + b(n) * sin(2 * pi * n * t_prime / period);
end
% 1-b
    t_span = [0 2*period]; 
    x0 = [0; 0]; 
    [t, x] = ode45(@(t,x) eom(t, x, mass, damping_coefficient, spring_constant, y_prime, t_prime, period), t_span, x0);
    
 x =(0.032)*x*10^4

%%  Problem 2
mass = 1; 
spring_constant = 100; 
natural_freq = sqrt(spring_constant/mass); 
omega = linspace(0, 4*natural_freq, 500); 
r = omega/natural_freq;

zeta = [0.05, 0.1, 0.2, 0.25, 0.5, 1.0];

TR = zeros(500, 6);

for i = 1:length(zeta)
    damping_ratio = zeta(i);
     TR(:,i) = sqrt((1 + (2.*damping_ratio.*r).^2).^0.5 ./ ((1 - r.^2).^2 + (2.*damping_ratio.*r).^2));
end
%% PLOTS
figure(1);
subplot(2,1,1)
hold on
plot(t_prime(1:end/2), y_prime(1:end/2), 'r*', 'LineWidth', 1.5);
plot(t_prime(end/2+1:end), y_prime(end/2+1:end), 'b*', 'LineWidth', 1.5);
xlabel('Time (sec)');
ylabel('y(t) [m]');
title('Excitation vs Time')
hold off

subplot(2,1,2)
hold on
    plot(t, x(:,1) , 'r*' , 'LineWidth',1.5); 
    xlabel('Time (sec)');
    ylabel('Displacement x(t) [m]');
    title('System Resp');
    grid on;
    
hold off

figure(3);
for i = 1:length(zeta)
    plot(r, TR(:, i));
    hold on; 
end
y_limits = [05];

legend('ζ=0.05', 'ζ=0.1', 'ζ=0.2', 'ζ=0.25', 'ζ=0.5', 'ζ=1.0', 'y = sqrt(2)', 'y = 1');
grid on
xlabel('Frequency Ratio');
ylabel('Displacement Transmissibility');
title('Displacement Transmissibility vs. Frequency Ratio');

%% FUNCTIONS


function dxdt = eom(t, x, m, c, k, y_recreated, t_extended, T)
    % Interpolate y(t) at the current time
    y_t = interp1(t_extended, y_recreated, mod(t, T), 'linear', 'extrap');

    % Equations of motion
    dxdt = zeros(2,1);
    dxdt(1) = x(2);
    dxdt(2) = (1/m) * (-(c * x(2)) - (k * x(1)) + c * y_t);
end