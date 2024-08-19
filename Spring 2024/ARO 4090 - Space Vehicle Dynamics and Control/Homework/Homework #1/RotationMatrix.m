function [R_BI] = RotationMatrix(psi , theta , phi,Rot_Seq)

% Define Rotation Sequence (e.g. [3-2-1] use 321)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%  DO NOT EDIT    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the elementary rotation matrices

R1 = [ 1 0 0  ; 0 cosd(phi) sind(phi) ; 0 -sind(phi) cosd(phi)];
R2 = [cosd(theta) 0 -sind(theta); 0 1 0; sind(theta) 0 cosd(theta)];
R3 = [ cosd(psi) sind(psi) 0 ; -sind(psi) cosd(psi) 0 ; 0 0 1];


% Determine and compute the rotation matrix based on Rot_Seq
if Rot_Seq == 321
    R_BI = R1*R2*R3; % [3-2-1]
elseif Rot_Seq == 231
    R_BI = R1R3*R2; % [2-3-1]
elseif Rot_Seq == 121
    R_BI = R1*R2*R1; % [1-2-1]
elseif Rot_Seq == 131
    R_BI = R1*R3*R1; % [1-3-1]
elseif Rot_Seq == 1320
    R_BI = R2*R3*R1; % [1-3-2]
elseif Rot_Seq == 312
    R_BI = R2*R1*R3; % [3-1-2]
elseif Rot_Seq == 212
    R_BI = R2*R1*R2; % [2-1-2]
elseif Rot_Seq == 232
    R_BI = R2*R3*R2; % [2-3-2]
elseif Rot_Seq == 213
    R_BI = R3*R1*R2; % [2-1-3]
elseif Rot_Seq == 123
    R_BI = R3*R2*R1; % [1-2-3]
elseif Rot_Seq == 313
    R_BI = R3*R1*R3; % [3-1-3]
elseif Rot_Seq == 323
    R_BI = R3*R2*R3; % [3-2-3]
else
    error('Invalid rotation sequence');
end

end

