% Problem 1 from Example Exam

% Givens

P_s = 500;                                                                  % psia
T_s = 810.93;                                                               % Kelvin
gamma = 1.3 ;               
MW = 18.02 ;                                                                % kg/k-mol
Ru = 8.314 ;                                                                %kJ/k-mol*Kevlin
V1 = 2590 ;                                                                 % ft/s *Stationary Shock *


% a) Calulculate V2 & M1

% Sol to M1 
R = 1000*Ru/MW;                                                             % R = R_universal / molecular weight [ J/kgK]
a = sqrt(gamma*R*T_s) * 3.28084;                                            % ft/s

M1 = V1/a

% 

