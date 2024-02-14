%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                %
%                                                                %
% Justin Millsap | ARO 3011 | Computer Assignment | Dr. Tony Lin %
%                                                                %
%                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A) Develop a computer program that uses numerical lifting-line theory to calculate the following aerodynamic characteristics.
% 1) Total wing lift coefficient C_L
% 2) Total wing induced drag coefficient C_di
% 3) Spanwise lift distribution normalized with total wing lift coefficient C_l (y) / C_L
% 4) Spandwise distribution of bound circulation GAMMA(y)
% 5) Delta = (pi*A*C_Di)/(C_L)^2 - 1

% WHAT NEEDS TO BE FIXED %
    %   CD
    %   GAMMA(Y)
    

%% A.1) Rectangular Wing - Pilatus PC-6 Turbo Porter
clear;clc; clear all

%%%%%   INPUTS [ EDIT ] %%%%%

epsilon_t_deg = 0;                              % Twist [ deg ]
epsilon_t_rad = epsilon_t_deg*pi/180;            % Twist [ rad ]
C_L_alpha_rad = 2*pi*0.96;                    % Section lift curve slope [ 1 / rad ]
SemiSpanLength = 1;                          % b/2
b = SemiSpanLength*2;                        % Wing Span
AR = 8;                                       % Aspect Ratio
AOA_absolute_deg = 5;                        % Wing Absolute AOA (at center section) [ deg ]
AOA_absolute_rad = AOA_absolute_deg*pi/180;  % Wing Absolute AOA (at center section) [ rad ]



rho = 1;
V = 1; 
q = (1/2)*rho*V^2;                           % Dynamic Pressure
N = 128;                                      % Number of itterations

%%%%%% Equations [ DO NOT EDIT ]    %%%%%
% Total wing lift coefficient C_L

c = b/AR;                                   % Chord Length
S = b*c;                                    % Wing Area

i = 1:N;
j = 1:N;

%  Determining k_ij values
%  if i => j -----> k = 1
%  if i < j  -----> k =0

k = zeros(N,N);
k = k(i,j);
for i = 1:N;
    for j = 1:N;
        if i>= j;
            k(i,j) = 1;
        else i < j ;
            k(i,j) = 0;
        end
    end
end



% Cosine Spacing y_vi

for i = 1:N;
   m = 2*(N-1) + 1;
   deltaTheta = pi/m;
   y_v(i) = (b/2)*cos((1 - i + (1/2)*(m-1))*deltaTheta);
end

% Determining y_ci  Span Location of computation of downwash

 for i = 2:N;

y_c(1) = 0;
y_c(i) = (1/2)*(y_v(i) + y_v(i-1));

 end
y_c_128 = y_c

 %save('y_c_128.mat','y_c_128') 

% Determining AOA_j 
for j = 1:N
    for i = 1:N
       
AOA(i) = epsilon_t_rad*y_c(i) + AOA_absolute_rad;
    
    end
end


% Determining C_ij values
for i = 1:N;
    for j = 1:N;

C(i,j) = (1/(2*pi)) * (y_v(i)) / ( (y_v(i))^2 - (y_c(j))^2 );
    
    end
end

% Defining Chord Length "c"

for j = 1:N
  
    c(j) = b/AR ;

end

% Defining A

for i = 1:N
    for j = 1:N
        A(j,i) = (1/2)*(c(j))*(C_L_alpha_rad)*C(i,j) + k(i,j);
    end

end


% Defining B 

for j = 1:N
    B(j) = (1/2)*c(j)*(C_L_alpha_rad)*AOA(j);
end
B = B' ;
  
% Defining gamma_lower
gamma_lower = (A)^-1 * B;

% Define gamma_cap
gamma_cap = zeros(N, 1);  % Initialize gamma_cap as a column vector of zeros

for i = N:-1:1
    gamma_cap(i) = sum(gamma_lower(i:N));
end


% Defining w ( down - wash velocity )
w = zeros(N,1);
for j = 1:N
    for i = 1:N

        w(j) = w(j) + C(i,j)*gamma_lower(i);
        
    end
end


% Defining AOA_dw ( Down-wash Angle of Attack)
AOA_dw = zeros(N , 1);
for j = 1:N;
    for i = 1:N;
        AOA_dw(j) = w(j)/V;
    end
end


% Define delta_y

delta_y = zeros(N,1);

delta_y(1) = (y_v(1)+y_v(1));

for i = 2:N
        delta_y(i) =2*( y_v(i) - y_v(i-1));
end

% Calculate Lift Coefficient
for i = 1:N;
    L(i) = rho*V*(gamma_cap(i)*delta_y(i));
end

C_L = sum(L)/(q*S);

% Calculate lift coefficients C_Li

for j = 1:N;
  
    C_l(j) =  C_L_alpha_rad*(AOA(j) - AOA_dw(j));
    
end


% Determine C_d

% Spanwise lift distribution C_ly
C_ly = sum(C_l);

% Determine lift dirtrubion normalized with total wing lift coefficient
% C_L(y) / C_L

    
C_ly_CL_rect =  C_l/ C_L;
   


C_lyCl = C_ly/C_L;

% Determine Delta
%Delta = ( (pi*AR*C_D)/(C_L^2) ) - 1;


gamma_cap_y_rect = gamma_cap
% gamma_cap_y_rect_2 = gamma_cap_y_rect
% gamma_cap_y_rect_8 = gamma_cap_y_rect
% gamma_cap_y_rect_32 = gamma_cap_y_rect
% gamma_cap_y_rect_128 = gamma_cap_y_rect
% 
% 
% save('Gamma_cap_rect_N_128.mat','gamma_cap_y_rect_128')  
% 
% display("When considering a rectangular wing and using the numerical lifting line theory (NLLT), the found values are the following:")
% fprintf(" 1) The total wing lift coefficient is C_L = %.4f\n"  , C_L)
% fprintf(" 2) The total wing induced drag coefficient is C_D = %.4f\n"  , C_D)
% fprintf(" 3) The Spanwise distribution noramilzed with total wing lift coefficient is = %.4f\n"  , C_lyCl)
% fprintf(" 4) The Spanwise distribution of bound circulation is  = %.4f\n"  , gamma_cap_y)
% fprintf(" 5) Delta = %.4f\n"  , Delta)

% data1 = C_ly_CL(:,:); 
% data2 = y_c(:,:); 
% data3 = gamma_cap_y;
% 
% data1 = data1';
% data2 = data2';
% data3 = data3;
% 
% ComputerAssignmnet = 'output_multisheet10.xlsx'; 
% 
% xlswrite(ComputerAssignmnet, data1, 'Sheet1');
% xlswrite(ComputerAssignmnet, data2, 'Sheet2');
% xlswrite(ComputerAssignmnet, data3, 'gamma_cap_rect');
%% A.2) Tapered Wing - Pilatus PC-6 Turbo Porter


%%%%%   INPUTS [ EDIT ] %%%%%

epsilon_t_deg = 0;                              % Twist [ deg ]
epsilon_t_rad = epsilon_t_deg*pi/180;            % Twist [ rad ]
C_L_alpha_rad = 2*pi*0.96;                    % Section lift curve slope [ 1 / rad ]
SemiSpanLength = 1;                          % b/2
b = SemiSpanLength*2;                        % Wing Span
AR = 8;                                       % Aspect Ratio
AOA_absolute_deg = 5;                        % Wing Absolute AOA (at center section) [ deg ]
AOA_absolute_rad = AOA_absolute_deg*pi/180;  % Wing Absolute AOA (at center section) [ rad ]



rho = 1;
V = 1; 
q = (1/2)*rho*V^2;                           % Dynamic Pressure
                                      % Number of itterations
lambda = 0.3;

%%%%%% Equations [ DO NOT EDIT ]    %%%%%
% Total wing lift coefficient C_L

S = (b^2)/AR;


c_root = (2*S)/(b*(1+lambda));
c_tip = lambda*c_root;



i = 1:N;
j = 1:N;

%  Determining k_ij values
%  if i => j -----> k = 1
%  if i < j  -----> k =0

k = zeros(N,N);
k = k(i,j);
for i = 1:N;
    for j = 1:N;
        if i>= j;
            k(i,j) = 1;
        else i < j ;
            k(i,j) = 0;
        end
    end
end



% Cosine Spacing y_vi

for i = 1:N;
   m = 2*(N-1) + 1;
   deltaTheta = pi/m;
   y_v(i) = (b/2)*cos((1 - i + (1/2)*(m-1))*deltaTheta);
end

 

% Determining AOA_j 
for j = 1:N
    for i = 1:N
       
AOA(i) = epsilon_t_rad*y_c(i) + AOA_absolute_rad;
    
    end
end


% Determining C_ij values
for i = 1:N;
    for j = 1:N;

C(i,j) = (1/(2*pi)) * (y_v(i)) / ( (y_v(i))^2 - (y_c(j))^2 );
    
    end
end

% Define chord length for a Tapered Wing
c_tapered = zeros(N, 1);
for i = 1:N
    y = y_c(i);
    c_tapered(i) = c_root * (1 - (2 * y / b) * (1 - lambda));
end
% Defining A

for i = 1:N
    for j = 1:N
        A(j,i) = (1/2)*(c_tapered(j))*(C_L_alpha_rad)*C(i,j) + k(i,j);
    end

end


% Defining B 

for j = 1:N
    B(j) = (1/2)*c_tapered(j)*(C_L_alpha_rad)*AOA(j);
end
B = B' ;



% Defining gamma_lower
gamma_lower = A \ B(:);

% Define gamma_cap
gamma_cap = zeros(N, 1);  % Initialize gamma_cap as a column vector of zeros

for i = N:-1:1
    gamma_cap(i) = sum(gamma_lower(i:N));
end


% Defining w ( down - wash velocity )
w = zeros(N,1);
for j = 1:N
    for i = 1:N

        w(j) = w(j) + C(i,j)*gamma_lower(i);
        
    end
end


% Defining AOA_dw ( Down-wash Angle of Attack)
AOA_dw = zeros(N , 1);
for j = 1:N;
    for i = 1:N;
        AOA_dw(j) = w(j)/V;
    end
end


% Define delta_y

delta_y = zeros(N,1);

delta_y(1) = (y_v(1)+y_v(1));

for i = 2:N
        delta_y(i) =2*( y_v(i) - y_v(i-1));
end

% Calculate Lift Coefficient
for i = 1:N;
    L(i) = rho*V*(gamma_cap(i)*delta_y(i));
end

C_L = sum(L)/(q*S);

% Calculate lift coefficients C_Li

for j = 1:N;
  
    C_l(j) =  C_L_alpha_rad*(AOA(j) - AOA_dw(j));
    
end


% %Calculate Drag Coefficient CD_i   ( POSSIBLE METHOD 1 )
% 
% for j = 1:N
%     for i = 1:N
%     C_d(j) = C_L_alpha_rad*( AOA(j) - AOA_dw(j))*w(j);
%     end   
% end
% C_D = sum(C_d)

%Calculate Drag Coefficient CD_i   ( POSSIBLE METHOD 2)
C_D = (C_L^2)/(pi*AR)


% Spanwise lift distribution C_ly
C_ly = sum(C_l);

% Determine lift dirtrubion normalized with total wing lift coefficient
% C_L(y) / C_L

    
C_ly_CL_taper =  C_l/ C_L;
   


C_lyCl = C_ly/C_L;

% Determine Delta
Delta = ( (pi*AR*C_D)/(C_L^2) ) - 1;

% Determine gamma_cap_y
gamma_cap_y_taper = gamma_cap
% gamma_cap_y_taper_2 = gamma_cap_y_taper
% gamma_cap_y_taper_8 = gamma_cap_y_taper
% gamma_cap_y_taper_32 = gamma_cap_y_taper
% gamma_cap_y_taper_128 = gamma_cap_y_taper
% 
% save('Gamma_cap_taper_N_128.mat','gamma_cap_y_taper_128') 


% display("When considering a tapered wing and using the numerical lifting line theory (NLLT), the found values are the following:")
% fprintf(" 1) The total wing lift coefficient is C_L = %.4f\n"  , C_L)
% %fprintf(" 2) The total wing induced drag coefficient is C_D = %.4f\n"  , C_D)
% fprintf(" 3) The Spanwise distribution noramilzed with total wing lift coefficient is = %.4f\n"  , C_lyCl)
% %fprintf(" 4) The Spanwise distribution of bound circulation is  = %.4f\n"  , gamma_cap_y)
% %fprintf(" 5) Delta = %.4f\n"  , Delta)
% 
%  data1 = C_ly_CL(:,:); 
%  data2 = y_c(:,:); 
%  data3 = gamma_cap(:,:);
% % 
%  data1 = data1';
%  data2 = data2';
%  data3 = data3';
% % 
% % 
%  ComputerAssignmnet = 'output_multisheet10.xlsx'; 
% % 
% % 
%  xlswrite(ComputerAssignmnet, data1, ' C_ly_CL_taper');
%  xlswrite(ComputerAssignmnet, data2, 'y_c_taper');
%  xlswrite(ComputerAssignmnet, data3, 'gamma_cap_taper');


 
 
%% A.3) Elliptical Wing - Pilatus PC-6 Turbo Porter


%%%%%   INPUTS [ EDIT ] %%%%%

epsilon_t_deg = 0;                              % Twist [ deg ]
epsilon_t_rad = epsilon_t_deg*pi/180;            % Twist [ rad ]
C_L_alpha_rad = 2*pi*0.96;                    % Section lift curve slope [ 1 / rad ]
SemiSpanLength = 1;                          % b/2
b = SemiSpanLength*2;                        % Wing Span
AR = 8;                                       % Aspect Ratio
AOA_absolute_deg = 5;                        % Wing Absolute AOA (at center section) [ deg ]
AOA_absolute_rad = AOA_absolute_deg*pi/180;  % Wing Absolute AOA (at center section) [ rad ]



rho = 1;
V = 1; 
q = (1/2)*rho*V^2;                           % Dynamic Pressure
                                    % Number of itterations

%%%%%% Equations [ DO NOT EDIT ]    %%%%%
% Total wing lift coefficient C_L


S = (b^2)/AR;                                    % Wing Area

i = 1:N;
j = 1:N;

%  Determining k_ij values
%  if i => j -----> k = 1
%  if i < j  -----> k =0

k = zeros(N,N);
k = k(i,j);
for i = 1:N;
    for j = 1:N;
        if i>= j;
            k(i,j) = 1;
        else i < j ;
            k(i,j) = 0;
        end
    end
end



% Cosine Spacing y_vi

for i = 1:N;
   m = 2*(N-1) + 1;
   deltaTheta = pi/m;
   y_v(i) = (b/2)*cos((1 - i + (1/2)*(m-1))*deltaTheta);
end
% Determining y_ci  Span Location of computation of downwash

 i = 2:N;

y_c(1) = 0;
y_c(i) = (1/2)*(y_v(i) + y_v(i-1));

%Calculating chord length for an elliptical wing


for i = 1:N;
    y = y_c(i);
    c_elliptical(i) = (4*S/(pi*b)) * sqrt(1 - (2*y/b)^2);
end



% Determining AOA_j 
for j = 1:N
    for i = 1:N
       
AOA(i) = epsilon_t_rad*y_c(i) + AOA_absolute_rad;
    
    end
end




% Determining C_ij values
for i = 1:N;
    for j = 1:N;

C(i,j) = (1/(2*pi)) * (y_v(i)) / ( (y_v(i))^2 - (y_c(j))^2 );
    
    end
end



% Defining A

for i = 1:N
    for j = 1:N
        A(j,i) = (1/2)*(c_elliptical(j))*(C_L_alpha_rad)*C(i,j) + k(i,j);
    end

end


% Defining B 

for j = 1:N
    B(j) = (1/2)*c_elliptical(j)*(C_L_alpha_rad)*AOA(j);
end
B = B' ;

  

% Defining gamma_lower
gamma_lower = A \ B(:)

% Define gamma_cap
gamma_cap = zeros(N, 1);  % Initialize gamma_cap as a column vector of zeros

for i = N:-1:1
    gamma_cap(i) = sum(gamma_lower(i:N));
end


% Defining w ( down - wash velocity )
w = zeros(N,1);
for j = 1:N
    for i = 1:N

        w(j) = w(j) + C(i,j)*gamma_lower(i);
        
    end
end


% Defining AOA_dw ( Down-wash Angle of Attack)
AOA_dw = zeros(N , 1);
for j = 1:N;
    for i = 1:N;
        AOA_dw(j) = w(j)/V;
    end
end


% Define delta_y

delta_y = zeros(N,1);

delta_y(1) = (y_v(1)+y_v(1));

for i = 2:N
        delta_y(i) =2*( y_v(i) - y_v(i-1));
end

% Calculate Lift Coefficient
for i = 1:N;
    L(i) = rho*V*(gamma_cap(i)*delta_y(i));
end

C_L = sum(L)/(q*S);

% Calculate lift coefficients C_Li

for j = 1:N;
  
    C_l(j) =  C_L_alpha_rad*(AOA(j) - AOA_dw(j));
    
end


% Calculate Induced Drag C_Di = A[gamma_cap*y_v(1)*w_1 + sum{ Gamm_cap(i)(y)v1 - y_v(i-1)) w_i







% Spanwise lift distribution C_ly
C_ly = sum(C_l);

% Determine lift dirtrubion normalized with total wing lift coefficient
% C_L(y) / C_L

    
C_ly_CL_ellip =  C_l/ C_L;
   


C_lyCl = C_ly/C_L;

% Determine Delta
%Delta = ( (pi*AR*C_D)/(C_L^2) ) - 1;

% Determine gamma_cap_y

gamma_cap_y_ellip = gamma_cap;
% gamma_cap_y_ellip_2 = gamma_cap_y_ellip
% gamma_cap_y_ellip_8 = gamma_cap_y_ellip
% gamma_cap_y_ellip_32 = gamma_cap_y_ellip
% gamma_cap_y_ellip_128 = gamma_cap_y_ellip

% save('Gamma_cap_ellip_N_128.mat','gamma_cap_y_ellip_128') 
% display("When considering a rectangular wing and using the numerical lifting line theory (NLLT), the found values are the following:")
% fprintf(" 1) The total wing lift coefficient is C_L = %.4f\n"  , C_L)
% %fprintf(" 2) The total wing induced drag coefficient is C_D = %.4f\n"  , C_D)
% fprintf(" 3) The Spanwise distribution noramilzed with total wing lift coefficient is = %.4f\n"  , C_lyCl)
% %fprintf(" 4) The Spanwise distribution of bound circulation is  = %.4f\n"  , gamma_cap_y)
% %fprintf(" 5) Delta = %.4f\n"  , Delta)

%  data1 = C_ly_CL(:,:); 
% data2 = y_c(:,:); 
% data3 = gamma_cap_y(:,:);
% 
% data1 = data1';
% data2 = data2';
% data3 = data3';
% 
% 
% ComputerAssignmnet = 'output_multisheet10.xlsx'; 
% 
% 
% xlswrite(ComputerAssignmnet, data1, ' C_ly_CL_ellip');
% xlswrite(ComputerAssignmnet, data2, 'y_c_ellip');
%  xlswrite(ComputerAssignmnet, data3, 'gamma_cap_ellip');





 %% Plot for Spanwise lift distibution & Gamma vs Yc

 figure(1)

 hold on

 plot(y_c , C_ly_CL_ellip , "r:^" ,"DisplayName", "Elliptical Wing")
 plot(y_c , C_ly_CL_rect , "b -.+","DisplayName", "Rectangular Wing")
 plot(y_c , C_ly_CL_taper , "k --o", "DisplayName", "Tapered Wing")
legend('show');
xlabel('Span Location (y_c)');
ylabel('Spanwise Lift Distribution (C_L(y) / C_L)');
title('Spanwise Lift Distribution for Different Wing Shapes');

hold off

figure(2)
hold on
 plot(y_c , gamma_cap_y_ellip , "r:^" ,"DisplayName", "Elliptical Wing")
 plot(y_c , gamma_cap_y_rect , "b :+","DisplayName", "Rectangular Wing")
 plot(y_c , gamma_cap_y_taper , "k -.o","DisplayName", "Taper Wing")
legend('show');
xlabel('Span Location (y_c)');
ylabel('GAMMA(y)');
title('Spanwise Lift Distribution for Different Wing Shapes');

hold off




%% Plot capital gamma


% load('Gamma_cap_rect_N_2.mat','gamma_cap_y_rect_2')  
% load('Gamma_cap_rect_N_8.mat','gamma_cap_y_rect_8')  
% load('Gamma_cap_rect_N_32.mat','gamma_cap_y_rect_32')  
% load('Gamma_cap_rect_N_128.mat','gamma_cap_y_rect_128')  
% 
% load('Gamma_cap_taper_N_2.mat','gamma_cap_y_taper_2') 
% load('Gamma_cap_taper_N_8.mat','gamma_cap_y_taper_8') 
% load('Gamma_cap_taper_N_32.mat','gamma_cap_y_taper_32') 
% load('Gamma_cap_taper_N_128.mat','gamma_cap_y_taper_128') 
% 
% load('Gamma_cap_ellip_N_2.mat','gamma_cap_y_ellip_2') 
% load('Gamma_cap_ellip_N_8.mat','gamma_cap_y_ellip_8') 
% load('Gamma_cap_ellip_N_32.mat','gamma_cap_y_ellip_32') 
% load('Gamma_cap_ellip_N_128.mat','gamma_cap_y_ellip_128') 
% 
% load('y_c_2.mat','y_c_2') 
% load('y_c_8.mat','y_c_8') 
% load('y_c_32.mat','y_c_32') 
% load('y_c_128.mat','y_c_128') 


% Elliptical Plot

% figure(3)
% hold on
% 
% plot(y_c_2,gamma_cap_y_ellip_2,"r^" ,"DisplayName", "N=2")
% plot(y_c_8,gamma_cap_y_ellip_8,"bo" ,"DisplayName", "N=8")
% plot(y_c_32,gamma_cap_y_ellip_32,"k +","DisplayName", "N=32")
% plot(y_c_128,gamma_cap_y_ellip_128,"m d","DisplayName", "N=128")
% 
% xlabel('Span Location (y_c)');
% ylabel('GAMMA(y)');
% title('Gamma vs y_c at different N values - Elliptical');
% legend('show');
% 
% 
% hold off
% 
% figure(4)
% hold on
% plot(y_c_2,gamma_cap_y_rect_2,"r^" ,"DisplayName", "N=2")
% plot(y_c_8,gamma_cap_y_rect_8,"bo" ,"DisplayName", "N=8")
% plot(y_c_32,gamma_cap_y_rect_32,"k +","DisplayName", "N=32")
% plot(y_c_128,gamma_cap_y_rect_128,"m d","DisplayName", "N=128")
% xlabel('Span Location (y_c)');
% ylabel('GAMMA(y)');
% title('Gamma vs y_c at different N values - Rectangular');
% legend('show');
% 
% hold off
% 
% figure(5)
% hold on
% 
% plot(y_c_2,gamma_cap_y_taper_2,"r^" ,"DisplayName", "N=2")
% plot(y_c_8,gamma_cap_y_taper_8,"bo" ,"DisplayName", "N=8")
% plot(y_c_32,gamma_cap_y_taper_32,"k +","DisplayName", "N=32")
% plot(y_c_128,gamma_cap_y_taper_128,"m d","DisplayName", "N=128")
% xlabel('Span Location (y_c)');
% ylabel('GAMMA(y)');
% title('Gamma vs y_c at different N values - Tapered');
% legend('show');
% 
% hold off




