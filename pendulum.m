function derivadas = pendulum(t,cond,l)

phi = [cond(1) cond(2)];

g = 9.8;

F = @(g,l,phi1) (-(g/l)*sin(phi1));

derivadas = [phi(2);F(g,l,phi(1))];