function [u1,u2] = RungeKuttaAT(V_r_prime, V_theta_prime,theta_s , theta_c , gamma)
h = -0.1;                                                                   % Set the step size
A = (gamma-1)/2;
u1 = zeros(1,length(theta_s));                                                    % u1 = Vr
u2 = zeros(1,length(theta_s));                                                    % u2 = dVr/dVtheta
% Initial conditions
    u1(1) = V_r_prime;
    u2(1) = V_theta_prime;

    
% Defining function
    F1 = @(t, u1, u2) u2;
    F2 = @(t, u1, u2, theta) (u1.*u2.^2 - A.*(1-u1.^2-u2.^2).*(2.*u1 + u2.*cotd(theta))) ...
                         / (A.*(1-u1^2-u2.^2) - u2.^2);

for i = 1:(length(theta_s)-1)
    current_theta = theta_s(i);  % Get the current angle
    
    % Now pass current_theta to F2 in each calculation
    k1 = h*F1(V_theta_prime, u1(i), u2(i));
    m1 = h*F2(V_theta_prime, u1(i), u2(i), current_theta);
    
    k2 = h*F1(V_theta_prime + 0.5*h, u1(i) + 0.5*h, u2(i) + 0.5*h*k1);
    m2 = h*F2(V_theta_prime + 0.5*h, u1(i) + 0.5*h, u2(i) + 0.5*h*m1, current_theta);
    
    k3 = h*F1(V_theta_prime + 0.5*h, u1(i) + 0.5*h*k2, u2(i) + 0.5*h*m2);
    m3 = h*F2(V_theta_prime + 0.5*h, u1(i) + 0.5*h*k2, u2(i) + 0.5*h*m2, current_theta);
    
    k4 = h*F1(V_theta_prime + h, u1(i) + h*k3, u2(i) + h*m3);
    m4 = h*F2(V_theta_prime + h, u1(i) + h*k3, u2(i) + h*m3, current_theta);
    
    u1(i+1) = u1(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
    u2(i+1) = u2(i) + (1/6)*(m1 + 2*m2 + 2*m3 + m4)*h;



 

end
end

