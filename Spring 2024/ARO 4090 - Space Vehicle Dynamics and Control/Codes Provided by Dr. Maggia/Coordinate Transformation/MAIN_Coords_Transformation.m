%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Marco Maggia, January 2023.        %
% Aerospace Engineering Department                  %
% California Polytechnic State University, Pomona   %
% Space Vehicle Dynamics & Control - ARO 4090       %
% Spring '23                                        %         
%                                                   %
% Before sharing the code,please ask for permission.%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Coordinates Transformation b/w Reference Frames:
% I = {O,i1,i2,i3}
% B = {O,b1,b2,b3}
% via 3 elementary rotations about the local x,y,z axes.
%
% The user can specify the rotation sequence:
% (rot1, rot2, rot3)
% and the values of the angles (in degrees):
% (gamma, beta, alpha).
% 
% Example:
% Rotation sequence 3-1-2 of Euler Angles 30,-50,100
%
% rot1 = 3; rot2 = 1; rot3 = 2;
% gamma_F = 30; gamma_F = -50; gamma_F = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
close all
%% %%%%%%%%%%%%%%%%%%% EDITABLE %%%%%%%%%%%%%%%%%%%%%

%~~~~~~~~~~~~~~~ Euler Angles ~~~~~~~~~~~~~~~~~~~~~~~
% Rotation Sequence (e.g. 3-2-1, 3-1-3, 2-3-1)
rot1 = 1; rot2 = 3; rot3 = 2;
% First Rotation Angle
gamma_F = 40;  % [deg]
% Second Rotation Angle
beta_F  = 15;   % [deg]
% Third Rotation Angle
alpha_F = 27;    % [deg]

%~~~~~~~~~ Visualization Options ~~~~~~~~~~~~~~~~~~~~
% Animation (on/off)
animation  = 'on';

%%%%%%%%%%%%%%%%%%%% DO NOT EDIT %%%%%%%%%%%%%%%%%%%%%
% Rotation Matrices (Rotating RF, not vectors)
% 1st Rotation
if rot1==1
    R1st_F = R1(gamma_F); 
elseif rot1==2
    R1st_F = R2(gamma_F); 
elseif rot1==3
    R1st_F = R3(gamma_F);
end
% 2nd Rotation
if rot2==1
    R2nd_F = R1(beta_F); 
elseif rot2==2
    R2nd_F = R2(beta_F); 
elseif rot2==3
    R2nd_F = R3(beta_F);
end
% 3rd Rotation
if rot3==1
    R3rd_F = R1(alpha_F); 
elseif rot3==2
    R3rd_F = R2(alpha_F); 
elseif rot3==3
    R3rd_F = R3(alpha_F);
end

R_BI = R3rd_F*R2nd_F*R1st_F;
R_IB = R_BI';

O  = [0,0,0]';
I1 = [1,0,0]';
I2 = [0,1,0]';
I3 = [0,0,1]';
 
if gamma_F>0
    gamma = [0:1:gamma_F-1,gamma_F];
elseif gamma_F<0
    gamma = [0:-1:gamma_F+1,gamma_F];
else
    gamma = zeros(1,2);
end
if beta_F>0
    beta = [0:1:beta_F-1,beta_F];
elseif beta_F<0
    beta = [0:-1:beta_F+1,beta_F];
else
    beta = zeros(1,2);
end
if alpha_F>0
    alpha = [0:1:alpha_F-1,alpha_F];
elseif alpha_F<0
    alpha = [0:-1:alpha_F+1,alpha_F];
else
    alpha = zeros(1,2);
end

% Viewing Angles
Az = 120;
El = 30;

a = 1.25;
lim = 1.5;
    
figure(1),hold on
set(gcf,'units','normalized','position',[0 0 0.5 0.9])
set(gca,'Color',[0,0,0])
set(gca,'xTick',[],'yTick',[],'zTick',[])
view([Az,El])
axis('equal')
xlim([-lim,lim])
ylim([-lim,lim])
zlim([-lim,lim])
tlt = [num2str(rot1),'-',num2str(rot2),'-',num2str(rot3),'  Rotation Sequence'];
title(tlt)

% I-RF
arrow3(O',[.001,0,0],'b',0.1);%Bug Fixer
l_I1 = line(1.25*[0,I1(1)],1.25*[0,I1(2)],1.25*[0,I1(3)],'linewidth',3,'color',[1,.8,0]);
l_I2 = line(1.25*[0,I2(1)],1.25*[0,I2(2)],1.25*[0,I2(3)],'linewidth',3,'color',[1,.8,0]);
l_I3 = line(1.25*[0,I3(1)],1.25*[0,I3(2)],1.25*[0,I3(3)],'linewidth',3,'color',[1,.8,0]);  
arr_I1 = arrow3(O',1.5*I1','^q',1.5,[],[],0.9,0.7);
arr_I2 = arrow3(O',1.5*I2','^q',1.5,[],[],0.9,0.7);
arr_I3 = arrow3(O',1.5*I3','^q',1.5,[],[],0.9,0.7);
text(1.7*I1(1),0,0.05,'$\mathbf{\hat{i}_1}$','Color',[1,.8,0],'FontSize',18,'interpreter','latex');
text(0,1.7*I2(2),0.05,'$\mathbf{\hat{i}_2}$','Color',[1,.8,0],'FontSize',18,'interpreter','latex');
text(0,0,1.7*I3(3),'$\mathbf{\hat{i}_3}$','Color',[1,.8,0],'FontSize',18,'interpreter','latex');


% Press to continue
if strcmp(animation,'on')
    if rot1==1
        input('Press Enter to visualize "gamma" rotation about the local x-axis.')
    elseif rot1==2
        input('Press Enter to visualize "gamma" rotation about the local y-axis.')
    elseif rot1==3
        input('Press Enter to visualize "gamma" rotation about the local z-axis.')
    end
end

% Rotating Vectors, not RF! (Transpose Matrices wrt what written in the notes)
%% Gamma Angle
N_O = size(gamma,2);
R1st = zeros(3,3,N_O);
Om1 = zeros(3,N_O);
Om2 = zeros(3,N_O);
Om3 = zeros(3,N_O);
for j=1:N_O
    figure(1),hold on
    if rot1==1
        R1st(:,:,j) = R1(gamma(j))'; 
    elseif rot1==2
        R1st(:,:,j) = R2(gamma(j))'; 
    elseif rot1==3
        R1st(:,:,j) = R3(gamma(j))';
    end
    Om1(:,j) = R1st(:,:,j)*I1;
    Om2(:,j) = R1st(:,:,j)*I2;
    Om3(:,j) = R1st(:,:,j)*I3;

    if strcmp(animation,'on')
        l_Om1 = line([0,Om1(1,j)],[0,Om1(2,j)],[0,Om1(3,j)],'linewidth',2,'color',[1,.8-.8*(j-1)/(N_O-1),0]);
        l_Om2 = line([0,Om2(1,j)],[0,Om2(2,j)],[0,Om2(3,j)],'linewidth',2,'color',[1,.8-.8*(j-1)/(N_O-1),0]);
        l_Om3 = line([0,Om3(1,j)],[0,Om3(2,j)],[0,Om3(3,j)],'linewidth',2,'color',[1,.8-.8*(j-1)/(N_O-1),0]);
       
        if rot1==1
            l_Om4 = plot3(Om2(1,1:j),Om2(2,1:j),Om2(3,1:j),'linewidth',1,'color',[1,.8-.8*(j-1)/(N_O-1),0],'linestyle','-');
        elseif rot1==2
            l_Om4 = plot3(Om3(1,1:j),Om3(2,1:j),Om3(3,1:j),'linewidth',1,'color',[1,.8-.8*(j-1)/(N_O-1),0],'linestyle','-');
        elseif rot1==3
            l_Om4 = plot3(Om1(1,1:j),Om1(2,1:j),Om1(3,1:j),'linewidth',1,'color',[1,.8-.8*(j-1)/(N_O-1),0],'linestyle','-');
        end
        if j<N_O
            pause(0.1/N_O)
            delete(l_Om1);
            delete(l_Om2);
            delete(l_Om3);
            delete(l_Om4);
        end
    end 
end
if rot1==1
    plot3(Om2(1,:),Om2(2,:),Om2(3,:),'linewidth',1,'color',[1,0,0],'linestyle','-');
    line([0,Om2(1,1)]  ,[0,Om2(2,1)]  ,[0,Om2(3,1)]  ,'linewidth',1,'color',[1,0,0],'linestyle','-');
    line([0,Om2(1,end)],[0,Om2(2,end)],[0,Om2(3,end)],'linewidth',1,'color',[1,0,0],'linestyle','-');
    if rem(N_O,2)==0
        text( 1.1*Om2(1,end/2), 1.1*Om2(2,end/2), 1.1*Om2(3,end/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*Om2(1,(end+1)/2), 1.1*Om2(2,(end+1)/2), 1.1*Om2(3,(end+1)/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    end
elseif rot1==2
    plot3(Om3(1,:),Om3(2,:),Om3(3,:),'linewidth',1,'color',[1,0,0],'linestyle','-');
    line([0,Om3(1,1)]  ,[0,Om3(2,1)]  ,[0,Om3(3,1)]  ,'linewidth',1,'color',[1,0,0],'linestyle','-');
    line([0,Om3(1,end)],[0,Om3(2,end)],[0,Om3(3,end)],'linewidth',1,'color',[1,0,0],'linestyle','-');
    if rem(N_O,2)==0
        text( 1.1*Om3(1,end/2), 1.1*Om3(2,end/2), 1.1*Om3(3,end/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*Om3(1,(end+1)/2), 1.1*Om3(2,(end+1)/2), 1.1*Om3(3,(end+1)/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    end
elseif rot1==3
    plot3(Om1(1,:),Om1(2,:),Om1(3,:),'linewidth',1,'color',[1,0,0],'linestyle','-');

  
    line([0,Om1(1,1)]  ,[0,Om1(2,1)]  ,[0,Om1(3,1)]  ,'linewidth',1,'color',[1,0,0],'linestyle','-');
    line([0,Om1(1,end)],[0,Om1(2,end)],[0,Om1(3,end)],'linewidth',1,'color',[1,0,0],'linestyle','-');
    if rem(N_O,2)==0
        text( 1.1*Om1(1,end/2), 1.1*Om1(2,end/2), 1.1*Om1(3,end/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*Om1(1,(end+1)/2), 1.1*Om1(2,(end+1)/2), 1.1*Om1(3,(end+1)/2),'$\mathbf{\gamma}$','Color',[1, 0,0],'FontSize',20,'interpreter','latex');
    end
end
arr_Om1 = arrow3(O',1.1*Om1(:,end)','r',1);
arr_Om2 = arrow3(O',1.1*Om2(:,end)','r',1);
arr_Om3 = arrow3(O',1.1*Om3(:,end)','r',1);
l_Om5 = text(1.2*Om1(1,end),1.2*Om1(2,end),1.2*Om1(3,end),'$\mathbf{1}$','Color',[1,0,0],'FontSize',16,'interpreter','latex');
l_Om6 = text(1.2*Om2(1,end),1.2*Om2(2,end),1.2*Om2(3,end),'$\mathbf{2}$','Color',[1,0,0],'FontSize',16,'interpreter','latex');
l_Om7 = text(1.2*Om3(1,end),1.2*Om3(2,end),1.2*Om3(3,end),'$\mathbf{3}$','Color',[1,0,0],'FontSize',16,'interpreter','latex');

%% Beta Angle
% Press to continue
if strcmp(animation,'on')
    if rot2==1
        input('Press Enter to visualize "beta" rotation about the local x-axis.')
    elseif rot2==2
        input('Press Enter to visualize "beta" rotation about the local y-axis.')
    elseif rot2==3
        input('Press Enter to visualize "beta" rotation about the local z-axis.')
    end
end
N_i = size(beta,2);
R2nd = zeros(3,3,N_i);
i1 = zeros(3,N_i);
i2 = zeros(3,N_i);
i3 = zeros(3,N_i);
for j=1:N_i
    figure(1),hold on                   
    if rot2==1
        R2nd(:,:,j) = R1(beta(j))'; 
    elseif rot2==2
        R2nd(:,:,j) = R2(beta(j))'; 
    elseif rot2==3
        R2nd(:,:,j) = R3(beta(j))';
    end
    i1(:,j) = R1st(:,:,end)*R2nd(:,:,j)*I1;
    i2(:,j) = R1st(:,:,end)*R2nd(:,:,j)*I2;
    i3(:,j) = R1st(:,:,end)*R2nd(:,:,j)*I3;   
    if strcmp(animation,'on')
        l_i1 = line([0,i1(1,j)],[0,i1(2,j)],[0,i1(3,j)],'linewidth',2,'linestyle','-','color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)]);
        l_i2 = line([0,i2(1,j)],[0,i2(2,j)],[0,i2(3,j)],'linewidth',2,'linestyle','-','color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)]);
        l_i3 = line([0,i3(1,j)],[0,i3(2,j)],[0,i3(3,j)],'linewidth',2,'linestyle','-','color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)]);
        if rot2==1
            l_i4 = plot3(i2(1,1:j),i2(2,1:j),i2(3,1:j),'linewidth',1,'color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)],'linestyle','-');
        elseif rot2==2
            l_i4 = plot3(i3(1,1:j),i3(2,1:j),i3(3,1:j),'linewidth',1,'color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)],'linestyle','-');
        elseif rot2==3
            l_i4 = plot3(i1(1,1:j),i1(2,1:j),i1(3,1:j),'linewidth',1,'color',[1-1*(j-1)/(N_i-1),.6*(j-1)/(N_i-1),(j-1)/(N_i-1)],'linestyle','-');
        end
        if j<N_i
            pause(0.1/N_i)
            delete(l_i1);
            delete(l_i2);
            delete(l_i3);
            delete(l_i4);    
        end
    end
end
if rot2==1
    plot3(i2(1,:),i2(2,:),i2(3,:),'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i2(1,1)]  ,[0,i2(2,1)]  ,[0,i2(3,1)]  ,'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i2(1,end)],[0,i2(2,end)],[0,i2(3,end)],'linewidth',1,'color',[0,.6,1],'linestyle','-');
    if rem(N_i,2)==0
        text( 1.1*i2(1,end/2), 1.1*i2(2,end/2), 1.1*i2(3,end/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*i2(1,(end+1)/2), 1.1*i2(2,(end+1)/2), 1.1*i2(3,(end+1)/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    end
elseif rot2==2
    plot3(i3(1,:),i3(2,:),i3(3,:),'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i3(1,1)]  ,[0,i3(2,1)]  ,[0,i3(3,1)]  ,'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i3(1,end)],[0,i3(2,end)],[0,i3(3,end)],'linewidth',1,'color',[0,.6,1],'linestyle','-');
    if rem(N_i,2)==0
        text( 1.1*i3(1,end/2), 1.1*i3(2,end/2), 1.1*i3(3,end/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*i3(1,(end+1)/2), 1.1*i3(2,(end+1)/2), 1.1*i3(3,(end+1)/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    end
elseif rot2==3
    plot3(i1(1,:),i1(2,:),i1(3,:),'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i1(1,1)]  ,[0,i1(2,1)]  ,[0,i1(3,1)]  ,'linewidth',1,'color',[0,.6,1],'linestyle','-');
    line([0,i1(1,end)],[0,i1(2,end)],[0,i1(3,end)],'linewidth',1,'color',[0,.6,1],'linestyle','-');
    if rem(N_i,2)==0
        text( 1.1*i1(1,end/2), 1.1*i1(2,end/2), 1.1*i1(3,end/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*i1(1,(end+1)/2), 1.1*i1(2,(end+1)/2), 1.1*i1(3,(end+1)/2),'$\mathbf{\beta}$','Color',[0,.6,1],'FontSize',20,'interpreter','latex');
    end
end
arr_i1 = arrow3(O',1.1*i1(:,end)','z',1);
arr_i2 = arrow3(O',1.1*i2(:,end)','z',1);
arr_i3 = arrow3(O',1.1*i3(:,end)','z',1);
l_i5 = text(1.2*i1(1,end),1.2*i1(2,end),1.2*i1(3,end),'$\mathbf{1}$','Color',[0,.6,1],'FontSize',16,'interpreter','latex');
l_i6 = text(1.2*i2(1,end),1.2*i2(2,end),1.2*i2(3,end),'$\mathbf{2}$','Color',[0,.6,1],'FontSize',16,'interpreter','latex');
l_i7 = text(1.2*i3(1,end),1.2*i3(2,end),1.2*i3(3,end),'$\mathbf{3}$','Color',[0,.6,1],'FontSize',16,'interpreter','latex');

%% Alpha Angle
% Press to continue
if strcmp(animation,'on')
    if rot3==1
        input('Press Enter to visualize "alpha" rotation about the local x-axis.')
    elseif rot3==2
        input('Press Enter to visualize "alpha" rotation about the local y-axis.')
    elseif rot3==3
        input('Press Enter to visualize "alpha" rotation about the local z-axis.')
    end
end
N_w = size(alpha,2);
R3rd = zeros(3,3,N_w);
w1 = zeros(3,N_w);
w2 = zeros(3,N_w);
w3 = zeros(3,N_w);
for j=1:N_w
    figure(1),hold on                 
    if rot3==1
        R3rd(:,:,j) = R1(alpha(j))'; 
    elseif rot3==2
        R3rd(:,:,j) = R2(alpha(j))'; 
    elseif rot3==3
        R3rd(:,:,j) = R3(alpha(j))';
    end
    w1(:,j) = R1st(:,:,end)*R2nd(:,:,end)*R3rd(:,:,j)*I1;
    w2(:,j) = R1st(:,:,end)*R2nd(:,:,end)*R3rd(:,:,j)*I2;
    w3(:,j) = R1st(:,:,end)*R2nd(:,:,end)*R3rd(:,:,j)*I3;
    
    if strcmp(animation,'on')
        l_w1 = line([0,w1(1,j)],[0,w1(2,j)],[0,w1(3,j)],'linewidth',2,'linestyle','-','color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)]);
        l_w2 = line([0,w2(1,j)],[0,w2(2,j)],[0,w2(3,j)],'linewidth',2,'linestyle','-','color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)]);
        l_w3 = line([0,w3(1,j)],[0,w3(2,j)],[0,w3(3,j)],'linewidth',2,'linestyle','-','color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)]);
        if rot3==1
            l_w4 = plot3(w2(1,1:j),w2(2,1:j),w2(3,1:j),'linewidth',1,'color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)],'linestyle','-');
        elseif rot3==2
            l_w4 = plot3(w3(1,1:j),w3(2,1:j),w3(3,1:j),'linewidth',1,'color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)],'linestyle','-');
        elseif rot3==3
            l_w4 = plot3(w1(1,1:j),w1(2,1:j),w1(3,1:j),'linewidth',1,'color',[0,.6+.1*(j-1)/(N_w-1),1-(j-1)/(N_w-1)],'linestyle','-');
        end
        if j<N_w
            pause(0.1/N_w)
            delete(l_w1);
            delete(l_w2);
            delete(l_w3);
            delete(l_w4);
        end
    end
end
if rot3==1
    plot3(w2(1,:),w2(2,:),w2(3,:),'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w2(1,1)]  ,[0,w2(2,1)]  ,[0,w2(3,1)]  ,'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w2(1,end)],[0,w2(2,end)],[0,w2(3,end)],'linewidth',1,'color',[0,.7,0],'linestyle','-');
    if rem(N_w,2)==0
        text( 1.1*w2(1,end/2), 1.1*w2(2,end/2), 1.1*w2(3,end/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*w2(1,(end+1)/2), 1.1*w2(2,(end+1)/2), 1.1*w2(3,(end+1)/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    end
elseif rot3==2
    plot3(w3(1,:),w3(2,:),w3(3,:),'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w3(1,1)]  ,[0,w3(2,1)]  ,[0,w3(3,1)]  ,'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w3(1,end)],[0,w3(2,end)],[0,w3(3,end)],'linewidth',1,'color',[0,.7,0],'linestyle','-');
    if rem(N_w,2)==0
        text( 1.1*w3(1,end/2), 1.1*w3(2,end/2), 1.1*w3(3,end/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*w3(1,(end+1)/2), 1.1*w3(2,(end+1)/2), 1.1*w3(3,(end+1)/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    end
elseif rot3==3
    plot3(w1(1,:),w1(2,:),w1(3,:),'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w1(1,1)]  ,[0,w1(2,1)]  ,[0,w1(3,1)]  ,'linewidth',1,'color',[0,.7,0],'linestyle','-');
    line([0,w1(1,end)],[0,w1(2,end)],[0,w1(3,end)],'linewidth',1,'color',[0,.7,0],'linestyle','-');
    if rem(N_w,2)==0
        text( 1.1*w1(1,end/2), 1.1*w1(2,end/2), 1.1*w1(3,end/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    else
        text( 1.1*w1(1,(end+1)/2), 1.1*w1(2,(end+1)/2), 1.1*w1(3,(end+1)/2),'$\mathbf{\alpha}$','Color',[0,.7,0],'FontSize',20,'interpreter','latex');
    end
end

b1 = R_IB*I1;
b2 = R_IB*I2;
b3 = R_IB*I3;

line(a*[0,b1(1)],a*[0,b1(2)],a*[0,b1(3)],'linewidth',3,'linestyle','-','color',[0,.7,0]);
line(a*[0,b2(1)],a*[0,b2(2)],a*[0,b2(3)],'linewidth',3,'linestyle','-','color',[0,.7,0]);
line(a*[0,b3(1)],a*[0,b3(2)],a*[0,b3(3)],'linewidth',3,'linestyle','-','color',[0,.7,0]);
arrow3(O',1.5*b1','^e',1.5);
arrow3(O',1.5*b2','^e',1.5);
arrow3(O',1.5*b3','^e',1.5);
text(1.7*b1(1),1.7*b1(2),1.7*b1(3),'$\mathbf{\hat{b}_1}$','Color',[0,.8,0],'FontSize',18,'interpreter','latex');
text(1.7*b2(1),1.7*b2(2),1.7*b2(3),'$\mathbf{\hat{b}_2}$','Color',[0,.8,0],'FontSize',18,'interpreter','latex');
text(1.7*b3(1),1.7*b3(2),1.7*b3(3),'$\mathbf{\hat{b}_3}$','Color',[0,.8,0],'FontSize',18,'interpreter','latex');

xlim([-lim,lim])
ylim([-lim,lim])
zlim([-lim,lim])

if strcmp(animation,'on')
    input('Press Enter to erase intermediate RF axes')
    delete(l_Om1);    delete(l_Om2);    delete(l_Om3);
    delete(l_i1);    delete(l_i2);    delete(l_i3);
    delete(l_w1);    delete(l_w2);    delete(l_w3);
end
delete(l_Om5);delete(l_Om6);delete(l_Om7);
delete(l_i5);delete(l_i6);delete(l_i7);
delete(arr_Om1);delete(arr_Om2);delete(arr_Om3);
delete(arr_i1);delete(arr_i2);delete(arr_i3);

function R1 = R1(a)
    R1 = [1,      0,       0;
          0, cosd(a),sind(a);
          0,-sind(a),cosd(a)];
end
function R2 = R2(a)
    R2 = [cosd(a),0,-sind(a);
                0,1,       0;
          sind(a),0, cosd(a)];
end
function R3 = R3(a)
    R3 = [ cosd(a),sind(a),0;
          -sind(a),cosd(a),0;
                 0,      0,1];
end