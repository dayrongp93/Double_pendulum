function [t,y] = RungeK4(F,tspan,y0,h,masas,l)
% Esta función devuelve resuelve un sistema de ecuaciones diferenciales
% utilizando un método de Runge-Kutta de cuarto orden

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

while a<b
    K1=h*F(a,y0,masas,l);
    K2=h*F(a+1/2*h,y0+1/2*K1,masas,l);
    K3=h*F(a+1/2*h,y0+1/2*K2,masas,l);
    K4=h*F(a+h,y0+K3,masas,l);
    
    a = a+h;
    t = [t a];
    y0=y0+1/6*(K1+2*K2+2*K3+K4);
    y = [y y0];
end