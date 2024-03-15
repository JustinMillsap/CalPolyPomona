% Problem 5-99
clc; clear;
V = 110;     % [ Volts ]
Q_in = 300;  % [ kJ ]
m = 12;      % [kg ]
h2 = 314.53; % [ kJ/kg ]
h1 = 247.32; % [ kJ/kg ]
time = 6*60; % [ seconds ]

I = ( m*(h2 - h1) - Q_in )*1000 / (V*time) % [ A ]

fprintf('The current supplied if the final temperature is at 70 degrees C is %.4f ', I)
