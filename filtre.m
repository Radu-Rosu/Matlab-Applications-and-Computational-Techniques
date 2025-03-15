clc; clear; close all;
s = tf('s');

M = 1; A = 100; wb = 1;
FTS = (1 / M * s + wb) / (s + A * wb); % Filtru Trece sus
FTJ = 1 / (s^2 + 2*s + 1); % Filtru Trece Jos (butterworth ordin 2)

subplot(1,2,1);
bodemag(FTS);
title("Filtru Trece Sus");
subplot(1,2,2);
bodemag(FTJ);
title("Filtru Trece Jos");

%%
t = 0:0.0001:50;
lf = sin(0.5 * t); %low frequency sine wave
hf = sin(1000 *t); %high frequency sine wave

subplot(3,2,1);
lsim(FTS,lf,t,'r');
title("Filtru Trece sus");
legend('iesire');
subplot(3,2,3);
lsim(FTS,hf,t,'r');
xlim([0 1]);
subplot(3,2,5);
lsim(FTS,lf + hf,t,'r');
% Se poate observa ca filtrul
% de tip Trece SUS pastreaza la
% iesire doar semnalele de
% frecventa inalta, iar cele de
% joasa frecventa sunt puternic 
% atenuate


subplot(3,2,2);
lsim(FTJ,lf,t,'r');
title("Filtru Trece jos");
legend('iesire');
subplot(3,2,4);
lsim(FTJ,hf,t,'r');
xlim([0 1]);
subplot(3,2,6);
lsim(FTJ,lf + hf,t,'r');
% Se poate observa ca filtrul
% de tip Trece JOS pastreaza la
% iesire doar semnalele de
% frecventa joasa, iar cele de
% intalta frecventa sunt puternic 
% atenuate
%% Calculare norma inifinit
norm(FTJ,'inf')