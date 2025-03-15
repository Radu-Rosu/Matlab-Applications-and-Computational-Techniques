clc;clear;close all;
s = tf('s');
P = 0.38*(s^2 + 0.1*s + 0.55)/( s*(s+1)*(s^2 + 0.06*s + 0.5));
figure;
nyquist(P);
xlim([-2 0]);
ylim([-1 1]);
%figure;
%margin(P);
%%Marginile se pot vedea de pe diagramale bode si nyquist:
%%right click -> characteristics -> All stability margins
%%sau folosind margin(sys);

%%Sistemul P are o margine de amplitudine (gain margin) infinita si
%%margine de faza de ~ 70 grade.





%% Functia de transfer P este de obicei o aproximare a procesului real 
% iar cele 2 pot sa difere mult. (ex: proces neliniar, sistem variant in
% timp) 
%%Marginile ne ofera o garantie asupra cat de gresita poate fi aproximatia.
F = 0.1 / 1 * (s + 1) / (s + 0.1); 
T = feedback(P * F, 1);
figure;
step(T); 
roots(T.den{1})
%Prin F am incercat sa simulez o incertitudine asupra modelului.
%Am presupus ca procesul real este P*F, iar modelul nostru este P
%Si observam ca desi F, introduce faza negativa, ea nu depaseste 70 de
%grade ca sistemul sa nu mai fie stabil.



%% Daca F introduce mai mult de 70 grade, sistemul in bucla devinde instabil.
F = 0.01 * (s + 1)^2 / (s + 0.1)^2;
T = feedback(P * F, 1);
figure;
step(T); 
roots(T.den{1})


%% Marginea de amplitudine fiind infinita putem adauga orice amplificare
%%pe cale directa, sistemul ramanand stabil
T = feedback(10000 * P, 1);
figure;
step(T); 
roots(T.den{1})



%% Daca adaugam faza si amplificare pe cale directa observam ca
% sistemul nu mai este stabil. Asta se datoreaza unei margini vectoriale
% proaste.
F = 0.1 / 1 * (s + 1) / (s + 0.1); 
T = feedback(10 * P * F, 1);
figure;
step(T); 
roots(T.den{1})
