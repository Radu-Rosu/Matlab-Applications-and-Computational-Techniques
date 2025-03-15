%tema11_CodreanuRadu_321AA
opts.SYM = true;
opts.POSDEF = true;
dimensiune = zeros(1, 10);
for i = 1 : 10
    dimensiune(i) = 2^i;
end
diferenta_solutie = zeros(1, 10);

timp_metoda_linsolve = zeros(10, 1);
timp_metoda_impartire = zeros(10, 1);

for i = 1 : 10
    A = randn(dimensiune(i), dimensiune(i));
    A = A * A';
    b = randn(dimensiune(i), 1);
    tic;
    solutie_linsolve = linsolve(A, b, opts);
    timp_metoda_linsolve(i) = toc;
    tic;
    solutie_impartire = A \ b;
    timp_metoda_impartire(i) = toc;

    diferenta_solutie(i) = norm(solutie_impartire - solutie_linsolve,'fro');
    %dimensiune = dimensiune * 2;
end
fprintf('Timpi de executie metoda linsolve:\n'); 
disp(timp_metoda_linsolve);
fprintf('Timpi de executie metoda impartire:\n'); 
disp(timp_metoda_impartire);
fprintf('Norma diferentelor dintre solutii:\n'); 
disp(diferenta_solutie);

figure;
plot(dimensiune, timp_metoda_impartire,'green-','LineWidth',2,'DisplayName','metoda impartire A\\b');
hold on;
plot(dimensiune, timp_metoda_linsolve,'black-','LineWidth',2,'DisplayName','metoda linsolve');
xlabel('Dimensiunea matricei A spd');
ylabel('Timp de executie(sec)');
title('Comparatie viteza de executie intre linsolve si A\\b');
legend;
xlim([2 1024]);
grid;

