% Laborator 4 - testare programe
m = 10;
n = 7;
A = randn(m,n);
b = randn(m,1);

%   TORT
disp('Algoritmul TORT: ');
[R,U,beta] = TORT(A); 
disp('Matricea A este: ');
disp(A);
disp('Matricea R este: ');
disp(R);
disp('Pentru exemplul dat in laborator: ');
B = [20 17 3; 12 22 -5; 8 10 6; 15 8 27; 16 9 14];
[R_B,U_B,beta_B] = TORT(B);
m=5;
n=3;
disp('Matricea B este: ');
disp(B);
disp('Matricea R este: ');
disp(R_B);

%   CMMP
b = rand(m,1);
x = CMMP(B,b);
x_matlab = B\b; %matlab intelege "rezolva-mi sistemul"
disp('Verificare corectitudine rezultat CMMP matrice laborator: ');
disp(norm(x - x_matlab));
fprintf('\n\n\n');

% sistem cu 20 ecuatii si 6 necunoscute
disp('Matricea 20x6');
m=20;
n=6;
B = randn(m,n);
b = rand(m,1);
[R_B,U_B,beta_B] = TORT(B);
disp('Matricea B este: ');
disp(B);
disp('Matricea R este: ');
disp(R_B);
x = CMMP(B,b);
x_matlab = B\b;
disp('Verificare corectitudine rezultat CMMP matrice 20x6: ');
disp(norm(x - x_matlab));