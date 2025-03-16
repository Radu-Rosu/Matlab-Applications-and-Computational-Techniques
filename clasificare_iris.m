% Clasificare IRIS cu CMMP 
% true positive rate, si ??  in eng pt sensibilitate si 

%iris_data = load('iris.mat');
N1 = 50;    % numar puncte in prima clasa
N2 = 100;   % numar puncte in a doua clasa
ell = 2;    % dimensiunea vectorilor de clasificat 2*(lungime+latime)

%   tip 1 / tip 2+3

% generare vectori citit din iris.mat
V1 = iris_data(1:50,1:2)';
V2 = iris_data(51:150,1:2)';

%V1 = c1 + s1*randn(ell,N1);   % genereaza vectorii
%V2 = c2 + s2*randn(ell,N2);
% deseneaza vectorii din cele doua clase
plot(V1(1,:), V1(2,:), '*r', 'LineWidth', 2, 'MarkerSize', 10)
hold on
plot(V2(1,:), V2(2,:), '*b', 'LineWidth', 2, 'MarkerSize', 10)
% deseneaza axe (TEMA: calculati din date lungimea corecta a axelor astfel
% incat desenul sa fie mai "frumos")
plot([0 0], [5 0], 'k')
plot([7 0], [0 0], 'k')
hold off

% formeaza si rezolva problema CMMP
A = [V1' ones(N1,1); V2' ones(N2,1)];
b = [ones(N1,1); -ones(N2,1)];
x = CMMP(A,b);    % A \ b;   aici se rezolva problema CMMP 
c = x(1:ell);
d = x(ell+1);

% deseneaza dreapta c*v + d = 0, care separa planul in cele doua
% semiplane gasite de metoda CMMP
hold on
if abs(c(2)) > abs(c(1))
  plot([0 7], -1/c(2)*(c(1)*[0 7] + d), 'g', 'LineWidth', 2)
else
  plot(-1/c(1)*(c(2)*[0 5] + d), [0 5], 'g', 'LineWidth', 2)
end
hold off

% Verificam cati vectori de antrenare sunt clasificati corect in fiecare clasa
matrice_confuzie = zeros(2);
for i = 1 : N1
  if sign(c'*V1(:,i) + d) == 1
    matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
  else
    matrice_confuzie(1,2) = matrice_confuzie(1,2) + 1;
  end
end
for i = 1 : N2
  if sign(c'*V2(:,i) + d) ~= 1
    matrice_confuzie(2,2) = matrice_confuzie(2,2) + 1;
  else
    matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
  end
end
disp('Matrice confuzie pentru tip1 / tip2+3: ');
disp(matrice_confuzie); %se observa ca este perfect separat 

%{
%   tip 2 / tip 1+3

% generare vectori citit din iris.mat
V1 = iris_data(51:100,1:4);
V2 = [iris_data(1:50,1:4);iris_data(101:150,1:4)];
V1 = V1';
V2 = V2';

% formeaza si rezolva problema CMMP
A = [V1' ones(N1,1); V2' ones(N2,1)];
b = [ones(N1,1); -ones(N2,1)];
x = A \ b;      % aici se rezolva problema CMMP 
c = x(1:ell);
d = x(ell+1);

% Verificam cati vectori de antrenare sunt clasificati corect in fiecare clasa
matrice_confuzie = zeros(2);
for i = 1 : N1
  if sign(c'*V1(:,i) + d) == 1
    matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
  else
    matrice_confuzie(1,2) = matrice_confuzie(1,2) + 1;
  end
end
for i = 1 : N2
  if sign(c'*V2(:,i) + d) ~= 1
    matrice_confuzie(2,2) = matrice_confuzie(2,2) + 1;
  else
    matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
  end
end
disp('Matrice confuzie pentru tip2 / tip1+3: ');
disp(matrice_confuzie);

%   tip 2 / tip 1+3

% generare vectori citit din iris.mat
V1 = iris_data(101:150,1:4);
V2 = iris_data(1:100,1:4);
V1 = V1';
V2 = V2';

% formeaza si rezolva problema CMMP
A = [V1' ones(N1,1); V2' ones(N2,1)];
b = [ones(N1,1); -ones(N2,1)];
x = A \ b;      % aici se rezolva problema CMMP 
c = x(1:ell);
d = x(ell+1);

% Verificam cati vectori de antrenare sunt clasificati corect in fiecare clasa
matrice_confuzie = zeros(2);
for i = 1 : N1
  if sign(c'*V1(:,i) + d) == 1
    matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
  else
    matrice_confuzie(1,2) = matrice_confuzie(1,2) + 1;
  end
end
for i = 1 : N2
  if sign(c'*V2(:,i) + d) ~= 1
    matrice_confuzie(2,2) = matrice_confuzie(2,2) + 1;
  else
    matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
  end
end
disp('Matrice confuzie pentru tip3 / tip1+2: ');
disp(matrice_confuzie);
%}