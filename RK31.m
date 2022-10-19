function [t,y] = RK31(F,tspan,y0,h,masas,l)
% Esta función devuelve resuelve un sistema de ecuaciones diferenciales
% utilizando un método de Runge-Kutta de tercer orden RK31
% Este método es conocido como el método de Heun de tercer orden

% Input:
% F = función de miembro derecho de la ecuación diferencial
% h = paso del método
% tspan = [a,b] = intervalo de tiempo de la solución
% y0 = condicion inical

% Output:
% t = partición de [a,b]
% y = vector de solución

a = tspan(1); b = tspan(2);
y0 = y0';
t = a;
y = y0;

% Coeficientes del método--------------------
c2 = 2/3;
c3 = 2/3;
a21 = 2/3;
a31 = 1/3;
a32 = 1/3;
b1 = 1/4;
b2 = 0;
b3 = 3/4;
%----------------------------------------------

while a<b
    K1=h*F(a,y0,masas,l);
    K2=h*F(a+c2*h,y0+a21*K1,masas,l);
    K3=h*F(a+c3*h,y0+a31*K1+a32*K2,masas,l);
    
    a = a+h;
    t = [t a];
    y0=y0+(b1*K1+b2*K2+b3*K3);
    y = [y y0];
end