
t = 1:30;

 w = 50*10 % Case 1
%w = 0.002*10 % Case 2
C_1 = 0.15 - (10/(100-w^2))
C_2 = 0.005
response = C_1*cos(10*t) + C_2*sin(10*t) + (100)*(1/(100*w^2))*cos(w*t)

plot(t,response)



