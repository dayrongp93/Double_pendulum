function rightSide = movependulumDouble(t,y,masas,l)
% Esta funcion contiene las ecuaciones para el estudio del movimiento de un
% sistema dinamico que consiste en dos pendulos, uno que cuelga de otro
% En esta funcion se devuelve los valores del lado derecho del sistema de
% ecuaciones
phi1 = [y(1) y(2)];
phi2 = [y(3) y(4)];

m1 = masas(1); % Masa del cuerpo 1
m2 = masas(2); % Masa del cuerpo 2
l1 = l(1); % Longitud del pendulo 1
l2 = l(2); % Longitud del pendulo 2

g = 9.8; % Aceleracion de la gravedad

F = @(g,l1,l2,m1,m2,u1,u2,v1,v2) ((m2*g*sin(u1-v1) - g*(m1+m2)*sin(u1) - m2*sin(u1-v1)*(l2*v2^2+l1*u2^2*cos(u1-v1)))/(l1*(m1+m2)-m2*l1*(cos(u1-v1))^2));

G = @(g,l1,l2,m1,m2,u1,u2,v1,v2) ((l1/l2)*u2^2*sin(u1-v1) - (g/l2)*sin(v1) - ( m2*g*sin(v1)*(cos(u1-v1))^2 - g*(m1+m2)*sin(u1)*cos(u1-v1) - (m2/2)*sin(2*u1-2*v1)*(l2*v2^2+l1*u1^2*cos(u1-v1)) )/( l2*(m1+m2) - m2*l2*(cos(u1-v1)^2) ));

rightSide = [phi1(2); F(g,l1,l2,m1,m2,phi1(1),phi1(2),phi2(1),phi2(2)); phi2(2); G(g,l1,l2,m1,m2,phi1(1),phi1(2),phi2(1),phi2(2))];