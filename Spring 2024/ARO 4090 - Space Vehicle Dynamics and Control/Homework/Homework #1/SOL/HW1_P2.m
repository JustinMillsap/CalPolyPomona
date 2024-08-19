% HW1, P2

clc;clear;close all

R_BI=[-0.17101007   0.46984631  -0.86602540
       0.98432795   0.04305861  -0.17101007
      -0.04305861  -0.88169745  -0.46984631]

%% Part(a): 3-2-1 sequence
% syms a b c real
% R_BI = simplify(R1(a)*R2(b)*R3(c))
% R_BI =
% [                       cos(b)*cos(c),                        cos(b)*sin(c),       -sin(b)]
% [cos(c)*sin(a)*sin(b) - cos(a)*sin(c), cos(a)*cos(c) + sin(a)*sin(b)*sin(c), cos(b)*sin(a)]
% [sin(a)*sin(c) + cos(a)*cos(c)*sin(b), cos(a)*sin(b)*sin(c) - cos(c)*sin(a), cos(a)*cos(b)]

a = atan2d(R_BI(2,3),R_BI(3,3));
b = asind(-R_BI(1,3));
c = atan2d(R_BI(1,2),R_BI(1,1));

fprintf('\n\nPart (a): 3-2-1 sequence\n')
fprintf('a = %.2f deg,  b = %.2f deg,  c = %.2f deg\n\n',a,b,c)

R1(a/180*pi)*R2(b/180*pi)*R3(c/180*pi)-R_BI % Check

%% Part(b): 3-2-3 sequence
% syms a b c real
% R_BI = simplify(R2(a)*R3(b)*R2(c))
% R_BI =
% [cos(a)*cos(b)*cos(c) - sin(a)*sin(c), cos(a)*sin(b), - cos(c)*sin(a) - cos(a)*cos(b)*sin(c)]
% [                      -cos(c)*sin(b),        cos(b),                          sin(b)*sin(c)]
% [cos(a)*sin(c) + cos(b)*cos(c)*sin(a), sin(a)*sin(b),   cos(a)*cos(c) - cos(b)*sin(a)*sin(c)]

a = atan2d(R_BI(3,2),R_BI(1,2));
b = acosd(R_BI(2,2));
c = atan2d(R_BI(2,3),-R_BI(2,1));

fprintf('\n\nPart (b): 2-3-2 sequence\n')
fprintf('a = %.2f deg,  b = %.2f deg,  c = %.2f deg\n\n',a,b,c)

R2(a/180*pi)*R3(b/180*pi)*R2(c/180*pi)-R_BI % Check

function R1 = R1(a)
    R1 = [1,      0,     0;
          0, cos(a),sin(a);
          0,-sin(a),cos(a)];
end
function R2 = R2(a)
    R2 = [cos(a),0,-sin(a);
               0,1,      0;
          sin(a),0, cos(a)];
end
function R3 = R3(a)
    R3 = [ cos(a),sin(a),0;
          -sin(a),cos(a),0;
                0,     0,1];
end