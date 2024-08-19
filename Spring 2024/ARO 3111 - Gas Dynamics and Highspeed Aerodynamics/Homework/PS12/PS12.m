gamma = 1.4
B = gamma/(gamma-1)
C = (gamma-1)/2
options = optimset('Display', 'off');  % Define solver options for fzero
% Define the range for C_p values
C_p_values = linspace(-1, -0.1, 100);
% Define the function to compute C_p_cr for a given M_cr
C_p_cr = @(M_cr, C_p) (2/(gamma*M_cr^2)) * (((1 + C*M_cr^2) / (1 + C))^B - 1) - C_p;
% Find M_cr for each C_p value
M_cr_solutions = zeros(size(C_p_values));
for i = 1:length(C_p_values)
    C_p = C_p_values(i);
    M_cr_solutions(i) = fzero(@(M_cr) C_p_cr(M_cr, C_p), 0.5, options);
end
M_cr_solutions = real(M_cr_solutions);
% % % Prandlt-Glauerts rule 
Cpo = -0.3
Prandlt_Glauerts = @(M_PG , C_p) ( Cpo / sqrt(1-M_PG^2) - C_p )
M_PG_solutions = zeros(size(C_p_values));
for i = 1:length(C_p_values)
    C_p = C_p_values(i);
    M_PG_solutions(i) = fzero(@(M_PG) Prandlt_Glauerts(M_PG, C_p), 0.5, options);
end
M_PG_solutions = real(M_PG_solutions);
% % % Karman-Tsien Rule
Karman_Tsien = @(M_KT , C_p) ((Cpo)/(sqrt(1-M_KT^2) + (0.5*Cpo*M_KT^2)*(1/(1 + sqrt(1 - M_KT^2)))) - C_p);                   % Equation 9.40
M_KT_solutions = zeros(size(C_p_values));
for i = 1:length(C_p_values)
    C_p = C_p_values(i);
    M_KT_solutions(i) = fzero(@(M_KT) Karman_Tsien(M_KT, C_p), 0.5, options);
end
M_KT_solutions = real(M_KT_solutions);
figure(1);
hold on;
plot(M_cr_solutions, C_p_values, 'b', 'DisplayName', 'Critical Mach');
plot(M_PG_solutions, C_p_values, 'g', 'DisplayName', 'Prandtl-Glauert');
plot(M_KT_solutions, C_p_values, 'r', 'DisplayName', 'Karman-Tsien');
threshold = 0.01;
[~, idx_PG] = min(abs(M_cr_solutions - M_PG_solutions));
[~, idx_KT] = min(abs(M_cr_solutions - M_KT_solutions));
if abs(M_cr_solutions(idx_PG) - M_PG_solutions(idx_PG)) < threshold
    M_PG_intersect = M_PG_solutions(idx_PG);
    xline(M_PG_intersect, '--g', 'Prandtl-Glauert Intersect');
    ypos = -0.2; xoffset = 0.02;
    text(M_PG_intersect + xoffset, ypos, sprintf('M_{PG} = %.2f', M_PG_intersect), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'BackgroundColor', 'white');
end
if abs(M_cr_solutions(idx_KT) - M_KT_solutions(idx_KT)) < threshold
    M_KT_intersect = M_KT_solutions(idx_KT);
    xline(M_KT_intersect, '--r', 'Karman-Tsien Intersect');
    ypos = -0.3; xoffset = -0.02;
    text(M_KT_intersect + xoffset, ypos, sprintf('M_{KT} = %.2f', M_KT_intersect), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'BackgroundColor', 'white');
end
xlabel('M');
ylabel('C_{p}');
title('C_p vs M');
set(gca, 'YDir', 'reverse');
grid on;
legend('Critical Mach', 'Prandlt-Glauert', 'Karman-Tsien', 'Prandlt-Glauert Intersection', 'Karman-Tsien Intersection', 'northwest');
hold off;
