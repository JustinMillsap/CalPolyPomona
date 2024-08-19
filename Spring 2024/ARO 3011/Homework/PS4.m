%%%%%%                4.1.4            %%%%%%%%%%%%

% Define the range of y values
y = linspace(-10, 10, 20); % Adjust the range and number of points as needed

% Calculate the corresponding x values using the given function
x = (y.^2) / 2 + y;

% Plot the function
plot(x, y, 'b', 'LineWidth', 2); % 'b' for blue line, adjust line properties as needed
hold on; % To overlay arrows on the same plot

% Create vectors for arrow directions
dy = diff(y); % Change in y
dx = diff(x); % Change in x

% Add arrows using the quiver function
quiver(x(1:end-1), y(1:end-1), dx, dy, 0.5, 'r', 'MaxHeadSize', 0.5);

% Draw lines along the x and y axes
ax = gca; % Get the current axes
ax.XAxisLocation = 'origin'; % Place x-axis at the origin
ax.YAxisLocation = 'origin'; % Place y-axis at the origin
ax.XAxis.Color = 'k'; % Black color for x-axis
ax.YAxis.Color = 'k'; % Black color for y-axis

% Add labels and a title
figure 1
xlabel('y');
ylabel('x');
title('Plot of x = (y^2)/2 + y');

% Optionally, add a grid
grid off;

% Display the plot


%%  4.2.24   %%%%%%

%Givens
u = symunit;
V_0 = 40 * u.m / u.s ;
theta = 40;
r = 40;
V = (3/2)*(V_0)*sin(theta)
a = 0.20 * u.m
S = a*theta


%Normal Acceleration
a_n = (V^2 / r);
vpa(a_n)

%% 4.4.11%%%

%Givens


syms rho
syms b
syms V


y = v^2






