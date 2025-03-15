% LABORATOR 3 - SS: SISTEM DE ORDIN 2
%% Ex sistem ordin 2 pt variatia lui zeta
wn = 2;
zeta1 = 0.1;
zeta2 = 0.5;
zeta3 = 0.9;

Hz1 = tf(wn^2, [1 2*zeta1*wn wn^2]);
Hz2 = tf(wn^2, [1 2*zeta2*wn wn^2]);
Hz3 = tf(wn^2, [1 2*zeta3*wn wn^2]);

figure
hold on
step(Hz1)
set(findall(gcf,'type','line'),'linewidth', 3);
legend('zeta = 0.1')
set(gca, 'Fontsize', 16)
pause

step(Hz2)
set(findall(gcf,'type','line'),'linewidth', 3);
legend('zeta = 0.1', 'zeta = 0.5')
% set(gca, 'Fontsize', 16)
pause

step(Hz3)
hold off
set(findall(gcf,'type','line'),'linewidth', 3);
legend('zeta = 0.1', 'zeta = 0.5', 'zeta = 0.9')
% set(gca, 'Fontsize', 16)

%% Ex sistem ordin 2 pt variatia lui wn
wn1 = 0.5;
wn2 = 1;
wn3 = 3;

zeta = 0.2;

Hw1 = tf(wn1^2, [1 2*zeta*wn1 wn1^2]);
Hw2 = tf(wn2^2, [1 2*zeta*wn2 wn2^2]);
Hw3 = tf(wn3^2, [1 2*zeta*wn3 wn3^2]);

figure
hold on
step(Hw1)
set(findall(gcf,'type','line'),'linewidth', 3);
legend('wn= 0.5')
set(gca, 'Fontsize', 16)
pause

step(Hw2)
set(findall(gcf,'type','line'),'linewidth', 3);
legend('wn = 0.5', 'wn = 1')
% set(gca, 'Fontsize', 16)
pause

step(Hw3)
hold off
set(findall(gcf,'type','line'),'linewidth', 3);
legend('wn = 0.5', 'wn = 1', 'wn = 3')
% set(gca, 'Fontsize', 16)

%% Criterii de performanta Sistem de ordin 2
wn = 2;
zeta = 0.5;

H2 = tf(wn^2, [1 2*zeta*wn wn^2]);

t = 0 : 0.1 : 7;
[y, t1] = step(H2, t);
yst = y(end);

u = ones(length(t), 1);
 
crt = stepinfo(H2);
crt

v_tub = 2;
tub_u = (100 + v_tub)/100 * ones(length(t), 1);
tub_d = (100 - v_tub)/100 * ones(length(t), 1);

figure
plot(t, u, 'color', [0 0.4470 0.7410], 'LineWidth', 3)
hold on
plot(t, y, 'color', [0.8500 0.3250 0.0980], 'LineWidth', 3)
stem(crt.PeakTime, crt.Peak, 'color', [0.6350 0.0780 0.1840], 'LineWidth', 2)
plot(t, tub_u, 'color', [0.4660 0.6740 0.1880], 'LineStyle','-.',...
    'LineWidth', 2)
plot(t, tub_d, 'color', [0.4660 0.6740 0.1880], 'LineStyle','-.',...
    'LineWidth', 2)
stem(crt.SettlingTime, y(find(t>=crt.SettlingTime, 1, 'first')),...
    'color', [0.4940 0.1840 0.5560], 'LineWidth', 2 )
stem([t(find(y>=0.1*yst, 1, 'first')) t(find(y>=0.9*yst, 1, 'first'))],...
    [y(find(y>=0.1*yst, 1, 'first')) y(find(y>=0.9*yst, 1, 'first'))], ...
    'color', [0.9290 0.6940 0.1250], 'LineWidth', 2)
grid
title('Functie de ordin 2 - Specificatii de performanta')
xlabel('Timp [sec]')
ylabel('Amplitudine')
set(gca, 'FontSize', 24)