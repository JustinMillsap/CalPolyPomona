% ARO - 4351L Experiment 3: F22 - WT Test
% Written By: Justin Millsap
% Date: 03/05/2024
% Tool Version: R2023b
% other .m files required: importfile.m ~ Excel sheet of data converted into a function 

%% Version Notes:
%{

Issue (V1): Go over equations to make sure they are correct. Plots are off

Fix (V1)  : 


%}

% Replace first quotation with users DIERECT path to Data provided by Royas

clc; clear; close all
Exp3data = importfile("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp #3\Exp 3 FM Run All rev a.xlsx", "Exp 3 FM Run All rev a", [1, Inf]);



%% Velocity in ft/s for different velocity:

team0data_Velfs = Exp3data.VelFs(4:16);  % V = 0
team1data_Velfs = Exp3data.VelFs(17:28);  % V = 100
team2data_Velfs = Exp3data.VelFs(29:40);  % V = 150
team3data_Velfs = Exp3data.VelFs(41:52);  % V = 175
team4data_Velfs = Exp3data.VelFs(53:64);  % V = 200
team5data_Velfs = Exp3data.VelFs(65:76);  % V = 220
    
%% Velocity in m/s for different velocity:
team0data_VelMs = Exp3data.Vel_SIMs(4:16);  % V = 0
team1data_VelMs = Exp3data.Vel_SIMs(17:28);  % V = 100
team2data_VelMs = Exp3data.Vel_SIMs(29:40);  % V = 150
team3data_VelMs = Exp3data.Vel_SIMs(41:52);  % V = 175
team4data_VelMs = Exp3data.Vel_SIMs(53:64);  % V = 200
team5data_VelMs = Exp3data.Vel_SIMs(65:76);  % V = 220

%% P_inf (PSI) for different velocity

team0data_PinfPsi = Exp3data.PinfPsi(4:16);  % V = 0
team1data_PinfPsi = Exp3data.PinfPsi(17:28);  % V = 100
team2data_PinfPsi = Exp3data.PinfPsi(29:40);  % V = 150
team3data_PinfPsi = Exp3data.PinfPsi(41:52);  % V = 175
team4data_PinfPsi = Exp3data.PinfPsi(53:64);  % V = 200
team5data_PinfPsi = Exp3data.PinfPsi(65:76);  % V = 220

%% P_inf (kPa) for different velocity

team0data_PinfkPa = Exp3data.Pinf_SIKPa(4:16);  % V = 0
team1data_PinfkPa = Exp3data.Pinf_SIKPa(17:28);  % V = 100
team2data_PinfkPa = Exp3data.Pinf_SIKPa(29:40);  % V = 150
team3data_PinfkPa = Exp3data.Pinf_SIKPa(41:52);  % V = 175
team4data_PinfkPa = Exp3data.Pinf_SIKPa(53:64);  % V = 200
team5data_PinfkPa = Exp3data.Pinf_SIKPa(65:76);  % V = 220

%% Temp (C) for different velocity

team0data_Mach = Exp3data.Mach(4:16);  % V = 0
team1data_Mach = Exp3data.Mach(17:28);  % V = 100
team2data_Mach = Exp3data.Mach(29:40);  % V = 150
team3data_Mach = Exp3data.Mach(41:52);  % V = 175
team4data_Mach = Exp3data.Mach(53:64);  % V = 200
team5data_Mach = Exp3data.Mach(65:76);  % V = 220

%% Mach for different velocity

team0data_T = Exp3data.Temp_SIC(4:16);  % V = 0
team1data_T = Exp3data.Temp_SIC(17:28);  % V = 100
team2data_T = Exp3data.Temp_SIC(29:40);  % V = 150
team3data_T = Exp3data.Temp_SIC(41:52);  % V = 175
team4data_T = Exp3data.Temp_SIC(53:64);  % V = 200
team5data_T = Exp3data.Temp_SIC(65:76);  % V = 220
%% Normal Force for different velocity:

team0data_NF = Exp3data.NF(4:15);  % V = 0
team1data_NF = Exp3data.NF(17:28) - team0data_NF;  % V = 100
team2data_NF = Exp3data.NF(29:40)- team0data_NF;  % V = 150
team3data_NF = Exp3data.NF(41:52)- team0data_NF;  % V = 175
team4data_NF = Exp3data.NF(53:64)- team0data_NF;  % V = 200
team5data_NF = Exp3data.NF(65:76)- team0data_NF;  % V = 220

%% Pitching Moment for different velocity

team0data_PM = Exp3data.PM(4:15);  % V = 0
team1data_PM = Exp3data.PM(17:28) - team0data_PM;  % V = 100
team2data_PM = Exp3data.PM(29:40) - team0data_PM;  % V = 150
team3data_PM = Exp3data.PM(41:52) - team0data_PM;  % V = 175
team4data_PM = Exp3data.PM(53:64) - team0data_PM;  % V = 200
team5data_PM = Exp3data.PM(65:76)- team0data_PM;  % V = 220

%% Side Force for different velocity

team0data_SF = Exp3data.SF(4:15);  % V = 0
team1data_SF = Exp3data.SF(17:28) %- team0data_SF; % V = 100
team2data_SF = Exp3data.SF(29:40) %- team0data_SF;  % V = 150
team3data_SF = Exp3data.SF(41:52) %- team0data_SF;  % V = 175
team4data_SF = Exp3data.SF(53:64) %- team0data_SF;  % V = 200
team5data_SF = Exp3data.SF(65:76) %- team0data_SF;  % V = 220

%% Yaw Moment for different velocity

team0data_YM = Exp3data.YM(4:15);  % V = 0
team1data_YM = Exp3data.YM(17:28) %- team0data_YM; % V = 100
team2data_YM = Exp3data.YM(29:40) %- team0data_YM; % V = 150
team3data_YM = Exp3data.YM(41:52) %- team0data_YM; % V = 175
team4data_YM = Exp3data.YM(53:64) %- team0data_YM; % V = 200
team5data_YM = Exp3data.YM(65:76) %- team0data_YM; % V = 220

%% Rolling Moment for different velocity

team0data_RM = Exp3data.RM(4:15);  % V = 0
team1data_RM = Exp3data.RM(17:28) %- team0data_RM; % V = 100
team2data_RM = Exp3data.RM(29:40) %-% team0data_RM; % V = 150
team3data_RM = Exp3data.RM(41:52) %- team0data_RM; % V = 175
team4data_RM = Exp3data.RM(53:64) %- team0data_RM; % V = 200
team5data_RM = Exp3data.RM(65:76) %- team0data_RM; % V = 220

%% AoA for different Teams 

team0data_AoA = Exp3data.PitchAbs(4:15);  % V = 0
team1data_AoA = Exp3data.PitchAbs(17:28); % V = 100
team2data_AoA = Exp3data.PitchAbs(29:40); % V = 150
team3data_AoA = Exp3data.PitchAbs(41:52); % V = 175
team4data_AoA = Exp3data.PitchAbs(53:64); % V = 200
team5data_AoA = Exp3data.PitchAbs(65:76); % V = 220

%% Aerodynamic Force for different velocity 

team0data_AF = Exp3data.AF(4:15);  % V = 0
team1data_AF = Exp3data.AF(17:28) - team0data_AF; % V = 100
team2data_AF = Exp3data.AF(29:40) - team0data_AF; % V = 150
team3data_AF = Exp3data.AF(41:52) - team0data_AF; % V = 175
team4data_AF = Exp3data.AF(53:64) - team0data_AF; % V = 200
team5data_AF = Exp3data.AF(65:76) - team0data_AF; % V = 220


%% Constants

S = 0.525; % [ ft^2 ]
c_w = 0.58; % [ ft ]
b = 13.5; % [ ft ]
W = 3.24 % [ lb ]
x = 13 % [ ft ]
z = 1.875% [ ft ]



%% Dynamic Pressure for different velo.

;
rho_air = 2.378 * 10^-3 ; % [ slug /ft^3 ]

team0_velocity = Exp3data.VelFs(4:15)
team1_velocity = Exp3data.VelFs(17:28)
team2_velocity = Exp3data.VelFs(29:40)
team3_velocity = Exp3data.VelFs(41:52)
team4_velocity = Exp3data.VelFs(53:64)
team5_velocity = Exp3data.VelFs(65:76)

team0_q = (1/2)*rho_air*(team0_velocity).^2;
team1_q = (1/2)*rho_air*(team1_velocity).^2;
team2_q = (1/2)*rho_air*(team2_velocity).^2;
team3_q = (1/2)*rho_air*(team3_velocity).^2;
team4_q = (1/2)*rho_air*(team4_velocity).^2;
team5_q = (1/2)*rho_air*(team5_velocity).^2;



%% Forces for Balance axis (UNCORRECTED) 

% C_Nu = N / q*S [Normal Force]

team0_C_Nu = team0data_NF/(S*team0_q);

for i = 1:12
team1_C_Nu(i) = team1data_NF(i) /(S*team1_q(i));
end

for i = 1:12
team2_C_Nu(i) = team2data_NF(i)/(S*team2_q(i)) ;
end 

for i = 1:12
team3_C_Nu(i)= team3data_NF(i)/(S*team3_q(i)) ;
end

for i = 1:12
team4_C_Nu(i)= team4data_NF(i)/(S*team4_q(i));
end

for i = 1:12
team5_C_Nu(i)= team5data_NF(i)/(S*team5_q(i)) ;
end

% C_cu = Cc / q*S   [Chord Force]
team0_C_cu = team0data_AF/(S*team0_q(i));

for i = 1:12
team1_C_cu(i) = team1data_AF(i)/(S*team1_q(i)) ;
end
for i = 1:12
team2_C_cu(i) = (team2data_AF(i) + team0data_AF(i))/(S*team2_q(i)) ;
end

team2_C_cu(1) = team2data_AF(1)/ (S*team2_q(1))
for i = 1:12
team3_C_cu(i) = team3data_AF(i)/(S*team3_q(i)) ;
end
for i = 1:12
team4_C_cu(i) = team4data_AF(i)/(S*team4_q(i)) ;
end
for i = 1:12
team5_C_cu(i) = team5data_AF(i)/(S*team5_q(i)) ;
end
%C_Yu = Y/q*S Side Force [Side Force]

team0_C_Yu = team0data_SF/(S*team0_q(i));
for i = 1:12
team1_C_Yu(i) = team1data_SF(i)/(S*team1_q(i)) ;
end
for i = 1:12
team2_C_Yu(i) = team2data_SF(i)/(S*team2_q(i)) ;
end
for i = 1:12
team3_C_Yu(i) = team3data_SF(i)/(S*team3_q(i));
end
for i = 1:12
team4_C_Yu(i) = team4data_SF(i)/(S*team4_q(i)) ;
end
for i = 1:12
team5_C_Yu(i) = team5data_SF(i)/(S*team5_q(i));
end

% C_PMu = PM / q*S*Cw [ Pitching Moment ]

team0_C_PMu = team0data_PM/(S*c_w*team0_q(i));
for i = 1:12
team1_C_PMu(i)= team1data_PM(i)/(S*c_w*team1_q(i)) ;
end
for i = 1:12
team2_C_PMu(i)= team2data_PM(i)/(S*c_w*team2_q(i)) ;
end
for i = 1:12
team3_C_PMu(i)= team3data_PM(i)/(S*c_w*team3_q(i));
end
for i = 1:12
team4_C_PMu(i)= team4data_PM(i)/(S*c_w*team4_q(i)) ;
end
for i = 1:12
team5_C_PMu(i)= team5data_PM(i)/(S*c_w*team5_q(i)) ;
end


%C_YMu = YM/q*S*b [ Yawing Moment ]

team0_C_YMu = team0data_YM/(S*b*team0_q(i));
for i = 1:12
team1_C_YMu(i) = team1data_YM(i)/(S*c_w*team1_q(i));
end 
for i = 1:12
team2_C_YMu(i) = team2data_YM(i)/(S*c_w*team2_q(i));
end 
for i = 1:12
team3_C_YMu(i) = team3data_YM(i)/(S*c_w*team3_q(i)) ;
end
for i = 1:12
team4_C_YMu(i) = team4data_YM(i)/(S*c_w*team4_q(i)) ;
end 
for i = 1:12
team5_C_YMu(i) = team5data_YM(i)/(S*c_w*team5_q(i)) ;
end 
%C_lmu = RM/q*S*b [ Rolling Moment ]

team0_C_lmu = team0data_RM/(S*c_w*team0_q(i));
for i = 1:12
team1_C_lmu(i)= team1data_RM(i)/(S*c_w*team1_q(i)) ;
end 
for i = 1:12
team2_C_lmu(i)= team2data_RM(i)/(S*c_w*team2_q(i)) ;
end 
for i = 1:12
team3_C_lmu(i)= team3data_RM(i)/(S*c_w*team3_q(i)) ;
end 
for i = 1:12
team4_C_lmu(i)= team4data_RM(i)/(S*c_w*team4_q(i)) ;
end 
for i = 1:12
team5_C_lmu(i)= team5data_RM(i)/(S*c_w*team5_q(i)) ;
end 

%% Corrected External balance Data

% Normal Force

team0_C_Nc = team0_C_Nu - 0.001*team0_C_Nu
team1_C_Nc = team1_C_Nu - 0.001*team1_C_Nu
team2_C_Nc = team2_C_Nu - 0.001*team2_C_Nu
team3_C_Nc = team3_C_Nu - 0.001*team3_C_Nu
team4_C_Nc = team4_C_Nu - 0.001*team4_C_Nu
team5_C_Nc = team5_C_Nu - 0.001*team5_C_Nu

% Chord Force 
team0_C_cc = team0_C_cu - 0.01*team0_C_cu;
team1_C_cc = team1_C_cu - 0.01*team1_C_cu;
team2_C_cc = team2_C_cu - 0.01*team2_C_cu;
team3_C_cc = team3_C_cu - 0.01*team3_C_cu;
team4_C_cc = team4_C_cu - 0.01*team4_C_cu;
team5_C_cc = team5_C_cu - 0.01*team5_C_cu;

% team0_C_cc = team0_C_cu;
% team1_C_cc = team1_C_cu;
% team2_C_cc = team2_C_cu;
% team3_C_cc = team3_C_cu;
% team4_C_cc = team4_C_cu;
% team5_C_cc = team5_C_cu;

% Side Force 

team0_C_Yc = team0_C_Yu;
team1_C_Yc = team1_C_Yu;
team2_C_Yc = team2_C_Yu;
team3_C_Yc = team3_C_Yu;
team4_C_Yc = team4_C_Yu;
team5_C_Yc = team5_C_Yu;

% Pitching Moment

team0_C_PMc = team0_C_PMu;
team1_C_PMc = team1_C_PMu;
team2_C_PMc = team2_C_PMu;
team3_C_PMc = team3_C_PMu;
team4_C_PMc = team4_C_PMu;
team5_C_PMc = team5_C_PMu;

% Yawing Moment
team0_C_YMc = team0_C_YMu;
team1_C_YMc = team1_C_YMu;
team2_C_YMc = team2_C_YMu;
team3_C_YMc = team3_C_YMu;
team4_C_YMc = team4_C_YMu;
team5_C_YMc = team5_C_YMu;

% Rolling Moment
team0_C_lmc = team0_C_lmu;
team1_C_lmc = team1_C_lmu;
team2_C_lmc = team2_C_lmu;
team3_C_lmc = team3_C_lmu;
team4_C_lmc = team4_C_lmu;
team5_C_lmc = team5_C_lmu;

%% Tramsfer to MAC

% Normal Force C_N_MAC = C_NC

team_0_N_MAC = team0_C_Nu ;
team_1_N_MAC = team1_C_Nu ;
team_2_N_MAC = team2_C_Nu ;
team_3_N_MAC = team3_C_Nu ;
team_4_N_MAC = team4_C_Nu ;
team_5_N_MAC = team5_C_Nu ;

% Chord Force C_Cc_MAC = C_Cc

team_0_Cc_MAC = team0_C_cu ;
team_1_Cc_MAC = team1_C_cu ;
team_2_Cc_MAC = team2_C_cu ;
team_3_Cc_MAC = team3_C_cu ;
team_4_Cc_MAC = team4_C_cu ;
team_5_Cc_MAC = team5_C_cu ;
% Side Force "Y" C_Y_mac = C_Yc
team_0_Y_MAC = team0_C_Yu ;
team_1_Y_MAC = team1_C_Yu ;
team_2_Y_MAC = team2_C_Yu ;
team_3_Y_MAC = team3_C_Yu ;
team_4_Y_MAC = team4_C_Yu ;
team_5_Y_MAC = team5_C_Yu ;

% Pitching Moment "PM" PM_MAC = C_MC*(x/c_bar) = C_cc*(z/c_bar)

team_0_PM_MAC = team0_C_PMu - team0_C_Nu*(x/c_w) - team0_C_cu*(z/c_w);
team_1_PM_MAC = team1_C_PMu - team1_C_Nu*(x/c_w) - team1_C_cu*(z/c_w);
team_2_PM_MAC = team2_C_PMu - team2_C_Nu*(x/c_w) - team2_C_cu*(z/c_w);
team_3_PM_MAC = team3_C_PMu - team3_C_Nu*(x/c_w) - team3_C_cu*(z/c_w);
team_4_PM_MAC = team4_C_PMu - team4_C_Nu*(x/c_w) - team4_C_cu*(z/c_w);
team_5_PM_MAC = team5_C_PMu - team5_C_Nu*(x/c_w) - team5_C_cu*(z/c_w);

% Yawing Moment "YM"  YM_MAC = C_YM_c = C_Y_c(x/b)
team_0_YM_MAC = team0_C_YMu - team0_C_Yu*(x/b);
team_1_YM_MAC = team1_C_YMu - team1_C_Yu*(x/b);
team_2_YM_MAC = team2_C_YMu - team2_C_Yu*(x/b);
team_3_YM_MAC = team3_C_YMu - team3_C_Yu*(x/b);
team_4_YM_MAC = team4_C_YMu - team4_C_Yu*(x/b);
team_5_YM_MAC = team5_C_YMu - team5_C_Yu*(x/b);

% Rolling moment (MAC) C_l_mac = C_lc - C_Y_c(z/S)

team_0_l_MAC = team0_C_lmu - team0_C_Yu*(z/S);
team_1_l_MAC = team1_C_lmu - team1_C_Yu*(z/S);
team_2_l_MAC = team2_C_lmu - team2_C_Yu*(z/S);
team_3_l_MAC = team3_C_lmu - team3_C_Yu*(z/S);
team_4_l_MAC = team4_C_lmu - team4_C_Yu*(z/S);
team_5_l_MAC = team5_C_lmu - team5_C_Yu*(z/S);

%% Stability axis data [sa]

AoA = [-4 -2 0 2 4 6 8 10 12 13 14 15]';

% Lift

for i = 1:12
    team_0_L_sa = team_0_N_MAC*cosd(AoA(i)) - team_0_Cc_MAC*sind(AoA(i));
end

for i = 1:12
    team_1_L_sa = team_1_N_MAC*cosd(AoA(i)) - team_1_Cc_MAC*sind(AoA(i));
end

for i = 1:12
    team_2_L_sa = team_2_N_MAC*cosd(AoA(i)) - team_2_Cc_MAC*sind(AoA(i));
end

for i = 1:12
    team_3_L_sa = team_3_N_MAC*cosd(AoA(i)) - team_3_Cc_MAC*sind(AoA(i));
end

for i = 1:12
    team_4_L_sa = team_4_N_MAC*cosd(AoA(i)) - team_4_Cc_MAC*sind(AoA(i));
end

for i = 1:12
    team_5_L_sa = team_5_N_MAC*cosd(AoA(i)) - team_5_Cc_MAC*sind(AoA(i));
end

% Drag

for i = 1:12
    team_0_D_sa = (team_0_Cc_MAC*cosd(AoA(i)) + team_0_N_MAC*sind(AoA(i)));
end

for i = 1:12
    team_1_D_sa = team_1_Cc_MAC*cosd(AoA(i)) + team_1_N_MAC*sind(AoA(i));
end

for i = 1:12
    team_2_D_sa = team_2_Cc_MAC*cosd(AoA(i)) + team_1_N_MAC*sind(AoA(i));
end

for i = 1:12
    team_3_D_sa = team_3_Cc_MAC*cosd(AoA(i)) + team_3_N_MAC*sind(AoA(i));
end

for i = 1:12
    team_4_D_sa = team_4_Cc_MAC*cosd(AoA(i)) + team_4_N_MAC*sind(AoA(i));
end

for i = 1:12
    team_5_D_sa = team_5_Cc_MAC*cosd(AoA(i)) + team_5_N_MAC*sind(AoA(i));
end

% Side force

team0_C_Y_sa = team_0_Y_MAC;
team1_C_Y_sa = team_1_Y_MAC;
team2_C_Y_sa = team_2_Y_MAC;
team3_C_Y_sa = team_3_Y_MAC;
team4_C_Y_sa = team_4_Y_MAC;
team5_C_Y_sa = team_5_Y_MAC;

% Pitching Moment

team0_C_PM_sa = team_0_PM_MAC;
team1_C_PM_sa = team_1_PM_MAC;
team2_C_PM_sa = team_2_PM_MAC;
team3_C_PM_sa = team_3_PM_MAC;
team4_C_PM_sa = team_4_PM_MAC;
team5_C_PM_sa = team_5_PM_MAC;

% Yawing moment

for i = 1:12
team0_C_YM_sa = team_0_YM_MAC*cosd(AoA(i)) - team_0_l_MAC*sind(AoA(i));
end

for i = 1:12
team1_C_YM_sa = team_1_YM_MAC*cosd(AoA(i)) - team_1_l_MAC*sind(AoA(i));
end

for i = 1:12
team2_C_YM_sa = team_2_YM_MAC*cosd(AoA(i)) - team_2_l_MAC*sind(AoA(i));
end

for i = 1:12
team3_C_YM_sa = team_3_YM_MAC*cosd(AoA(i)) - team_3_l_MAC*sind(AoA(i));
end

for i = 1:12
team4_C_YM_sa = team_4_YM_MAC*cosd(AoA(i)) - team_4_l_MAC*sind(AoA(i));
end

for i = 1:12
team5_C_YM_sa = team_5_YM_MAC*cosd(AoA(i)) - team_5_l_MAC*sind(AoA(i));
end

% Rolling moment

for i = 1:12
team0_C_RM_sa = team_0_l_MAC*cosd(AoA(i)) + team_0_YM_MAC*sind(AoA(i));
end

for i = 1:12
team1_C_RM_sa = team_1_l_MAC*cosd(AoA(i)) + team_1_YM_MAC*sind(AoA(i));
end

for i = 1:12
team2_C_RM_sa = team_2_l_MAC*cosd(AoA(i)) + team_2_YM_MAC*sind(AoA(i));
end

for i = 1:12
team3_C_RM_sa = team_3_l_MAC*cosd(AoA(i)) + team_3_YM_MAC*sind(AoA(i));
end

for i = 1:12
team4_C_RM_sa = team_4_l_MAC*cosd(AoA(i)) + team_4_YM_MAC*sind(AoA(i));
end

for i = 1:12
team5_C_RM_sa = team_5_l_MAC*cosd(AoA(i)) + team_5_YM_MAC*sind(AoA(i));
end
%% PLOTS
AoA = [-4 -2 0 2 4 6 8 10 12 13 14 15]';

% BALANCE AXIS PLOTS

%~~~~~~~~~~~~~~~~ C_N ~~~~~~~~~~~~~~%

figure(1)
plot(AoA, team1_C_Nc, 'LineWidth', 1); 
hold on
plot(AoA, team2_C_Nc, 'LineWidth', 1);
plot(AoA, team3_C_Nc, 'LineWidth', 1);
plot(AoA, team4_C_Nc, 'LineWidth', 1);
plot(AoA, team5_C_Nc, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('C_N')
title('C_N vs AoA (\alpha) [STABILITY AXIS]')
grid on
hold off

%~~~~~~~~~~~~~~~~~ C_c ~~~~~~~~~~~%

figure(2)
plot(AoA, team1_C_cc, 'LineWidth', 1); 
hold on
plot(AoA, team2_C_cc, 'LineWidth', 1);
plot(AoA, team3_C_cc, 'LineWidth', 1);
plot(AoA, team4_C_cc, 'LineWidth', 1);
plot(AoA, team5_C_cc, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('C_c')
title('C_c vs AoA (\alpha) [STABILITY AXIS]')
grid on
hold off

%~~~~~~~~~~~~~~~~~ C_PM ~~~~~~~~~~~%

figure(3)
plot(AoA, team1_C_PMc, 'LineWidth', 1); 
hold on
plot(AoA, team2_C_PMc, 'LineWidth', 1);
plot(AoA, team3_C_PMc, 'LineWidth', 1);
plot(AoA, team4_C_PMc, 'LineWidth', 1);
plot(AoA, team5_C_PMc, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('$C_{PM}$','Interpreter', 'latex')
title('C_{PM} vs AoA (\alpha) [STABILITY AXIS]')
grid on
hold off

% Stability Axis Plots

%~~~~~~~~~~~~~~~~ C_L ~~~~~~~~~~~~~~%

figure(4)
plot(AoA,  team_1_L_sa, 'LineWidth', 1); 
hold on
plot(AoA, team_2_L_sa, 'LineWidth', 1);
plot(AoA, team_3_L_sa, 'LineWidth', 1);
plot(AoA, team_4_L_sa, 'LineWidth', 1);
plot(AoA, team_5_L_sa, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('C_L')
title('C_L vs AoA (\alpha) [STABILITY AXIS]')
grid on
hold off

%~~~~~~~~~~~~~~~~~ C_D ~~~~~~~~~~~%


figure(5)
plot(AoA, team_1_D_sa, 'LineWidth', 1); 
hold on
plot(AoA, team_2_D_sa, 'LineWidth', 1);
plot(AoA, team_3_D_sa, 'LineWidth', 1);
plot(AoA, team_4_D_sa, 'LineWidth', 1);
plot(AoA, team_5_D_sa, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('C_D')
title('C_D vs AoA (\alpha) [STABILITY AXIS]')

grid on
hold off

%~~~~~~~~~~~~~~~~~ C_PM ~~~~~~~~~~~%

figure(6)
plot(AoA, team1_C_PM_sa, 'LineWidth', 1); 
hold on
plot(AoA, team2_C_PM_sa, 'LineWidth', 1);
plot(AoA, team3_C_PM_sa, 'LineWidth', 1);
plot(AoA, team4_C_PM_sa, 'LineWidth', 1);
plot(AoA, team5_C_PM_sa, 'LineWidth', 1);
legend('Team 1, V = 100 ft/s', 'Team 2, V = 150 ft/s', 'Team 3, V = 175 ft/s', 'Team 4, V = 200 ft/s', 'Team 5, V = 220 ft/s', 'Location', 'best');
xlabel('AoA (\alpha)')
ylabel('$C_{PM}$','Interpreter', 'latex')
title('C_{PM} vs AoA (\alpha) [STABILITY AXIS]')
grid on
hold off


toc



