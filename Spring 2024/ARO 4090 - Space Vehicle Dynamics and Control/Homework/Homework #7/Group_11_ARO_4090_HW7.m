% ARO - 4090 Homework 7: Space Vehicle Dynamics & Control
% Written By: Harout Boyajian , Justin Millsap , Matthew Portugal , Andre Turpin
% Date: 04/09/2024 
% Tool Version: R2023b
% other .m files required: NONE
% Other files required:  Group_11_ARO_4090_Simulink_Model_HW7.slx


syms 

rho = 1000

% Case 1 {meters}
% a = 0.01 ; e = a ; b = 0.03 ; c = 0.005 ; d = 0.06;

% Case 2 {meters}
I_bc a = 0.01 ; e = a ; b = 0.05 ; c = 0.005 ; d = 0.06;


% syms a b c d e rho

num = (b*c)*(a+b);
den = 2*(a*d + b*c);
R_x = [ 0 , -(a/2) - num/den , 0 ; (a/2) + num/den , 0  , 0 ; 0 , 0 , 0];

% Initialize I_B_o as a symbolic matrix
I_B_o = sym(zeros(3, 3)); 
I_B_o(1,1) = (rho/12)*(a*d*e*(4*a^2 + d^2) + b*c*e*(4*b^2 +c^2 + 12*a^2 + 12*a*b));
I_B_o(2,2) = (rho/12)*(a*d*e*(4*a^2 + e^2) + b*c*e*(4*b^2 +e^2 + 12*a^2 + 12*a*b));
I_B_o(3,3) = (rho/12)*(a*e*d*(e^2 + d^2) + b*c*e*(e^2 + c^2));

% Symbolic matrix multiplication
R_x_sq = R_x * R_x;
mass = rho*(a*d*e + b*c*e)                                                  % mass = rho*V 



I_bc = vpa(I_B_o + mass.*R_x_sq)                                    % vpa returns in decimal form


%% Plots for part D

%{ Comment out Case 1 or Case 2 to get corresponding Plots
%}


t = simout.Time;           
data = simout.Data;        

y_labels = {
    'p [deg/s]', 'q [deg/s]', 'r [deg/s]', 'β_0', ...
    'β_1', 'β_2', 'β_3', 'ψ [deg]', 'θ [deg]', ...
    'Φ [deg]', '||w|| [deg/s]' '||H|| [kg m^2 /s]'
};


rows = 4;
cols = 4;


for i = 1:length(y_labels)
    
    col = ceil(i / rows);
    row = i - (col-1) * rows;
  
    subplotIndex = (row - 1) * cols + col;
    
    subplot(rows, cols, subplotIndex);
    plot(t, data(:, i)); 
    xlabel('t [s]');
    ylabel(y_labels{i});
    grid on
end



