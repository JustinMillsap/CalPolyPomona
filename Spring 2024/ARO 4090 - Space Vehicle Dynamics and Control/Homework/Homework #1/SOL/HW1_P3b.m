% HW1 - P3b
function R_BI = HW1_P3b(rot1,rot2,rot3,c,b,a)

    % INPUT: Rotation Sequence (e.g. 3-2-1, 3-1-3, 2-3-1) and Euler Angles
    % OUTPUT: Coordinate-Transformation Matrix
    
    % 1st Rotation
    if rot1==1
        R1st = R1(c); 
    elseif rot1==2
        R1st = R2(c); 
    elseif rot1==3
        R1st = R3(c);
    end
    % 2nd Rotation
    if rot2==1
        R2nd = R1(b); 
    elseif rot2==2
        R2nd = R2(b); 
    elseif rot2==3
        R2nd = R3(b);
    end
    % 3rd Rotation
    if rot3==1
        R3rd = R1(a); 
    elseif rot3==2
        R3rd = R2(a); 
    elseif rot3==3
        R3rd = R3(a);
    end
    
    R_BI = R3rd*R2nd*R1st
    
    
    function R1 = R1(a)
        R1 = [1,      0,     0;
              0, cosd(a),sind(a);
              0,-sind(a),cosd(a)];
    end
    function R2 = R2(a)
        R2 = [cosd(a),0,-sind(a);
                   0,1,      0;
              sind(a),0, cosd(a)];
    end
    function R3 = R3(a)
        R3 = [ cosd(a),sind(a),0;
              -sind(a),cosd(a),0;
                    0,     0,1];
    end
end