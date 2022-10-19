function derivadas = movependulum2(t,y,masas,l)
% Esta función contiene las ecuaciones para el estudio del movimiento del
% péndulo móvil, como sistema de ecuaciones diferenciales de segundo orden
x = [y(1) y(2)];
phi = [y(3) y(4)];

m1 = masas(1); % Masa del cuerpo 1
m2 = masas(2); % Masa del cuerpo suspendido
g = 9.8; % Aceleración de la gravedad

F = @(g,l,m1,m2,phi1,phi2) ((m2*l*sin(phi1))*phi2^2+g*m2*sin(phi1)*cos(phi1))/(m1+m2-m2*cos(phi1)^2);

G = @(g,l,m1,m2,phi1,phi2) ((m2*l*sin(phi1)*cos(phi1))*phi2^2+g*(m1+m2)*sin(phi1))/(m2*l*cos(phi1)^2-(m1+m2)*l);

derivadas = [x(2);F(g,l,m1,m2,phi(1),phi(2));phi(2);G(g,l,m1,m2,phi(1),phi(2))];
