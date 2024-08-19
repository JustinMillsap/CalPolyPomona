%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Justin Millsap | ARO 3090 | Dr. Nak      %
% Aerospace Engineering Department                   %
% California Polytechnic State University, Pomona    %
% Orbital Mechanics - ARO 3090, Fall 23          %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;
close all

%%%%%%%%%%%%%%%%%%%%%%  EDITABLE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Animation on/off
animation = 'on';
% Eccentricity
e = 0.7;
% Gravitational Parameter (Earth)
mu = 398600;
% Number of Revolutions
N_rev = 1;


%%%%%%%%%%%%%%%%%%%%  DO NOT EDIT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Period
T = 2*pi/sqrt(mu);
% Angular Momentum
h = sqrt(mu*(1-e^2));
% Periapsis Radius and Speed
rp=1-e;
vp=h/rp;
% Integration Time
N=1000;
t0=0;
tf=N_rev*T;
dt=(tf-t0)/N;
tspan=t0:dt:tf;

% Initial Conditions
r0=[rp,0];
v0=[0,vp];

% ODE Integration
Options_ODE = odeset('RelTol',1E-7','AbsTol',1E-9');
[t,X]=ode45(@(t,X)func_ODE(t,X,mu),tspan,[r0,v0],Options_ODE);

% Mean Motion (n) and Anomaly (Me)
n = 2*pi/T;
Me = n*t;

Options_E = optimoptions('fsolve','Display','none','TolFun',1E-12,'TolX',1E-12);
for j=1:N+1  
    % Eccentric Anomaly
    E(j) = fsolve(@(E)func_E(E,e,Me(j)),Me(j),Options_E);
    xE(j) = cos(E(j))-e;
    yE(j) = sin(E(j));
    % True Anomaly
    theta(j) = mod(2*atan(sqrt((1+e)/(1-e))*tan(E(j)/2)),2*pi);
    % Real Radius
    rR(j) = h^2/mu/(1+e*cos(theta(j)));
    xR(j) = rR(j)*cos(theta(j));
    yR(j) = rR(j)*sin(theta(j));
    % Fictitious Coords
    xF(j) = cos(Me(j))-e;
    yF(j) = sin(Me(j));
end

% Plots
color_M  = [0,0,0.8];
color_mR = [1,0.75,0];
color_mE = [0.7,0.7,0.7];
color_mF = [0.9,0,1];

figure(1),hold on,grid on
set(gcf,'units','normalized','position',[0 0 0.8 0.9])
subplot(3,4,[1:3,5:7,9:11]),hold on,grid on
str1 = sprintf('e = %.2f',e);
title(str1)
plot(xE,yE,'linewidth',1,'color','k','linestyle','--')
plot(xR,yR,'linewidth',1,'color','k','linestyle','-')
plot(0,0,'markersize',40,'marker','o','markerfacecolor',color_M,'markeredgecolor','k')
plot(-e,0,'k+')
plot(0,0,'k+')
axis('equal')
xlim([-1-e,1-e])
ylim([-1,1])
xlabel('x/a')
ylabel('y/a')

subplot(3,4,[4,8,12]),hold on,grid on
p1=plot(t/T,rad2deg(Me),   'linewidth',1.0,'linestyle','-.','color','k');
p2=plot(t/T,rad2deg(E),    'linewidth',1.0,'linestyle','--','color','k');
p3=plot(t/T,rad2deg(theta),'linewidth',1.0,'linestyle','-','color','k');
xlim([0,1])
ylim([0,360])
xlabel('t/T')
ylabel('Anomalies [deg]')

if strcmp(animation,'on') 
    for i=1:N+1
        subplot(3,4,[1:3,5:7,9:11]),hold on,grid on
             
        if Me(i)<pi
            l2=plot(xE(1:i),yE(1:i),'linewidth',2,'color',color_mE);
            l1=plot(xF(1:i),yF(1:i),'linewidth',2,'color',color_mF);
        else
            l1=plot(xF(1:i),yF(1:i),'linewidth',2,'color',color_mF); 
            l2=plot(xE(1:i),yE(1:i),'linewidth',2,'color',color_mE);        
        end
        l3=plot(xR(1:i),yR(1:i),'linewidth',2,'color',color_mR);
        l4 = plot(xF(i),yF(i),'markersize',10,'marker','o','markerfacecolor',color_mF,'markeredgecolor','k');
        l5 = plot(xE(i),yE(i),'markersize',10,'marker','o','markerfacecolor',color_mE,'markeredgecolor','k');
        l6 = plot(xR(i),yR(i),'markersize',10,'marker','o','markerfacecolor',color_mR,'markeredgecolor','k');
        l7 = line([-e,xF(i)],[0,yF(i)],'linewidth',1.0,'linestyle','-','color',color_mF);
        l8 = line([-e,xE(i)],[0,yE(i)],'linewidth',1.0,'linestyle','-','color',color_mE);
        l9 = line([ 0,xR(i)],[0,yR(i)],'linewidth',1.0,'linestyle','-','color',color_mR);
        l10 = line([xR(i),xE(i)],[yR(i),yE(i)],'linewidth',1.0,'linestyle','--','color','k');
                        
        subplot(3,4,[4,8,12]),hold on,grid on
        l11 = plot(t(1:i)/T,rad2deg(Me(1:i))   ,'linewidth',2,'color',color_mF);
        l12 = plot(t(1:i)/T,rad2deg(E(1:i))    ,'linewidth',2,'color',color_mE);
        l13 = plot(t(1:i)/T,rad2deg(theta(1:i)),'linewidth',2,'color',color_mR);
        
        l14 = plot(t(i)/T,rad2deg(Me(i))   ,'markersize',10,'marker','o','markerfacecolor',color_mF,'markeredgecolor','k');
        l15 = plot(t(i)/T,rad2deg(E(i))    ,'markersize',10,'marker','o','markerfacecolor',color_mE,'markeredgecolor','k');
        l16 = plot(t(i)/T,rad2deg(theta(i)),'markersize',10,'marker','o','markerfacecolor',color_mR,'markeredgecolor','k');
        
        pause(.5/N)
        if i<N+1
            delete(l1);delete(l2);delete(l3);
            delete(l4);delete(l5);delete(l6);
            delete(l7);delete(l8);delete(l9);
            delete(l10);delete(l11);delete(l12);
            delete(l13);delete(l14);delete(l15);
            delete(l16);
        end
    end
end

subplot(3,4,[4,8,12]),hold on,grid on
plot(t(end)/T,rad2deg(Me(end))   ,'markersize',10,'marker','o','markerfacecolor',color_mF,'markeredgecolor','k');
plot(t(end)/T,rad2deg(E(end))    ,'markersize',10,'marker','o','markerfacecolor',color_mE,'markeredgecolor','k');
plot(t(end)/T,rad2deg(theta(end)),'markersize',10,'marker','o','markerfacecolor',color_mR,'markeredgecolor','k');
        
l=legend([l11,l12,l13],'M_e','E','\theta');    
        
% Equations of Motion

function dX = func_ODE(~,X,mu)
    r = X(1:2,1);
    v = X(3:4,1);
    dX(1:2,1) = v;
    dX(3:4,1) = -mu/norm(r)^3*r;
end
% Kepler's Equation
function F = func_E(E,e,Me)
    F=Me-E+e*sin(E);
end


