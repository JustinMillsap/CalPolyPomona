tspan = 0:0.1:10
x0 =[ 0 0]
[t x0] = ode23('dfuc2', tspan , x0)
x0(2)

figure(1)
hold on
plot(t,x0)  

xlabel('t')
ylabel('x')

gtext('x1')
gtext('x2')