%% Sisteme de ordin 1
%% Raspuns la impuls
figure
hold on
for sigma = 4 : 4 : 16
    H = tf(1, [1 sigma])
    impulse(H);
    sigma
    T = 1/sigma
    K = 1/sigma
    pause
end
hold off
legend('sigma = 4', 'sigma = 8', 'sigma = 12', 'sigma = 16')

%% Treapta unitara
figure
hold on
K = 2;
t = 0: 1 : 100;      
plot(t, ones(length(t),1))
for T = 4 : 4 : 16
    H = tf(K, [T 1]);
    step(H, t);
    T 
    K
    pause   
end
hold off
legend('T = 4', 'T = 8', 'T = 12', 'T = 16')
