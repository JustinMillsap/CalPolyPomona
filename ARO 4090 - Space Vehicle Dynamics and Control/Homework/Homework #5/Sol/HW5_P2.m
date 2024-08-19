clc;clear;close all

I_CB = [10 -2 -6
        -2  4 -1
        -6 -1  5]

[R_BP,I_CP] = eig(I_CB)

% I re-arrange and change signs to the eigenvectors of I_CB 
% so that p1,p2,p3 are roughly aligned with b1,b2,b3
b1_B = [1,0,0]';
b2_B = [0,1,0]';
b3_B = [0,0,1]';

p1_B = -R_BP(:,3)
p2_B = -R_BP(:,2)
p3_B =  R_BP(:,1)

I_11 = I_CP(3,3)
I_22 = I_CP(2,2)
I_33 = I_CP(1,1)

figure(1),hold on,grid on
view([200,30])
% Body Axes
line([0,b1_B(1)],[0,b1_B(2)],[0,b1_B(3)],'linewidth',3,'color',[0.9,0,0.9]);
line([0,b2_B(1)],[0,b2_B(2)],[0,b2_B(3)],'linewidth',3,'color',[0.9,0,0.9]);
line([0,b3_B(1)],[0,b3_B(2)],[0,b3_B(3)],'linewidth',3,'color',[0.9,0,0.9]);
text(1.1*b1_B(1),1.1*b1_B(2),1.1*b1_B(3),'$\mathbf{\hat{b}_1}$','Color',[0.9,0,0.9],'FontSize',18,'interpreter','latex');
text(1.1*b2_B(1),1.1*b2_B(2),1.1*b2_B(3),'$\mathbf{\hat{b}_2}$','Color',[0.9,0,0.9],'FontSize',18,'interpreter','latex');
text(1.1*b3_B(1),1.1*b3_B(2),1.1*b3_B(3),'$\mathbf{\hat{b}_3}$','Color',[0.9,0,0.9],'FontSize',18,'interpreter','latex');
          
% Principal Axes
line([0,p1_B(1)],[0,p1_B(2)],[0,p1_B(3)],'linewidth',3,'color',[0,0.9,0]);
line([0,p2_B(1)],[0,p2_B(2)],[0,p2_B(3)],'linewidth',3,'color',[0,0.9,0]);
line([0,p3_B(1)],[0,p3_B(2)],[0,p3_B(3)],'linewidth',3,'color',[0,0.9,0]);
text(1.1*p1_B(1),1.1*p1_B(2),1.1*p1_B(3),'$\mathbf{\hat{p}_1}$','Color',[0,0.9,0],'FontSize',18,'interpreter','latex');
text(1.1*p2_B(1),1.1*p2_B(2),1.1*p2_B(3),'$\mathbf{\hat{p}_2}$','Color',[0,0.9,0],'FontSize',18,'interpreter','latex');
text(1.1*p3_B(1),1.1*p3_B(2),1.1*p3_B(3),'$\mathbf{\hat{p}_3}$','Color',[0,0.9,0],'FontSize',18,'interpreter','latex');
axis('equal')

