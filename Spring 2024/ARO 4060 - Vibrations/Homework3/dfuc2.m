function f = dfuc2(t,x)

f = zeros(2,1)

f(1) = x(2);

if  (t>=0)&(t<=6)
    f(2) = -40*x(2) - 150*x(1) + 66.6666*t
elseif (t>6)
    f(2) = -40*x(2)- 150*x(1) + 400
end

end

