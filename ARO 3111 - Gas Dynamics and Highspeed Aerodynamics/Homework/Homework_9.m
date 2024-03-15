C_D = [0.24 .23 0.21 0.201 0.19 0.17 0.16 0.15 0.147 0.145]';
M_inf = [1.5 1.6 1.8 2 2.4 3 4 5 6 7]' ;

figure(1)
hold on
plot(M_inf, C_D, 'LineWidth', 2, 'Marker', 'o', 'Color', [0 0.4470 0.7410]) % Example: blue line with circle markers
grid on
title('M_{\infty} vs C_D', 'FontSize', 14)
xlabel('M_{\infty}', 'FontSize', 12)
ylabel('C_D', 'FontSize', 12)
set(gca, 'FontSize', 10) % Sets the font size of the axes labels and ticks
set(gcf, 'Color', [1 1 1]) % Sets the figure background to white
legend('C_D vs. M_{\infty}', 'Location', 'best') % Adjust legend text and location as necessary
hold off
