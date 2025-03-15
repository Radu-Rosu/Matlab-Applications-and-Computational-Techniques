% Definire parametrii
Ts = 0.01;
t = -10 : Ts : 10;

% Semnal dreptunghiular
a = 0; b = 4;   % Suportul semnalului dreptunghiular
y_rect = rect(t, a, b);

% Operatia de convolutie - functie matlab
index = y_rect > 0;
y = Ts * conv(y_rect(index), y_rect(index));    % Semnalul rezultat
t_sig = 0 : Ts : 2*b;       % Suportul semnalului rezultat

% Afisarea rezultatlului de convolutie
figure
plot(t_sig, y)

figure
for i = -1 : 9
    h1 = subplot(211);
    plot(t, y_rect, 'LineWidth', 2); grid on;
    hold on
    plot(t, rect(-t+i, a, b), 'LineWidth', 2);
    xlabel('Timp [sec]'); ylabel('Amplitudine')
    title('Semnal dreptunghiular');
    legend('u(\tau)', 'h(t-\tau)'); axis([-10 10 0 2])

    subplot(212)
    index2 = t_sig <= i;
    plot(t_sig(index2), y(index2), 'LineWidth', 2); grid;
    xlabel('Timp [sec]'); ylabel('Amplitudine')
    title('Semnal obtinut dupa convolutie');
    legend('u(t)*h(t)'); axis([-10 10 0 5])
    disp('Press any key to continue...')
    pause 
    if i ~= 9
        cla(h1)
    end
end
