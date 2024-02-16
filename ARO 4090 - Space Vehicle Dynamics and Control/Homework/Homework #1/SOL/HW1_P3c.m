% HW1 - P3c
function [psi,theta,phi] = HW1_P3c(R)
    % Euler Angles
    psi   = atan2d(R(1,2),R(1,1)); % Yaw   [0,360]    deg
    theta = asind(-R(1,3));        % Pitch [-90,90]   deg
    phi   = atan2d(R(2,3),R(3,3)); % Roll  [-180,180] deg   
    if psi<0
        psi=mod(psi+360,360);
    end
    if theta==-90 || theta==90
        fprintf('Singularity encountered. Values for roll and yaw angles are not reliable.\n')
        fprintf('Quarternions should be used instead.\n\n')
    end
end