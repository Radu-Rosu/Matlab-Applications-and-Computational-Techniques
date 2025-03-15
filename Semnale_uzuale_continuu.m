%% Semnale - timp continuu

% Definirea suportului functiei
t = -10:0.01:10;

% Numarul de elemente ale suportului
n = length(t);

% Important: semnalele pot fi reprezentate si altfel, dar ce am descris mai
% jos ar fi cam cea mai usoara si accesibila metoda de implementare.

% De asemenea, semnalele de mai jos, le puteti implementa si in functii, in
% cazul in care aveti nevoie sa le folositi in cadrul mai multor
% script-uri.

%% Semnal treapta

% Semnalul treapta este:
% 0, t<0
% 1, t>=0

y_treapta = zeros(1, n); % umplem vectorul de zerouri

% Cum deja am initializat vectorul cu 0, urmeaza sa schimbam valorile
% vectorului y_treapta(i) in 1, atunci cand avem t(i)>=0

for i = 1:n
    if t(i)>=0
        y_treapta(i) = 1;
    end
end

figure
plot(t, y_treapta, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal treapta', 'FontSize', 14, 'Interpreter','latex')

%%
% t = linspace(0, 10, 100); % orizont de simulare
u = double(t>=0); % intrare treapta

figure
plot(t, u, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal treapta', 'FontSize', 14, 'Interpreter','latex')

%%
t = 0 : 0.1 : 10; 
u = ones(length(t), 1); % merge doar cand orizontul de timp pleaca de la 0!

figure
plot(t, u, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal treapta', 'FontSize', 14, 'Interpreter','latex')

%% Semnal rampa

% Semnalul rampa este:
% 0, t<0
% t, t>=0

% Se observa ca, semnalul rampa se mai poate scrie si ramp(t) = t*1(t)

ramp = zeros(1, n); % umplem vectorul de zerouri

for i = 1:n
    if t(i)>=0
        ramp(i) = t(i);
    end
end

% Alta posibilitate (merge atunci cand avem deja definit semnalul treapta):
% ramp = t.*y_treapta;

figure
plot(t, ramp, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal rampa', 'FontSize', 14, 'Interpreter','latex')

%% Impuls dreptunghiular

% Semnalul dreptunghiular este:
% 1, a<=t<=b
% 0, in rest

rect = zeros(1, n); % umplem vectorul de zerouri

% Alegem capetele intre care actioneaza semnalul
a = 2;
b = 6;

for i = 1:n
    if t(i)>=a & t(i)<=b
        rect(i) = 1;
    end
end

figure
plot(t, rect, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal dreptunghiular', 'FontSize', 14, 'Interpreter','latex')

%% Impuls triunghiular

% Semnalul triunghiular este:
% 1, -1<=t<=1
% 0, in rest

trian = zeros(1, n); % umplem vectorul de zerouri

for i = 1:n
    if abs(t(i))<=1
        trian(i) = (1-abs(t(i)));
    end
end

figure
plot(t, trian, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal triunghiular', 'FontSize', 14, 'Interpreter','latex')

%% Semnale exponentiale

A = 2;
a = -0.5;

u = A*exp(a*t);

figure
plot(t, u, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal exponential', 'FontSize', 14, 'Interpreter','latex')

%% Semnale armonice

A = 2;
w = pi*0.5;
phi = pi/4;

u = A*cos(w*t + phi);

figure
plot(t, u, 'LineWidth', 2); grid
xlabel('Timp [s]', 'FontSize', 12, 'Interpreter','latex')
ylabel('Amplitudine', 'FontSize', 12, 'Interpreter','latex')
title('Semnal armonic', 'FontSize', 14, 'Interpreter','latex')