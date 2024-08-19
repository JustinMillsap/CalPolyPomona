clear; close all; clc 
%Station 1 or inf is the free stream
%station 2 is right behind the shock 
%Station c is at the surface of the cone
%subscript o is stagnation values

% Given
M1 = 6; %mach number
thetai(1) = deg2rad(12); %degrees
gamma = 1.4; %gamma
h = deg2rad(-0.1); %delta theta


Mn1 = M1*sin(thetai); %normal mach number 
thetaD = atan( 2*cot(thetai)*((M1^2*sin(thetai)^2-1) / (M1^2*(gamma+cos(2*thetai))+ 2) ) ); %deflection angle
thetaDdegree = rad2deg(thetaD);
Mn2 = sqrt( (Mn1^2+(2/(gamma-1))) / ((2*gamma/(gamma-1))*Mn1^2 - 1));
M2 = Mn2/(sin(thetai-thetaD)); 
V_inf = (2/((gamma-1)*M1^2)+1)^(-0.5); %free stream velocity 

% Runge Kutta method initial conditions
Vr(1) = V_inf*cos(thetai); 
Vt(1) = -V_inf * sin(thetai) * (((gamma-1)*M1^2*(sin(thetai))^2 + 2)) / ((gamma+1) * M1^2 * (sin(thetai))^2);

V_r(1) = Vr(1);
V_theta(1) = Vt(1);
f1 = @(thetai,Vr,Vt) Vt; 
f2 = @(thetai,Vr,Vt) (Vt^2*Vr - (gamma-1)/2*(1-Vr^2-Vt^2)*(2*Vr+Vt*cot(thetai))) / ((gamma-1)/2*(1-Vr^2-Vt^2)-Vt^2);


i = 1;
while Vt <= 0

    thetai(i+1) = thetai(i) + h;

    k11 = h*f1(thetai(i),Vr(i),Vt(i));
    k12 = h*f2(thetai(i),Vr(i),Vt(i));

    k21 = h*f1(thetai(i) + h/2, Vr(i)+ k11/2, Vt(i) + k12/2);
    k22 = h*f2(thetai(i) + h/2, Vr(i)+ k11/2, Vt(i) + k12/2);

    k31 = h*f1(thetai(i) + h/2, Vr(i)+ k21/2, Vt(i) + k22/2);
    k32 = h*f2(thetai(i) + h/2, Vr(i)+ k21/2, Vt(i) + k22/2);

    k41 = h*f1(thetai(i) + h, Vr(i)+ k31, Vt(i) + k32);
    k42 = h*f2(thetai(i) + h, Vr(i)+ k31, Vt(i) + k32);

    Vr(i+1) = Vr(i) + (k11 + 2*k21 + 2*k31 + k41)/6;
    Vt(i+1) = Vt(i) + (k12 + 2*k22 + 2*k32 + k42)/6;

    V(i) = sqrt(Vr(i)^2 + Vt(i)^2);

    %Mach number derived from equation 10.16 in book
    M(i) = sqrt(2/ ((V(i)^-2 - 1)*(gamma-1)) );

    i = i + 1;

    %equations 3.28 3.30 and 3.31

end
thetai_deg=rad2deg(thetai);
%Calculating the V and the M for the surface of the Cone (theta_C)
V(i) = sqrt(Vr(i)^2 + Vt(i)^2);
M(i) = sqrt(2/ ((V(i)^-2 - 1)*(gamma-1)) );

theta = [20:-1:12.1, 12.1:-0.1:12, thetai_deg];

M_in(1,1:10) = 6;
M = [M_in,M]; % combined Mach numbers 
%% Part 2

%Upstream parameters 
rho21 = ((gamma+1)*Mn1^2)/ ((gamma-1)*Mn1^2+2);     %eq 4.8 from Anderson book
P21 = 1 + 2*gamma/(gamma+1)*(Mn1^2-1);              %eq 4.9 from Anderson book
T21 = P21/rho21;                                    %eq 4.11 from Anderson book

%equations 3.28, 3.30, 3.31
rhoo22 = (1+(gamma-1)/2*M2^2)^(1/(gamma-1));    %eq 3.31 from Anderson book
Po22 = (1+(gamma-1)/2*M2^2)^(gamma/(gamma-1));  %eq 3.30 from Anderson book
To22 = 1+(gamma-1)/2*M2^2;                      %eq 3.28 from Anderson book


%same equations as above
rhooii = (1+(gamma-1)/2.*M.^2).^(1/(gamma-1));
Poii = (1+(gamma-1)/2.*M.^2).^(gamma/(gamma-1));
Toii = 1+(gamma-1)/2.*M.^2;

%since the flow is isentropic the stagnation values for i and 2 would be the same
rhoi1 = rhoo22./rhooii.*rho21;
Pi1 = Po22./Poii.*P21;
Ti1 = To22./Toii.*T21;


%since theta 20-12 are in free stream the ratios would be 1
rhoi1(1:10) = 1;
Pi1(1:10) = 1;
Ti1(1:10) = 1;

thetacalc = deg2rad(theta);
Vrinf = V_inf.*cos(thetacalc);
Vtinf = -V_inf.*sin(thetacalc(1:10));

%Combining all the values into 1 matrix for each 
Vr = Vrinf;
Vt = [Vtinf, Vt];
theta_c = theta(end);
theta_s = theta(10);


% the following sections are to plot the data 
figure(1)
hold on
plot(theta,Vt,'LineWidth',1.25)
plot([theta_s,theta_s],[-10,10],'--','LineWidth',1.25,'Color','black')
plot([theta_c,theta_c],[-10,10],':','LineWidth',1.25,'Color','black')
legend('Vt/Vmax', '\theta_s','\theta_c')
set (gca, 'xdir', 'reverse')
title('Vt/Vmax vs \theta')
xlabel('\theta (degrees)')
ylabel('Vt/Vmax')
xlim([7 20])
ylim([-0.5 0.1])
grid on
hold off

figure(2)
hold on
plot(theta, Pi1,'LineWidth',1.25)
plot(theta,Ti1,'LineWidth',1.25)
plot(theta, rhoi1,'LineWidth',1.25)
plot([theta_s,theta_s],[-10,10],'--','LineWidth',1.25,'Color','black')
plot([theta_c,theta_c],[-10,10],':','LineWidth',1.25,'Color','black')
set (gca, 'xdir', 'reverse')
title('P/P1 & T/T1 & \rho/\rho_1 vs \theta')
xlabel('\theta (degrees)')
ylabel('P/P1 & T/T1 & \rho/\rho_1')
legend('P/P1', 'T/T1', '\rho/\rho_1','\theta_s','\theta_c')
ylim([0 3])
xlim([7 20])
grid on
hold off



figure(3)
hold on
plot(theta,M,'LineWidth',1.25)
plot([theta_s,theta_s],[-10,10],'--','LineWidth',1.25,'Color','black')
plot([theta_c,theta_c],[-10,10],':','LineWidth',1.25,'Color','black')
legend('Mach', '\theta_s','\theta_c')
set (gca, 'xdir', 'reverse')
title('Mach vs \theta')
xlabel('\theta (degrees)')
ylabel('Mach Number')
xlim([7 20])
ylim([4.8 6.2])
grid on
hold off



