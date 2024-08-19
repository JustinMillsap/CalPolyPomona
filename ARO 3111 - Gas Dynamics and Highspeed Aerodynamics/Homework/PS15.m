clear;clc;close all

gamma = 1.4;
M1 = [1,1.05,1.1,1.15,1.2,1.3,1.4,1.5];


for i = 1:length(M1)

deltaSoverR(i) = ((2*gamma) / (3*(gamma+1)^2))*(M1(i)^2 - 1)^3;

end

figure(1);
hold on
plot(M1 , deltaSoverR , 'mo-')
grid on
title("(s_2 - s_1)/R vs. M_1")
xlabel('M_1')
ylabel('(s_2 - s_1) / R');

hold off

% Creating a table
T = table(deltaSoverR', M1', 'VariableNames', {'(s_2 - s_1)/R', 'M_1'});

% Display the table
disp(T);

% If you want to plot or visualize the table with a title, you can use uifigure and uitable (in newer MATLAB versions)
fig = uifigure('Name', 'Table Display');
uit = uitable(fig, 'Data', T, 'Position', [20 20 260 100]);

% Set title in a figure window
title = uilabel(fig, 'Text', 'Table of (s_2 - s_1)/R and M_1', 'Position', [20 120 260 30], 'HorizontalAlignment', 'center');


