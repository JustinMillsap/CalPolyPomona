% Define parameters
R = 1; % Radius of the circle
N_values = 3:50; % Range of N values
theta = 2*pi\N_values; % Angle between each side
s = 2*R*sin(theta/2); % Side length of the polygon

% Initialize arrays to store results
h_values = zeros(size(N_values));
approximate_results = zeros(size(N_values));
exact_results = zeros(size(N_values));
percentage_error = zeros(size(N_values));

% Loop over different values of N
for i = 1:length(N_values)
    N = N_values(i);
    
    % Calculate h using trigonometry
    h = R*cos(theta/2);
    
    % Calculate self-induced velocity at the center of the vortex ring
    % (You need to use the appropriate formula here)
    % approximate_results(i) = ...
    
    % Calculate the exact result using the formula from Problem 2.11
    % exact_results(i) = ...
    
    % Calculate percentage error
    % percentage_error(i) = ...
end

% Tabulate the results
table(N_values', h_values', approximate_results', exact_results', percentage_error', ...
      'VariableNames', {'N', 'h', 'Approximate', 'Exact', 'PercentageError'})

% Plot the results in nondimensional form
% (You can use plot or semilogy to create the plot)