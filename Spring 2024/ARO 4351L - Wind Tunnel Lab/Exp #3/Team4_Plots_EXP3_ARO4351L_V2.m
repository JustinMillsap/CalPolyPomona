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
team2data_NF = Exp3data.NF(29:40) - team0data_NF;  % V = 150
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
team1data_SF = Exp3data.SF(17:28) - team0data_SF; % V = 100
team2data_SF = Exp3data.SF(29:40) - team0data_SF;  % V = 150
team3data_SF = Exp3data.SF(41:52) - team0data_SF;  % V = 175
team4data_SF = Exp3data.SF(53:64) - team0data_SF;  % V = 200
team5data_SF = Exp3data.SF(65:76) - team0data_SF;  % V = 220

%% Yaw Moment for different velocity

team0data_YM = Exp3data.YM(4:15);  % V = 0
team1data_YM = Exp3data.YM(17:28) - team0data_YM; % V = 100
team2data_YM = Exp3data.YM(29:40) - team0data_YM; % V = 150
team3data_YM = Exp3data.YM(41:52) - team0data_YM; % V = 175
team4data_YM = Exp3data.YM(53:64) - team0data_YM; % V = 200
team5data_YM = Exp3data.YM(65:76) - team0data_YM; % V = 220

%% Rolling Moment for different velocity

team0data_RM = Exp3data.RM(4:15);  % V = 0
team1data_RM = Exp3data.RM(17:28) - team0data_RM; % V = 100
team2data_RM = Exp3data.RM(29:40) - team0data_RM; % V = 150
team3data_RM = Exp3data.RM(41:52) - team0data_RM; % V = 175
team4data_RM = Exp3data.RM(53:64) - team0data_RM; % V = 200
team5data_RM = Exp3data.RM(65:76) - team0data_RM; % V = 220

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
b = 13.5/12; % [ ft ]
W = 3.24 % [ lb ]
x = 2/12 % [ ft ]
z = 0.625/12 % [ ft ]



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

%% Balance Axis Uncorrected

% Normal Force Uncorrected:

for i = 1:12
team0_C_Nu(i) = team0data_NF(i)/(S*team0_q(i));
end

for i = 1:12
team1_C_Nu(i) = team1data_NF(i)/(S*team1_q(i));
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
team1_C_cu(i) = team1data_AF(i) + team0data_AF(i)/(S*team1_q(i)) ;
end
for i = 1:12
team2_C_cu(i) = team2data_AF(i)+ team0data_AF(i)/(S*team2_q(i)) ;
end
for i = 1:12
team3_C_cu(i) = team3data_AF(i)+ team0data_AF(i)/(S*team3_q(i)) ;
end
for i = 1:12
team4_C_cu(i) = team4data_AF(i)+ team0data_AF(i)/(S*team4_q(i)) ;
end
for i = 1:12
team5_C_cu(i) = team5data_AF(i)+ team0data_AF(i)/(S*team5_q(i)) ;
end