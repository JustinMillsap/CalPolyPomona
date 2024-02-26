clc; clear;

q =3.64*10^1 * 1/144 % psi
%% x vs y Plot

xVals = [0 0.1 0.2 0.4 0.6 0.8 1.2 1.6 2 2.4 3.2 4 4.8 5.6 6.4 7.2 7.6 8 ...
    7.6 7.2 6.4 5.6 3.2 2.4 2 1.6 1.2 0.8 0.6 0.4 0.2 0.1];

yVals = [0, -0.15152, -0.2092, -0.2844, -0.336, -0.37464, -0.4276, ...
    -0.45896, -0.47528, -0.48016, -0.46424, -0.42352, -0.36504, -0.29312, ...
    -0.20984, -0.11584, -0.06456, 0.008, 0.06456, 0.11584, 0.20984,...
    0.29312, 0.46424, 0.48016, 0.47528, 0.45896, 0.4276, 0.37464, 0.336, ...
    0.2844, 0.2092, 0.15152];

plot(xVals, yVals, 'color', 'black', 'linewidth', 1.5);
xlabel('x - Values')
ylabel('y - Values')
title('Airfoil x, y')
hold off

%% Cp vs. X/C at AOA
% 
% pressureDatapsi = [1.85E-01	-2.43E-01	-2.75E-01	-2.65E-01	-2.48E-01	-1.95E-02	-2.37E-01	-2.11E-01	-1.98E-01	4.94E-02	-1.67E-01	-1.44E-01	7.91E-03	-1.10E-01	-8.58E-02	-5.98E-02	-4.63E-02	-1.57E-02	-6.46E-02	-7.60E-02	-8.59E-02	-9.98E-02	-1.30E-01	-1.35E-01	-1.41E-01	-1.41E-01	-1.44E-01	-1.34E-01	-1.19E-01	-1.01E-01	-6.83E-02	-2.06E-02
% ];
% pressureDatapsf = pressureDatapsi * 144;
% 
% dynamicPressure = 1.07E+01;
% 
% coefficientsPressure = pressureDatapsf / dynamicPressure;
% 
% xOverc = [0, 0.0125, 0.025, 0.05, 0.075, 0.1, 0.15, 0.2, 0.25, 0.3,... 
%           0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1.0000, .9500, 0.9000,... 
%           0.8000, 0.7000, 0.4000, 0.3000, 0.2500, 0.2000, 0.1500, 0.1000,...
%           0.0750, 0.0500, 0.0250, 0.0125];
% 
% for i = 1:16
%     coefficientsPressure(i) = coefficientsPressure(i) * -1;
% end
% 
% coefficientsPressure01 = coefficientsPressure;
% 
% 
% for i = 3:29
%     if abs(coefficientsPressure(i) - coefficientsPressure(i-1)) > 1
%         coefficientsPressure(i) = (coefficientsPressure(i-1) + coefficientsPressure(i+1))/2;
%     end
% end
% coefficientsPressure(1) = 0;
% coefficientsPressure(32) = 0;
% coefficientsPressure01(1) = 0;
% coefficientsPressure01(32) = 0;
% coefficientsPressure(2) = coefficientsPressure(2) - 1;
% coefficientsPressure(3) = coefficientsPressure(3) - 1;
% coefficientsPressure01(2) = coefficientsPressure01(2) - 1;
% coefficientsPressure01(3) = coefficientsPressure01(3) - 1;
% 
% 
% plot(xOverc, coefficientsPressure01, 'color', 'black', 'linewidth', 1)
% hold on
% plot(xOverc, coefficientsPressure, 'color', 'red', 'linewidth', 1.5)
% xlabel('X/c', 'fontsize', 12)
% ylabel('Coefficients of Pressure (Cp)', 'fontsize', 12)
% legend('Uninterpolated Data', 'Interpolated Data')
% grid on
% hold off

%% AOA -4

xOverc = [0, 0.0125, 0.025, 0.05, 0.075, 0.1, 0.15, 0.2, 0.25, 0.3,... 
          0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1.0000, .9500, 0.9000,... 
          0.8000, 0.7000, 0.4000, 0.3000, 0.2500, 0.2000, 0.1500, 0.1000,...
          0.0750, 0.0500, 0.0250, 0.0125];

pneg4 = [-9.74E-02	-6.62E-01	-5.72E-01	-4.66E-01	-4.06E-01...
    -3.55E-02	-3.37E-01	-2.85E-01	-2.64E-01	4.75E-02	-2.07E-01...
    -1.72E-01	4.88E-03	-1.23E-01	-9.47E-02	-6.72E-02	-5.67E-02...
    -4.57E-02	-4.95E-02	-5.73E-02	-6.12E-02	-7.12E-02	-7.73E-02...
    -7.03E-02	-6.73E-02	-5.65E-02	-4.48E-02	-1.65E-02	8.93E-03...
    4.47E-02	1.01E-01	1.56E-01];

pneg4unfixed = pneg4;

for i = 3:29
    if (pneg4(i) - pneg4(i-1)) > 0.1
        pneg4(i) = (pneg4(i-1) + pneg4(i+1))/2;
    end
end

pneg4(1) = -0.8;
pneg4unfixed(1) = -0.8;

lower = pneg4(1:17);
upper = pneg4(17:32);

figure(1)
plot(xOverc, pneg4unfixed, 'linewidth', 1)
hold on
plot(xOverc, pneg4, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('-4 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = -4
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('-4 Deg. AOA C_p vs. X/c')
grid on
hold off

% Finding Area under Cp curve
% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);
% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_neg4 = (N_u - N_l)/c_bar;

   

%% AOA 0

p0 = [1.85E-01	-2.43E-01	-2.75E-01	-2.65E-01	-2.48E-01...
    -1.95E-02	-2.37E-01	-2.11E-01	-1.98E-01	4.94E-02	-1.67E-01...
    -1.44E-01	7.91E-03	-1.10E-01	-8.58E-02	-5.98E-02	-4.63E-02...
    -1.57E-02	-6.46E-02	-7.60E-02	-8.59E-02	-9.98E-02	-1.30E-01...
    -1.35E-01	-1.41E-01	-1.41E-01	-1.44E-01	-1.34E-01	-1.19E-01...
    -1.01E-01	-6.83E-02	-2.06E-02];

p0unfixed = p0;

for i = 3:29
    if (p0(i) - p0(i-1)) > 0.1
        p0(i) = (p0(i-1) + p0(i+1))/2;
    end
end

p0(1) = -0.2;
p0unfixed(1) = -0.2;

lower = p0(1:17);
upper = p0(17:32);

figure(1)
plot(xOverc, p0unfixed, 'linewidth', 1)
hold on
plot(xOverc, p0, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('0 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 0
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('0 Deg. AOA C_p vs. X/c')
grid on
hold off

% Finding Area under Cp curve
% For Cp_lower;
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper;
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4 ;%c/4
C_N_0 = (N_u - N_l)/c_bar;

%% AOA 4

p4 = [1.79E-01	4.49E-02	-3.63E-02	-8.49E-02	-1.03E-01...
    -8.39E-03	-1.39E-01	-1.30E-01	-1.31E-01	5.08E-02	-1.23E-01...
    -1.09E-01	1.09E-02	-9.04E-02	-7.35E-02	-5.64E-02	-4.79E-02...
    -1.85E-02	-6.20E-02	-7.90E-02	-9.48E-02	-1.23E-01	-1.72E-01...
    -1.91E-01	-2.07E-01	-2.18E-01	-2.39E-01	-2.56E-01	-2.60E-01...
    -2.76E-01	-2.97E-01	-3.11E-01];

p4unfixed = p4;

for i = 3:29
    if (p4(i) - p4(i-1)) > 0.05
        p4(i) = (p4(i-1) + p4(i+1))/2;
    end
end

lower = p4(1:17);
upper = p4(17:32);

figure(1)
plot(xOverc, p4unfixed, 'linewidth', 1)
hold on
plot(xOverc, p4, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('4 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 4
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('4 Deg. AOA C_p vs. X/c')
grid on
hold off

% Finding Area under Cp curve
% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_4 = (N_u - N_l)/c_bar;

%% AOA 8

p8 = [-1.44E-01	1.87E-01	1.29E-01	6.32E-02	2.63E-02...
    -4.10E-05	-3.83E-02	-4.52E-02	-5.61E-02	5.27E-02	-7.06E-02...
    -6.71E-02	1.33E-02	-6.19E-02	-5.18E-02	-4.32E-02	-3.90E-02...
    -3.25E-02	-5.84E-02	-7.71E-02	-1.00E-01	-1.31E-01	-2.13E-01...
    -2.48E-01	-2.75E-01	-3.00E-01	-3.43E-01	-3.80E-01	-4.23E-01...
    -4.84E-01	-5.77E-01	-7.04E-01];

p8unfixed = p8;

for i = 3:29
    if (p8(i) - p8(i-1)) > 0.05
        p8(i) = (p8(i-1) + p8(i+1))/2;
    end
end

p8(1) = 0.3;
p8unfixed(1) = 0.3;

lower = p8(1:17);
upper = p8(17:32);

figure(1)
plot(xOverc, p8unfixed, 'linewidth', 1)
hold on
plot(xOverc, p8, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('8 Deg. AOA Pressure vs. X/c')
grid on
hold off

figure(2)
% Cp vs. x/c @ AoA = 8
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('8 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4 ;%c/4
C_N_8 = (N_u - N_l)/c_bar;

%% AOA 10

p10 = [-3.82E-01	1.94E-01	1.67E-01	1.08E-01	6.90E-02...
    2.72E-03	-9.81E-04	-1.29E-02	-2.77E-02	5.32E-02	-5.00E-02...
    -5.11E-02	1.49E-02	-5.33E-02	-4.69E-02	-4.14E-02	-4.03E-02...
    -3.61E-02	-5.33E-02	-7.07E-02	-9.60E-02	-1.29E-01	-2.23E-01...
    -2.65E-01	-2.97E-01	-3.29E-01	-3.82E-01	-4.45E-01	-4.80E-01...
    -5.14E-01	-7.32E-01	-8.89E-01];

p10unfixed = p10;

for i = 3:29
    if (p10(i) - p10(i-1)) > 0.05
        p10(i) = (p10(i-1) + p10(i+1))/2;
    end
end

p10(1) = 0.3;
p10unfixed(1) = 0.3;

lower = p10(1:17);
upper = p10(17:32);

figure(1)
plot(xOverc, p10unfixed, 'linewidth', 1)
hold on
plot(xOverc, p10, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('10 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 10
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('10 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_10 = (N_u - N_l)/c_bar;

%% AOA 12

p12 = [-6.75E-01	1.80E-01	1.86E-01	1.43E-01	1.05E-01...
    5.51E-03	3.12E-02	1.48E-02	-2.75E-03	5.39E-02	-3.20E-02...
    -3.81E-02	1.56E-02	-4.73E-02	-4.47E-02	-4.41E-02	-4.92E-02...
    -4.68E-02	-5.51E-02	-6.82E-02	-9.29E-02	-1.26E-01	-2.34E-01...
    -2.83E-01	-3.20E-01	-3.59E-01	-4.22E-01	-5.03E-01	-5.55E-01...
    -6.27E-01	-9.31E-01, -1.2];

p12unfixed = p12;

for i = 3:29
    if (p12(i) - p12(i-1)) > 0.03
        p12(i) = (p12(i-1) + p12(i+1))/2;
    end
end

p12(1) = 0.45; p12unfixed(1) = 0.3;
p12(6) = 0.1; p12(2) = 0.3;

lower = p12(1:17);
upper = p12(17:32);

figure(1)
plot(xOverc, p12unfixed, 'linewidth', 1)
hold on
plot(xOverc, p12, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('12 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 12
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('12 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_12 = (N_u - N_l)/c_bar;

%% AOA 13

p13 = [-8.24E-01	1.63E-01	1.89E-01	1.54E-01	1.18E-01...
     5.86E-03	4.43E-02	2.69E-02	8.41E-03	5.41E-02	-2.42E-02...
    -3.23E-02	1.68E-02	-4.45E-02	-4.34E-02	-4.66E-02	-5.47E-02...
    -5.47E-02	-5.99E-02	-6.98E-02	-9.09E-02	-1.22E-01	-2.36E-01...
    -2.89E-01	-3.27E-01	-3.70E-01	-4.38E-01	-5.26E-01	-5.85E-01...
    -6.70E-01	-1.05E+00	-1.14E+00];

p13unfixed = p13;

for i = 3:29
    if (p13(i) - p13(i-1)) > 0.03
        p13(i) = (p13(i-1) + p13(i+1))/2;
    end
end

p13(1) = 0.35; p13(2) = 0.25; p13(6) = 0.07;
p13unfixed(1) = 0.35;

lower = p13(1:17);
upper = p13(17:32);

figure(1)
plot(xOverc, p13unfixed, 'linewidth', 1)
hold on
plot(xOverc, p13, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('13 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 13
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('13 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_13 = (N_u - N_l)/c_bar;


%% AOA 14

p14 = [-9.63E-01	1.42E-01	1.86E-01	1.62E-01	1.29E-01...
    7.08E-03	5.64E-02	3.76E-02	1.85E-02	5.32E-02	-1.69E-02...
    -2.66E-02	1.70E-02	-4.13E-02	-4.32E-02	-4.84E-02	-6.02E-02...
    -6.34E-02	-6.66E-02	-7.31E-02	-8.79E-02	-1.15E-01	-2.31E-01...
    -2.86E-01	-3.28E-01	-3.72E-01	-4.44E-01	-5.39E-01	-6.04E-01...
    -7.04E-01	-1.14E+00	-1.20E+00];

p14unfixed = p14;

for i = 3:29
    if (p14(i) - p14(i-1)) > 0.03
        p14(i) = (p14(i-1) + p14(i+1))/2;
    end
end

p14(1) = 0.45; p14(2) = 0.4; p14(3) = 0.3; p14(6) = 0.08;
p14unfixed(1) = 0.45; p14unfixed(2) = 0.4;

lower = p14(1:17);
upper = p14(17:32);

figure(1)
plot(xOverc, p14unfixed, 'linewidth', 1)
hold on
plot(xOverc, p14, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('14 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 14
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('14 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4 %c/4
C_N_14 = (N_u - N_l)/c_bar;


%% AOA 15

p15 = [-1.12E+00	1.23E-01	1.87E-01	1.71E-01	1.40E-01...
    7.95E-03	6.75E-02	4.74E-02	2.64E-02	5.37E-02	-1.19E-02...
    -2.35E-02	1.75E-02	-4.24E-02	-4.71E-02	-5.64E-02	-0.07202387...
    -0.08122587	-0.08298969	-0.08683395	-0.09458447	-0.1116767	-0.2277575...
    -0.2890444	-0.3330593	-0.3824387	-0.458725	-0.5633645	-0.6363668...
    -0.7578778	-1.258541	-1.311262];

p15unfixed = p15;

for i = 3:29
    if (p15(i) - p15(i-1)) > 0.03
        p15(i) = (p15(i-1) + p15(i+1))/2;
    end
end

p15(1) = 0.5; p15(2) = 0.43; p15(3) = 0.35; p15(6) = 0.05;
p15unfixed(1) = 0.45; p15unfixed(2) = 0.4; p15(10) = 0;

lower = p15(1:17);
upper = p15(17:32);

figure(1)
plot(xOverc, p15unfixed, 'linewidth', 1)
hold on
plot(xOverc, p15, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('15 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 15
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('15 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4 %c/4
C_N_15 = (N_u - N_l)/c_bar;

%% AOA 16

p16 = [-1.07E+00	1.21E-01	1.84E-01	1.68E-01	1.37E-01...
    8.29E-03	6.59E-02	4.60E-02	2.48E-02	5.41E-02	-1.55E-02...
    -2.82E-02	1.79E-02	-5.28E-02	-6.19E-02	-7.95E-02	-1.07E-01...
    -1.23E-01	-1.42E-01	-1.53E-01	-1.65E-01	-1.80E-01	-1.87E-01...
    -2.02E-01	-2.32E-01	-2.80E-01	-3.59E-01	-4.65E-01	-5.39E-01...
    -6.50E-01	-1.12E+00	-1.15E+00];

p16unfixed = p16;

for i = 3:29
    if (p16(i) - p16(i-1)) > 0.03
        p16(i) = (p16(i-1) + p16(i+1))/2;
    end
end

p16(1) = 0.5; p16(2) = 0.43; p16(3) = 0.35; p16(6) = 0.05;
p16unfixed(1) = 0.45; p16unfixed(2) = 0.4; p16(10) = 0;

lower = p16(1:17);
upper = p16(17:32);

figure(1)
plot(xOverc, p16unfixed, 'linewidth', 1)
hold on
plot(xOverc, p16, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('16 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 16
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('16 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4 %c/4
C_N_16 = (N_u - N_l)/c_bar;


%% AOA 17

p17 = [-1.92E-01	1.86E-01	1.71E-01	1.26E-01	9.33E-02...
    4.46E-03	2.61E-02	1.08E-02	-8.00E-03	5.35E-02	-4.48E-02...
    -5.70E-02	1.84E-02	-8.59E-02	-9.93E-02	-1.22E-01	-1.54E-01...
    -1.99E-01	-2.13E-01	-2.24E-01	-2.29E-01	-2.32E-01	-2.12E-01...
    -2.05E-01	-2.03E-01	-1.99E-01	-1.97E-01	-1.97E-01	-1.92E-01...
    -1.97E-01	-1.95E-01	-1.93E-01];

p17unfixed = p17;

for i = 3:29
    if (p17(i) - p17(i-1)) > 0.03
        p17(i) = (p17(i-1) + p17(i+1))/2;
    end
end

p17(6) = 0.05;
p17(1) = 0.25;
p17unfixed(1) = 0.25;

lower = p17(1:17);
upper = p17(17:32);

figure(1)
plot(xOverc, p17unfixed, 'linewidth', 1)
hold on
plot(xOverc, p17, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('17 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 17
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('17 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_17 = (N_u - N_l)/c_bar;

%% AOA 18

p18 = [-1.90E-01    1.91E-01    1.74E-01    1.27E-01    9.26E-02...
    3.94E-03    2.26E-02    6.91E-03  -1.32E-02    5.27E-02    -5.20E-02...
    -6.48E-02    1.90E-02    -9.53E-02    -1.09E-01    -1.33E-01 -0.1647758...
    -0.2109623    -0.2264118    -0.2381296    -0.2443881    -0.2475352...
    -0.2258458    -0.2165322 -0.2131371    -0.2094517    -0.2082829...
    -0.2077451    -0.2034602    -0.2087493    -0.2060661    -0.203908];

p18unfixed = p18;

for i = 3:29
    if (p18(i) - p18(i-1)) > 0.03
        p18(i) = (p18(i-1) + p18(i+1))/2;
    end
end

p18(6) = 0.05;
p18(1) = 0.25;
p18unfixed(1) = 0.25;

lower = p18(1:17);
upper = p18(17:32);

figure(1)
plot(xOverc, p18unfixed, 'linewidth', 1)
hold on
plot(xOverc, p18, 'linewidth', 1)
scatter(xOverc(1:17), lower, 'filled')
scatter(xOverc(17:32), upper, 'filled')
legend('Uninterpolated', 'Interpolated', 'Lower', 'Upper')
xlabel('X/c (in)')
ylabel('Pressure (psi)')
title('18 Deg. AOA Pressure vs. X/c')
grid on
hold off

% Cp vs. x/c @ AoA = 18
q =3.64*10^1 * 1/144 % psi

Cp_lower = lower/q ;
Cp_upper = upper/q ;

figure(2)
plot(xOverc(1:17), Cp_lower, 'linewidth', 1)
hold on
plot(xOverc(17:32), Cp_upper, 'linewidth', 1)
legend( 'Cp_lower', 'Cp_upper')
xlabel('X/c (in)')
ylabel('C_p')
title('18 Deg. AOA C_p vs. X/c')
grid on
hold off

% For Cp_lower
N_l = trapz(xOverc(1:17), Cp_lower);

% For Cp_upper
N_u= trapz(xOverc(17:32), Cp_upper);

% Solve for C_N
c_bar = 8/4; %c/4
C_N_18 = (N_u - N_l)/c_bar;

%% C_L plots

C_N = [C_N_neg4 C_N_0 C_N_4 C_N_8 C_N_10 C_N_12 C_N_13 C_N_14 C_N_15 C_N_16 C_N_17 C_N_18]

AoA = [ -4 0 4 8 10 12 13 14 15 16 17 18]

%Initialze a 1x12 Matrix for C_l
C_l = zeros(1,12)

for i = 1:12
    C_l(i) = C_N(i)*cosd(AoA(i));
end

figure(1)
hold on
plot(AoA, C_l, 'linewidth', 1)
legend()
xlabel('AoA (deg)')
ylabel('C_l')
title('Coefficient of Lift (C_L) vs. AoA(alpha)')
grid on
hold off
