% En este script vamos a realizar varias simulaciones del sistema dinámico
% para diferentes valores de los parámetros de control.
clear;
% Condiciones iniciales
% --------------------------------------------------------------------
% Para las masas
m1 = 10;
m2 = 10;
masas = [m1 m2];

% Intervalo de tiempo
tinicio = 0;
tfinal = 5;

tspan = [tinicio tfinal];

% Longitud del péndulo
l = 10;

% Posicion inicial Horizontal
xih = 0;

% Velocidad inicial Horizontal
dxih = 0;

% Ángulo inicial
phi1 = 40;
phi = phi1*pi/180;

% Velocidad angular inicial
dphi1 = 0;
dphi = dphi1*pi/180;
% --------------------------------------------------------------------

% -------------------------------------------------------------------
% Para el péndulo simple
% cond1 = [phi dphi];
% [t1,b1] = ode45(@pendulum,tspan,cond1,[],l);
% b11 = b1(:,1).*(180/pi);

% --------------------------------------------------------------------
% Procedemos entonces a resolver el problema (ODE45)
cond = [xih dxih phi dphi];
[t,y] = ode45(@movependulum2,tspan,cond,[],masas,l);
y1 = y(:,3).*(180/pi);
% --------------------------------------------------------------------

% --------------------------------------------------------------------
% Procedemos entonces a resolver el problema (Runge-Kutta 4to orden)
h = 0.01;
[trk,yrk] = RK31(@movependulum2,tspan,cond,h,masas,l);
yrk1 = yrk(3,:).*(180/pi);
% --------------------------------------------------------------------

% Vamos a graficar
% figure(1)
% subplot(2,1,1)
% hold on
% plot(trk,yrk1,'r','Linewidth',4) % Este es el mío
% plot(t,y1,'b','Linewidth',2)
% title('Posición angular')
% 
% subplot(2,1,2)
% hold on
% % Movimiento horizontal
% plot(trk,yrk(1,:),'r','Linewidth',4) % Este es el mío
% plot(t,y(:,1),'b','Linewidth',2)
% title('Posición horizontal')

% plot(t1,b11,'r') % Péndulo simple

% Animation Loop
clf
hold on
grid on
axis equal

% Para el movimiento horizontal
movhor = yrk(1,:);
% Para el movimiento pendular
movver = yrk(3,:);
ho = movhor + l*sin(movver);
ve = -1*l*cos(movver);

set(gcf,'Renderer','OpenGL'); 

hl = line([movhor(1) ho(1)],[0 ve(1)],'Color','k');
h1 = plot(movhor(1),0,'o','MarkerSize',m1,'MarkerFaceColor','b');
h2 = plot(ho(1),ve(1),'o','MarkerSize',m2,'MarkerFaceColor','b');
set(h1,'EraseMode','normal');
set(h2,'EraseMode','normal');
set(hl,'EraseMode','normal');

limInfHor = min([movhor ho]);
limSupHor = max([movhor ho]);
xlim([limInfHor limSupHor]);
limy = max([0 max(ve)]);
ylim([min(ve) limy]);

i = 1;
while i<=length(movhor)
    set(h1,'XData',movhor(i));
    set(h2,'XData',ho(i),'YData',ve(i));
    set(hl,'XData',[movhor(i) ho(i)],'YData',[0 ve(i)]);
    drawnow;
    i = i+1;
end

% Para el movimiento del péndulo





