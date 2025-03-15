a = -25;
b = 2;
toleranta = 1e-07;
Nmax = 50;
x = a:0.01:b;
y = functie(x);
hold on;
plot(x, y, 'g-', 'LineWidth', 2);
plot(a, functie(a), 'red*', 'MarkerSize', 10);
plot(b, functie(b), 'red*', 'MarkerSize', 10);
solutie = tema9_CodreanuRadu_321AA(a, b, toleranta, Nmax);
plot(solutie, functie(solutie), 'black*', 'MarkerSize', 10);
yline(0,'g--', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f(x)');
title('Graficul functiei f(x) = cos(2*x) + 10*sin(0.3*x)');
hold off;
abs(functie(solutie))