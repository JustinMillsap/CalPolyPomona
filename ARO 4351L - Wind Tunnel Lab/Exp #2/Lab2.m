clc; clear;

%% Cp vs. X/C at AOA = -1

pressureDatapsi = [1.44E-01	-3.37E-01	-3.47E-01	-3.14E-01	-2.87E-01	-2.26E-02	-2.61E-01	-2.31E-01	-2.15E-01	4.85E-02	-1.79E-01	-1.48E-01	6.48E-03	-1.14E-01	-8.79E-02	-6.02E-02	-4.68E-02	-2.16E-02	-6.44E-02	-7.54E-02	-8.11E-02	-9.39E-02	-1.18E-01	-1.20E-01	-1.23E-01	-1.20E-01	-1.19E-01	-1.03E-01	-8.46E-02	-6.12E-02	-1.86E-02	3.73E-02
];

pressureDatapsf = pressureDatapsi * 144;

dynamicPressure = 1.07E+01;

coefficientsPressure = pressureDatapsf / dynamicPressure;

AoA = [-4 0 4 5 6 8 9 10 11 12 13 14 15 16 17 18]

xOverc = [0, 0.0125, 0.025, 0.05, 0.075, 0.1, 0.15, 0.2, 0.25, 0.3,... 
          0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1.0000, .9500, 0.9000,... 
          0.8000, 0.7000, 0.4000, 0.3000, 0.2500, 0.2000, 0.1500, 0.1000,...
          0.0750, 0.0500, 0.0250, 0.0125];

c_bar = 8
for i = 1:16
    coefficientsPressure(i) = coefficientsPressure(i) * -1;
end

for i = 3:29
    if abs(coefficientsPressure(i) - coefficientsPressure(i-1)) > 1
        coefficientsPressure(i) = (coefficientsPressure(i-1) + coefficientsPressure(i+1))/2;
    end
end

C_p_l=coefficientsPressure(1:17)
C_p_u=coefficientsPressure(17:32)

% Set good values for C_p_u & C_p_l

C_p_l(1) = 4.7353
C_p_l(2) = 4.6353
C_p_u(16) = -1.61
C_p_u(15) = -1.61
C_p_u(14) = -1.60
C_p_u(13) = -1.53
C_p_u(12) = -1.49
% plot a line to seperate the uppe and lower curve
 x = [0 0.95]
 y = [0.295738 0.295738]

figure(1)

hold on
grid on
plot(xOverc(1:17), C_p_l,'DisplayName', 'C_p Lower Surface')
plot(xOverc(17:32), C_p_u,'DisplayName', 'C_p Upper Surface')
plot(x,y)

xlabel('x/c')
ylabel('C_p')
title('x/c vs. C_p')
legend('show')


hold off
%%
% Assuming xOverc and C_p_l are already defined as above

% Calculate the area under the curve for the lower surface
xOverc_lower = xOverc(1:17); % Matching x-values for C_p_l
N_l = trapz(xOverc_lower, C_p_l); % Area under the curve for the lower surface

% Similarly, for the upper surface, ensure you have the correct matching x-values
xOverc_upper = xOverc(17:32); % Adjust indices as needed
N_u = trapz(xOverc_upper, C_p_u); % Area under the curve for the upper surface

% Display the results
disp(['Area under the curve for the lower surface: ', num2str(N_l)]);
disp(['Area under the curve for the upper surface: ', num2str(N_u)]);

C_p_l=coefficientsPressure(1:16)

C_N = (C_p_l - C_p_u)/c_bar

for i = 1:16
C_L(i) = C_N(i)*cosd(AoA(i))
end

plot(AoA,C_L)


-1.90E-01	1.91E-01	1.74E-01	1.27E-01	9.26E-02	3.94E-03	2.26E-02	6.91E-03 ...
    -1.32E-02	5.27E-02	-5.20E-02	-6.48E-02	1.90E-02	-9.53E-02	-1.09E-01	-1.33E-01 ...
    -0.1647758	-0.2109623	-0.2264118	-0.2381296	-0.2443881	-0.2475352	-0.2258458	-0.2165322 ...
    -0.2131371	-0.2094517	-0.2082829	-0.2077451	-0.2034602	-0.2087493	-0.2060661	-0.203908




