% ARO - 4351L Experiment 4: SuperSonic Wind Tunnel Exp
% Written By: Justin Millsap & Matthew Portugal
% Date: 3/14/2024
% Tool Version: R2023b
% other .m files required: importdataExp4.m ~ Excel sheet of data converted into a function 
% Other files required: 


%% Import Data by team 

team5data = importdataExp4("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M3.6", [1, Inf]);
team4data = importdataExp4("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M3.2", [1, Inf]);
team3data = importdataExp4("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M2.8", [1, Inf]);
team2data = importdataExp4("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M2.4", [1, Inf]);
team1data = importdataExp4("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M1.8", [1, Inf]);


%% time [seconds]

team5data_Time = team5data.Time(8:16);
team4data_Time = team4data.Time(8:17);
team3data_Time = team3data.Time(8:17);
team2data_Time = team2data.Time(7:16);
team1data_Time = team1data.Time(8:17);

%% P_tank [bar]

team5data_P_tank  = team5data.P_tank(8:16);
team4data_P_tank  = team4data.P_tank(8:17);
team3data_P_tank  = team3data.P_tank(8:17);
team2data_P_tank  = team2data.P_tank(7:16);
team1data_P_tank  = team1data.P_tank(8:17);

%% dx [inches ]

team5data_dx  = team5data.dx(8:16);
team4data_dx  = team4data.dx(8:17);
team3data_dx  = team3data.dx(8:17);
team2data_dx  = team2data.dx(7:16);
team1data_dx  = team1data.dx(8:17);

%% P/P0 []

team5data_P_P0  = team5data.P_P0(8:16);
team4data_P_P0  = team4data.P_P0(8:17);
team3data_P_P0  = team3data.P_P0(8:17);
team2data_P_P0  = team2data.P_P0(7:16);
team1data_P_P0  = team1data.P_P0(8:17);

%% M []

team5data_M  = team5data.M(8:16);
team4data_M  = team4data.M(8:17);
team3data_M  = team3data.M(8:17);
team2data_M  = team2data.M(7:16);
team1data_M  = team1data.M(8:17);


%% T0 [ deg F ]

team5data_T0 = team5data.T0(8:16);
team4data_T0 = team4data.T0(8:17);
team3data_T0 = team3data.T0(8:17);
team2data_T0 = team2data.T0(7:16);
team1data_T0 = team1data.T0(8:17);

%% 8101 [ deg F ]

team5data_8101 = team5data.x8101(8:16);
team4data_8101 = team4data.x8101(8:17);
team3data_8101 = team3data.x8101(8:17);
team2data_8101 = team2data.x8101(7:16);
team1data_8101 = team1data.x8101(8:17);

%% 8102 [ deg F ]

team5data_8102 = team5data.x8102(8:16);
team4data_8102 = team4data.x8102(8:17);
team3data_8102 = team3data.x8102(8:17);
team2data_8102 = team2data.x8102(7:16);
team1data_8102 = team1data.x8102(8:17);

%% P0 [ bar ]

team5data_P0 = team5data.P0(8:16);
team4data_P0 = team4data.P0(8:17);
team3data_P0 = team3data.P0(8:17);
team2data_P0 = team2data.P0(7:16);
team1data_P0 = team1data.P0(8:17);

%% Model 1 [ bar ]

team5data_Model1 = team5data.Model1(8:16);
team4data_Model1 = team4data.Model1(8:17);
team3data_Model1 = team3data.Model1(8:17);
team2data_Model1 = team2data.Model1(7:16);
team1data_Model1 = team1data.Model1(8:17);

%% Model 2 [ bar ]

team5data_Model2 = team5data.Model2(8:16);
team4data_Model2 = team4data.Model2(8:17);
team3data_Model2 = team3data.Model2(8:17);
team2data_Model2 = team2data.Model2(7:16);
team1data_Model2 = team1data.Model2(8:17);

%% Model 3 [ bar ]

team5data_Model3 = team5data.Model3(8:16);
team4data_Model3 = team4data.Model3(8:17);
team3data_Model3 = team3data.Model3(8:17);
team2data_Model3 = team2data.Model3(7:16);
team1data_Model3 = team1data.Model3(8:17);

%% Model 4 [ bar ]

team5data_Model4 = team5data.Model4(8:16);
team4data_Model4 = team4data.Model4(8:17);
team3data_Model4 = team3data.Model4(8:17);
team2data_Model4 = team2data.Model4(7:16);
team1data_Model4 = team1data.Model4(8:17);

%% Model 5 [ bar ]

team5data_Model5 = team5data.Model5(8:16);
team4data_Model5 = team4data.Model5(8:17);
team3data_Model5 = team3data.Model5(8:17);
team2data_Model5 = team2data.Model5(7:16);
team1data_Model5 = team1data.Model5(8:17);

%% TS 1 [ bar ]

team5data_TS1 = team5data.TS1(8:16);
team4data_TS1 = team4data.TS1(8:17);
team3data_TS1 = team3data.TS1(8:17);
team2data_TS1 = team2data.TS1(7:16);
team1data_TS1 = team1data.TS1(8:17);

%% TS 2 [ bar ]

team5data_TS2 = team5data.TS2(8:16);
team4data_TS2 = team4data.TS2(8:17);
team3data_TS2 = team3data.TS2(8:17);
team2data_TS2 = team2data.TS2(7:16);
team1data_TS2 = team1data.TS2(8:17);

%% TS 3 [ bar ]

team5data_TS3 = team5data.TS3(8:16);
team4data_TS3 = team4data.TS3(8:17);
team3data_TS3 = team3data.TS3(8:17);
team2data_TS3 = team2data.TS3(7:16);
team1data_TS3 = team1data.TS3(8:17);

%% TS 4 [ bar ]

team5data_TS4 = team5data.TS4(8:16);
team4data_TS4 = team4data.TS4(8:17);
team3data_TS4 = team3data.TS4(8:17);
team2data_TS4 = team2data.TS4(7:16);
team1data_TS4 = team1data.TS4(8:17);

%% TS 5 [ bar ]

team5data_TS5 = team5data.TS5(8:16);
team4data_TS5 = team4data.TS5(8:17);
team3data_TS5 = team3data.TS5(8:17);
team2data_TS5 = team2data.TS5(7:16);
team1data_TS5 = team1data.TS5(8:17);

%% TS 6 [ bar ]

team5data_TS6 = team5data.TS6(8:16);
team4data_TS6 = team4data.TS6(8:17);
team3data_TS6 = team3data.TS6(8:17);
team2data_TS6 = team2data.TS6(7:16);
team1data_TS6 = team1data.TS6(8:17);

%% TS 7 [ bar ]

team5data_TS7 = team5data.TS7(8:16);
team4data_TS7 = team4data.TS7(8:17);
team3data_TS7 = team3data.TS7(8:17);
team2data_TS7 = team2data.TS7(7:16);
team1data_TS7 = team1data.TS7(8:17);

%% TS 8 [ bar ]

team5data_TS8 = team5data.TS8(8:16);
team4data_TS8 = team4data.TS8(8:17);
team3data_TS8 = team3data.TS8(8:17);
team2data_TS8 = team2data.TS8(7:16);
team1data_TS8 = team1data.TS8(8:17);

%% Nozz1 [ bar ]

team5data_Nozz1 = team5data.Nozz1(8:16);
team4data_Nozz1 = team4data.Nozz1(8:17);
team3data_Nozz1 = team3data.Nozz1(8:17);
team2data_Nozz1 = team2data.Nozz1(7:16);
team1data_Nozz1 = team1data.Nozz1(8:17);

%% Nozz2 [ bar ]

team5data_Nozz2 = team5data.Nozz2(8:16);
team4data_Nozz2 = team4data.Nozz2(8:17);
team3data_Nozz2 = team3data.Nozz2(8:17);
team2data_Nozz2 = team2data.Nozz2(7:16);
team1data_Nozz2 = team1data.Nozz2(8:17);

%% Nozz3 [ bar ]

team5data_Nozz3 = team5data.Nozz3(8:16);
team4data_Nozz3 = team4data.Nozz3(8:17);
team3data_Nozz3 = team3data.Nozz3(8:17);
team2data_Nozz3 = team2data.Nozz3(7:16);
team1data_Nozz3 = team1data.Nozz3(8:17);

%% Nozz4 [ bar ]

team5data_Nozz4 = team5data.Nozz4(8:16);
team4data_Nozz4 = team4data.Nozz4(8:17);
team3data_Nozz4 = team3data.Nozz4(8:17);
team2data_Nozz4 = team2data.Nozz4(7:16);
team1data_Nozz4 = team1data.Nozz4(8:17);

%% Nozz5 [ bar ]

team5data_Nozz5 = team5data.Nozz5(8:16);
team4data_Nozz5 = team4data.Nozz5(8:17);
team3data_Nozz5 = team3data.Nozz5(8:17);
team2data_Nozz5 = team2data.Nozz5(7:16);
team1data_Nozz5 = team1data.Nozz5(8:17);

%% Nozz6 [ bar ]

team5data_Nozz6 = team5data.Nozz6(8:16);
team4data_Nozz6 = team4data.Nozz6(8:17);
team3data_Nozz6 = team3data.Nozz6(8:17);
team2data_Nozz6 = team2data.Nozz6(7:16);
team1data_Nozz6 = team1data.Nozz6(8:17);

%% Nozz7 [ bar ]

team5data_Nozz7 = team5data.Nozz7(8:16);
team4data_Nozz7 = team4data.Nozz7(8:17);
team3data_Nozz7 = team3data.Nozz7(8:17);
team2data_Nozz7 = team2data.Nozz7(7:16);
team1data_Nozz7 = team1data.Nozz7(8:17);

%% Nozz8 [ bar ]

team5data_Nozz8 = team5data.Nozz8(8:16);
team4data_Nozz8 = team4data.Nozz8(8:17);
team3data_Nozz8 = team3data.Nozz8(8:17);
team2data_Nozz8 = team2data.Nozz8(7:16);
team1data_Nozz8 = team1data.Nozz8(8:17);

%% Nozz9 [ bar ]

team5data_Nozz9 = team5data.Nozz9(8:16);
team4data_Nozz9 = team4data.Nozz9(8:17);
team3data_Nozz9 = team3data.Nozz9(8:17);
team2data_Nozz9 = team2data.Nozz9(7:16);
team1data_Nozz9 = team1data.Nozz9(8:17);

%% Nozz10 [ bar ]

team5data_Nozz10 = team5data.Nozz10(8:16);
team4data_Nozz10 = team4data.Nozz10(8:17);
team3data_Nozz10 = team3data.Nozz10(8:17);
team2data_Nozz10 = team2data.Nozz10(7:16);
team1data_Nozz10 = team1data.Nozz10(8:17);

%% Nozz11 [ bar ]

team5data_Nozz11 = team5data.Nozz11(8:16);
team4data_Nozz11 = team4data.Nozz11(8:17);
team3data_Nozz11 = team3data.Nozz11(8:17);
team2data_Nozz11 = team2data.Nozz11(7:16);
team1data_Nozz11 = team1data.Nozz11(8:17);

%% Nozz12 [ bar ]

team5data_Nozz12 = team5data.Nozz12(8:16);
team4data_Nozz12 = team4data.Nozz12(8:17);
team3data_Nozz12 = team3data.Nozz12(8:17);
team2data_Nozz12 = team2data.Nozz12(7:16);
team1data_Nozz12 = team1data.Nozz12(8:17);

%% Nozz13 [ bar ]

team5data_Nozz13 = team5data.Nozz13(8:16);
team4data_Nozz13 = team4data.Nozz13(8:17);
team3data_Nozz13 = team3data.Nozz13(8:17);
team2data_Nozz13 = team2data.Nozz13(7:16);
team1data_Nozz13 = team1data.Nozz13(8:17);

%% Nozz14 [ bar ]

team5data_Nozz14 = team5data.Nozz14(8:16);
team4data_Nozz14 = team4data.Nozz14(8:17);
team3data_Nozz14 = team3data.Nozz14(8:17);
team2data_Nozz14 = team2data.Nozz14(7:16);
team1data_Nozz14 = team1data.Nozz14(8:17);

%% Nozz15 [ bar ]

team5data_Nozz15 = team5data.Nozz15(8:16);
team4data_Nozz15 = team4data.Nozz15(8:17);
team3data_Nozz15 = team3data.Nozz15(8:17);
team2data_Nozz15 = team2data.Nozz15(7:16);
team1data_Nozz15 = team1data.Nozz15(8:17);

%% Nozz16 [ bar ]

team5data_Nozz16 = team5data.Nozz16(8:16);
team4data_Nozz16 = team4data.Nozz16(8:17);
team3data_Nozz16 = team3data.Nozz16(8:17);
team2data_Nozz16 = team2data.Nozz16(7:16);
team1data_Nozz16 = team1data.Nozz16(8:17);

%% Nozz17 [ bar ]

team5data_Nozz17 = team5data.Nozz17(8:16);
team4data_Nozz17 = team4data.Nozz17(8:17);
team3data_Nozz17 = team3data.Nozz17(8:17);
team2data_Nozz17 = team2data.Nozz17(7:16);
team1data_Nozz17 = team1data.Nozz17(8:17);

%% Nozz18 [ bar ]

team5data_Nozz18 = team5data.Nozz18(8:16);
team4data_Nozz18 = team4data.Nozz18(8:17);
team3data_Nozz18 = team3data.Nozz18(8:17);
team2data_Nozz18 = team2data.Nozz18(7:16);
team1data_Nozz18 = team1data.Nozz18(8:17);

%% Nozz19 [ bar ]

team5data_Nozz19 = team5data.Nozz19(8:16);
team4data_Nozz19 = team4data.Nozz19(8:17);
team3data_Nozz19 = team3data.Nozz19(8:17);
team2data_Nozz19 = team2data.Nozz19(7:16);
team1data_Nozz19 = team1data.Nozz19(8:17);



%% Nozz20 [ bar ]

team5data_Nozz20 = team5data.Nozz20(8:16);
team4data_Nozz20 = team4data.Nozz20(8:17);
team3data_Nozz20 = team3data.Nozz20(8:17);
team2data_Nozz20 = team2data.Nozz20(7:16);
team1data_Nozz20 = team1data.Nozz20(8:17);

%% Nozz21 [ bar ]

team5data_Nozz21 = team5data.Nozz21(8:16);
team4data_Nozz21 = team4data.Nozz21(8:17);
team3data_Nozz21 = team3data.Nozz21(8:17);
team2data_Nozz21 = team2data.Nozz21(7:16);
team1data_Nozz21 = team1data.Nozz21(8:17);

%% Nozz22 [ bar ]

team5data_Nozz22 = team5data.Nozz22(8:16);
team4data_Nozz22 = team4data.Nozz22(8:17);
team3data_Nozz22 = team3data.Nozz22(8:17);
team2data_Nozz22 = team2data.Nozz22(7:16);
team1data_Nozz22 = team1data.Nozz22(8:17);

%% Nozz23 [ bar ]

team5data_Nozz23 = team5data.Nozz23(8:16);
team4data_Nozz23 = team4data.Nozz23(8:17);
team3data_Nozz23 = team3data.Nozz23(8:17);
team2data_Nozz23 = team2data.Nozz23(7:16);
team1data_Nozz23 = team1data.Nozz23(8:17);

%% Nozz24 [ bar ]

team5data_Nozz24 = team5data.Nozz24(8:16);
team4data_Nozz24 = team4data.Nozz24(8:17);
team3data_Nozz24 = team3data.Nozz24(8:17);
team2data_Nozz24 = team2data.Nozz24(7:16);
team1data_Nozz24 = team1data.Nozz24(8:17);


%% Nozz25 [ bar ]

team5data_Nozz25 = team5data.Nozz25(8:16);
team4data_Nozz25 = team4data.Nozz25(8:17);
team3data_Nozz25 = team3data.Nozz25(8:17);
team2data_Nozz25 = team2data.Nozz25(7:16);
team1data_Nozz25 = team1data.Nozz25(8:17);

%% Nozz26 [ bar ]

team5data_Nozz26 = team5data.Nozz26(8:16);
team4data_Nozz26 = team4data.Nozz26(8:17);
team3data_Nozz26 = team3data.Nozz26(8:17);
team2data_Nozz26 = team2data.Nozz26(7:16);
team1data_Nozz26 = team1data.Nozz26(8:17);


%% Nozz27 [ bar ]

team5data_Nozz27 = team5data.Nozz27(8:16);
team4data_Nozz27 = team4data.Nozz27(8:17);
team3data_Nozz27 = team3data.Nozz27(8:17);
team2data_Nozz27 = team2data.Nozz27(7:16);
team1data_Nozz27 = team1data.Nozz27(8:17);

%% Nozz28 [ bar ]

team5data_Nozz28 = team5data.Nozz28(8:16);
team4data_Nozz28 = team4data.Nozz28(8:17);
team3data_Nozz28 = team3data.Nozz28(8:17);
team2data_Nozz28 = team2data.Nozz28(7:16);
team1data_Nozz28 = team1data.Nozz28(8:17);

%% Nozz29 [ bar ]

team5data_Nozz29 = team5data.Nozz29(8:16);
team4data_Nozz29 = team4data.Nozz29(8:17);
team3data_Nozz29 = team3data.Nozz29(8:17);
team2data_Nozz29 = team2data.Nozz29(7:16);
team1data_Nozz29 = team1data.Nozz29(8:17);

%% Nozz30 [ bar ]

team5data_Nozz30 = team5data.Nozz30(8:16);
team4data_Nozz30 = team4data.Nozz30(8:17);
team3data_Nozz30 = team3data.Nozz30(8:17);
team2data_Nozz30 = team2data.Nozz30(7:16);
team1data_Nozz30 = team1data.Nozz30(8:17);

%% Nozz31 [ bar ]

team5data_Nozz31 = team5data.Nozz31(8:16);
team4data_Nozz31 = team4data.Nozz31(8:17);
team3data_Nozz31 = team3data.Nozz31(8:17);
team2data_Nozz31 = team2data.Nozz31(7:16);
team1data_Nozz31 = team1data.Nozz31(8:17);

%% 

% Equation 44 Isentropic Flow

% p = TS5
% pt - P0

p(1) = team1data_TS5 
p(2) = team2data_TS5
p(3) = team1data_TS5
p(4) = team2data_TS5
p(5) = team1data_TS5

%% Transducers

TsLoc = [-7, -5, -3, -1, 1, 3, 5, 7, 13, 20, 26, 32.5, 37.5, 42.5, 46, 48.5, 50, 51.5, 53, 54, 55.5, 57, 58, 59, 60.5...
    61.5, 63, 64, 65, 66.5, 67.5, 69, 70, 71.5, 73, 75, 79, 82, 87.5];

% Mach 3.6 Team 5

pressureAtLoc5 = [];
pressureAtLoc5(1) = team5data_TS1(9);
pressureAtLoc5(2) = team5data_TS2(9);
pressureAtLoc5(3) = team5data_TS3(9);
pressureAtLoc5(4) = team5data_TS4(9);
pressureAtLoc5(5) = team5data_TS5(9);
pressureAtLoc5(6) = team5data_TS6(9);
pressureAtLoc5(7) = team5data_TS7(9);
pressureAtLoc5(8) = team5data_TS8(9);

pressureAtLoc5(9) = team5data_Nozz31(9);
pressureAtLoc5(10) = team5data_Nozz30(9);
pressureAtLoc5(11) = team5data_Nozz29(9);
pressureAtLoc5(12) = team5data_Nozz28(9);
pressureAtLoc5(13) = team5data_Nozz27(9);
pressureAtLoc5(14) = team5data_Nozz26(9);
pressureAtLoc5(15) = team5data_Nozz25(9);
pressureAtLoc5(16) = team5data_Nozz24(9);
pressureAtLoc5(17) = team5data_Nozz23(9);
pressureAtLoc5(18) = team5data_Nozz22(9);
pressureAtLoc5(19) = team5data_Nozz21(9);
pressureAtLoc5(20) = team5data_Nozz20(9);
pressureAtLoc5(21) = team5data_Nozz19(9);
pressureAtLoc5(22) = team5data_Nozz18(9);
pressureAtLoc5(23) = team5data_Nozz17(9);
pressureAtLoc5(24) = team5data_Nozz16(9);
pressureAtLoc5(25) = team5data_Nozz15(9);
pressureAtLoc5(26) = team5data_Nozz14(9);
pressureAtLoc5(27) = team5data_Nozz13(9);
pressureAtLoc5(28) = team5data_Nozz12(9);
pressureAtLoc5(29) = team5data_Nozz11(9);
pressureAtLoc5(30) = team5data_Nozz10(9);
pressureAtLoc5(31) = team5data_Nozz9(9);
pressureAtLoc5(32) = team5data_Nozz8(9);
pressureAtLoc5(33) = team5data_Nozz7(9);
pressureAtLoc5(34) = team5data_Nozz6(9);
pressureAtLoc5(35) = team5data_Nozz5(9);
pressureAtLoc5(36) = team5data_Nozz4(9);
pressureAtLoc5(37) = team5data_Nozz3(9);
pressureAtLoc5(38) = team5data_Nozz2(9);
pressureAtLoc5(39) = team5data_Nozz1(9);

% Mach 3.2 Team 4

pressureAtLoc4 = [];
pressureAtLoc4(1) = team4data_TS1(10);
pressureAtLoc4(2) = team4data_TS2(10);
pressureAtLoc4(3) = team4data_TS3(10);
pressureAtLoc4(4) = team4data_TS4(10);
pressureAtLoc4(5) = team4data_TS5(10);
pressureAtLoc4(6) = team4data_TS6(10);
pressureAtLoc4(7) = team4data_TS7(10);
pressureAtLoc4(8) = team4data_TS8(10);

pressureAtLoc4(9) = team4data_Nozz31(10);
pressureAtLoc4(10) = team4data_Nozz30(10);
pressureAtLoc4(11) = team4data_Nozz29(10);
pressureAtLoc4(12) = team4data_Nozz28(10);
pressureAtLoc4(13) = team4data_Nozz27(10);
pressureAtLoc4(14) = team4data_Nozz26(10);
pressureAtLoc4(15) = team4data_Nozz25(10);
pressureAtLoc4(16) = team4data_Nozz24(10);
pressureAtLoc4(17) = team4data_Nozz23(10);
pressureAtLoc4(18) = team4data_Nozz22(10);
pressureAtLoc4(19) = team4data_Nozz21(10);
pressureAtLoc4(20) = team4data_Nozz20(10);
pressureAtLoc4(21) = team4data_Nozz19(10);
pressureAtLoc4(22) = team4data_Nozz18(10);
pressureAtLoc4(23) = team4data_Nozz17(10);
pressureAtLoc4(24) = team4data_Nozz16(10);
pressureAtLoc4(25) = team4data_Nozz15(10);
pressureAtLoc4(26) = team4data_Nozz14(10);
pressureAtLoc4(27) = team4data_Nozz13(10);
pressureAtLoc4(28) = team4data_Nozz12(10);
pressureAtLoc4(29) = team4data_Nozz11(10);
pressureAtLoc4(30) = team4data_Nozz10(10);
pressureAtLoc4(31) = team4data_Nozz9(10);
pressureAtLoc4(32) = team4data_Nozz8(10);
pressureAtLoc4(33) = team4data_Nozz7(10);
pressureAtLoc4(34) = team4data_Nozz6(10);
pressureAtLoc4(35) = team4data_Nozz5(10);
pressureAtLoc4(36) = team4data_Nozz4(10);
pressureAtLoc4(37) = team4data_Nozz3(10);
pressureAtLoc4(38) = team4data_Nozz2(10);
pressureAtLoc4(39) = team4data_Nozz1(10);

% Mach 2.8 Team 3

pressureAtLoc3 = [];
pressureAtLoc3(1) = team3data_TS1(10);
pressureAtLoc3(2) = team3data_TS2(10);
pressureAtLoc3(3) = team3data_TS3(10);
pressureAtLoc3(4) = team3data_TS4(10);
pressureAtLoc3(5) = team3data_TS5(10);
pressureAtLoc3(6) = team3data_TS6(10);
pressureAtLoc3(7) = team3data_TS7(10);
pressureAtLoc3(8) = team3data_TS8(10);

pressureAtLoc3(9) = team3data_Nozz31(10);
pressureAtLoc3(10) = team3data_Nozz30(10);
pressureAtLoc3(11) = team3data_Nozz29(10);
pressureAtLoc3(12) = team3data_Nozz28(10);
pressureAtLoc3(13) = team3data_Nozz27(10);
pressureAtLoc3(14) = team3data_Nozz26(10);
pressureAtLoc3(15) = team3data_Nozz25(10);
pressureAtLoc3(16) = team3data_Nozz24(10);
pressureAtLoc3(17) = team3data_Nozz23(10);
pressureAtLoc3(18) = team3data_Nozz22(10);
pressureAtLoc3(19) = team3data_Nozz21(10);
pressureAtLoc3(20) = team3data_Nozz20(10);
pressureAtLoc3(21) = team3data_Nozz19(10);
pressureAtLoc3(22) = team3data_Nozz18(10);
pressureAtLoc3(23) = team3data_Nozz17(10);
pressureAtLoc3(24) = team3data_Nozz16(10);
pressureAtLoc3(25) = team3data_Nozz15(10);
pressureAtLoc3(26) = team3data_Nozz14(10);
pressureAtLoc3(27) = team3data_Nozz13(10);
pressureAtLoc3(28) = team3data_Nozz12(10);
pressureAtLoc3(29) = team3data_Nozz11(10);
pressureAtLoc3(30) = team3data_Nozz10(10);
pressureAtLoc3(31) = team3data_Nozz9(10);
pressureAtLoc3(32) = team3data_Nozz8(10);
pressureAtLoc3(33) = team3data_Nozz7(10);
pressureAtLoc3(34) = team3data_Nozz6(10);
pressureAtLoc3(35) = team3data_Nozz5(10);
pressureAtLoc3(36) = team3data_Nozz4(10);
pressureAtLoc3(37) = team3data_Nozz3(10);
pressureAtLoc3(38) = team3data_Nozz2(10);
pressureAtLoc3(39) = team3data_Nozz1(10);

% Mach 2.4 Team 2

pressureAtLoc2 = [];
pressureAtLoc2(1) = team2data_TS1(10);
pressureAtLoc2(2) = team2data_TS2(10);
pressureAtLoc2(3) = team2data_TS3(10);
pressureAtLoc2(4) = team2data_TS4(10);
pressureAtLoc2(5) = team2data_TS5(10);
pressureAtLoc2(6) = team2data_TS6(10);
pressureAtLoc2(7) = team2data_TS7(10);
pressureAtLoc2(8) = team2data_TS8(10);

pressureAtLoc2(9) = team2data_Nozz31(10);
pressureAtLoc2(10) = team2data_Nozz30(10);
pressureAtLoc2(11) = team2data_Nozz29(10);
pressureAtLoc2(12) = team2data_Nozz28(10);
pressureAtLoc2(13) = team2data_Nozz27(10);
pressureAtLoc2(14) = team2data_Nozz26(10);
pressureAtLoc2(15) = team2data_Nozz25(10);
pressureAtLoc2(16) = team2data_Nozz24(10);
pressureAtLoc2(17) = team2data_Nozz23(10);
pressureAtLoc2(18) = team2data_Nozz22(10);
pressureAtLoc2(19) = team2data_Nozz21(10);
pressureAtLoc2(20) = team2data_Nozz20(10);
pressureAtLoc2(21) = team2data_Nozz19(10);
pressureAtLoc2(22) = team2data_Nozz18(10);
pressureAtLoc2(23) = team2data_Nozz17(10);
pressureAtLoc2(24) = team2data_Nozz16(10);
pressureAtLoc2(25) = team2data_Nozz15(10);
pressureAtLoc2(26) = team2data_Nozz14(10);
pressureAtLoc2(27) = team2data_Nozz13(10);
pressureAtLoc2(28) = team2data_Nozz12(10);
pressureAtLoc2(29) = team2data_Nozz11(10);
pressureAtLoc2(30) = team2data_Nozz10(10);
pressureAtLoc2(31) = team2data_Nozz9(10);
pressureAtLoc2(32) = team2data_Nozz8(10);
pressureAtLoc2(33) = team2data_Nozz7(10);
pressureAtLoc2(34) = team2data_Nozz6(10);
pressureAtLoc2(35) = team2data_Nozz5(10);
pressureAtLoc2(36) = team2data_Nozz4(10);
pressureAtLoc2(37) = team2data_Nozz3(10);
pressureAtLoc2(38) = team2data_Nozz2(10);
pressureAtLoc2(39) = team2data_Nozz1(10);

% Mach 1.8 Team 1

pressureAtLoc1 = [];
pressureAtLoc1(1) = team1data_TS1(10);
pressureAtLoc1(2) = team1data_TS2(10);
pressureAtLoc1(3) = team1data_TS3(10);
pressureAtLoc1(4) = team1data_TS4(10);
pressureAtLoc1(5) = team1data_TS5(10);
pressureAtLoc1(6) = team1data_TS6(10);
pressureAtLoc1(7) = team1data_TS7(10);
pressureAtLoc1(8) = team1data_TS8(10);

pressureAtLoc1(9) = team1data_Nozz31(10);
pressureAtLoc1(10) = team1data_Nozz30(10);
pressureAtLoc1(11) = team1data_Nozz29(10);
pressureAtLoc1(12) = team1data_Nozz28(10);
pressureAtLoc1(13) = team1data_Nozz27(10);
pressureAtLoc1(14) = team1data_Nozz26(10);
pressureAtLoc1(15) = team1data_Nozz25(10);
pressureAtLoc1(16) = team1data_Nozz24(10);
pressureAtLoc1(17) = team1data_Nozz23(10);
pressureAtLoc1(18) = team1data_Nozz22(10);
pressureAtLoc1(19) = team1data_Nozz21(10);
pressureAtLoc1(20) = team1data_Nozz20(10);
pressureAtLoc1(21) = team1data_Nozz19(10);
pressureAtLoc1(22) = team1data_Nozz18(10);
pressureAtLoc1(23) = team1data_Nozz17(10);
pressureAtLoc1(24) = team1data_Nozz16(10);
pressureAtLoc1(25) = team1data_Nozz15(10);
pressureAtLoc1(26) = team1data_Nozz14(10);
pressureAtLoc1(27) = team1data_Nozz13(10);
pressureAtLoc1(28) = team1data_Nozz12(10);
pressureAtLoc1(29) = team1data_Nozz11(10);
pressureAtLoc1(30) = team1data_Nozz10(10);
pressureAtLoc1(31) = team1data_Nozz9(10);
pressureAtLoc1(32) = team1data_Nozz8(10);
pressureAtLoc1(33) = team1data_Nozz7(10);
pressureAtLoc1(34) = team1data_Nozz6(10);
pressureAtLoc1(35) = team1data_Nozz5(10);
pressureAtLoc1(36) = team1data_Nozz4(10);
pressureAtLoc1(37) = team1data_Nozz3(10);
pressureAtLoc1(38) = team1data_Nozz2(10);
pressureAtLoc1(39) = team1data_Nozz1(10);

% Converting to psi:
pressureAtLoc1 = pressureAtLoc1 * 14.50377;
pressureAtLoc2 = pressureAtLoc2 * 14.50377;
pressureAtLoc3 = pressureAtLoc3 * 14.50377;
pressureAtLoc4 = pressureAtLoc4 * 14.50377;
pressureAtLoc5 = pressureAtLoc5 * 14.50377;

plot(TsLoc, pressureAtLoc5, 'LineWidth', 1.5)
hold on
plot(TsLoc, pressureAtLoc4, 'LineWidth', 1.5)
plot(TsLoc, pressureAtLoc3, 'LineWidth', 1.5)
plot(TsLoc, pressureAtLoc2, 'LineWidth', 1.5)
plot(TsLoc, pressureAtLoc1, 'LineWidth', 1.5)
legend('Mach 3.6', 'Mach 3.2', 'Mach 2.8', 'Mach 2.4', 'Mach 1.8')
xlabel('Transducer Location (in)')
ylabel('Pressure (Psi)')
title('Pressure vs. Transducer Location')
grid on
hold off

%% Functions

%%%%% Plotting %%%%%

Mnom = [1.8, 2.4, 2.8, 3.2, 3.6];
MFMS = [1.758, 2.29, 2.679, 3.073, 3.466];

team1data_P0 = team1data_P0 * 14.504;
team2data_P0 = team2data_P0 * 14.504;
team3data_P0 = team3data_P0 * 14.504;
team4data_P0 = team4data_P0 * 14.504;
team5data_P0 = team5data_P0 * 14.504;

team1data_P_tank = team1data_P_tank * 14.504;
team2data_P_tank = team2data_P_tank * 14.504;
team3data_P_tank = team3data_P_tank * 14.504;
team4data_P_tank = team4data_P_tank * 14.504;
team5data_P_tank = team5data_P_tank * 14.504;

MIsen = [isenFlow(team1data_P_P0(9)), isenFlow(team2data_P_P0(7)), isenFlow(team3data_P_P0(8))...
    isenFlow(team4data_P_P0(10)), isenFlow(team5data_P_P0(9))];

MNormal = [normalShock(team1data_P0(9), team1data_P_tank(9), MFMS(1)),...
           normalShock(team2data_P0(7), team2data_P_tank(7), MFMS(2)),...
           normalShock(team3data_P0(8), team3data_P_tank(8), MFMS(3)),...
           normalShock(team4data_P0(10), team4data_P_tank(10), MFMS(4)),...
           normalShock(team5data_P0(9), team5data_P_tank(9), MFMS(5))];

MRay = [ray(team1data_P_P0(9)), ray(team2data_P_P0(7)), ray(team3data_P_P0(8)),...
        ray(team4data_P_P0(10)), ray(team5data_P_P0(9))];

MMuAngle = [shockAngles(33.75), shockAngles(24.624), shockAngles(20.925), shockAngles(18.21), shockAngles(16.128)];

figure;
hold on
plot(Mnom, MFMS, 'linewidth', 1.5, 'Marker', 'o');
plot(Mnom, MIsen, 'lineWidth', 1.5, 'Marker', 'o');
plot(Mnom, MNormal, 'linewidth', 1.5, 'Marker', 'o');
plot(Mnom, MRay, 'linewidth', 1.5, 'Marker', 'o');
plot(Mnom, MMuAngle, 'LineWidth', 1.5, 'Marker', 'o')
legend('FMS Mach#', 'Isentropic Flow Mach#', 'Normal Shock Mach#', 'Rayleigh Mach#', 'Shock Angle Mach#')
xlabel('Mach # (Nominal)')
ylabel('Mach # (Calculated)')
title('Mach # Nominal vs. Calculated')
grid on

%normalShock(team1data_P_tank(9), team1data_P0(9)) 

pOverPt = team1data_TS5/team1data_P0

function Mach = shockAngles(mu)
    Mach = 1 / sind(mu);
end



function Mach = normalShock(pt2, pt1, M_guess)
    gamma = 1.4;
    pt2_over_pt1 = pt2/pt1;
    func = @(M) pt2_over_pt1 - ...
           ((2 * gamma * M^2 - (gamma - 1)) * ((gamma - 1) * M^2 + 2)^(gamma / (gamma - 1))) / ...
           (2 * gamma * M^2 - gamma + 1)^((gamma + 1) / (gamma - 1));
    Mach = fzero(func, M_guess);
    disp(Mach)
end

function Mach = ray(pOverP0)
    syms f(M)
    f(M) = (((6*M^2) / 5)^(7/2)) * ((6/(7*M^2 - 1))^(5/2)) - (1/pOverP0);
    M = vpasolve(f);
    Mach = double(-M);
end





