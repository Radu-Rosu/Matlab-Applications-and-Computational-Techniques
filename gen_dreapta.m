% Script pentru generarea unor puncte corespunzand unui model liniar

% parametrii dreptei
alfa = 2;
beta = 1;
gamma = 1;
x_adevarat = [alfa; beta; gamma];
x_adevarat = x_adevarat / norm(x_adevarat); % normam coeficientii

% generare puncte
m = 20;     % numar puncte
s = 0.3;    % putere zgomot
if abs(alfa) > abs(beta)
  yy = 6*rand(m,1) - 3; %randn(m,1);
  xx = (-gamma - beta*yy)/alfa;
else
  xx = 6*rand(m,1) - 3; %randn(m,1);
  yy = (-gamma - alfa*xx)/beta;
end

% aduna zgomot atat lui xx cat si lui yy!
xx = xx + s*randn(m,1);
yy = yy + s*randn(m,1);

% deseneaza punctele
plot(xx, yy, 'xr', 'LineWidth', 2, 'MarkerSize', 8)% desenez punctele f(xx) = y
hold on;
A = [xx yy ones(20,1)];
[U,S,V] = svd(A);
ultima_col = V(:,end);
A = [xx ones(20,1)];
rezid = CMMP(A,yy);  %CMMP in loc de A\yy
plot(xx, xx*rezid(1) + rezid(2),'yellow', 'LineWidth', 2);        % CMMP 6.16
plot(xx, -1/ultima_col(2) * (ultima_col(1) * xx + ultima_col(3)),'m', 'LineWidth', 2);  % CMMPT 6.18
plot(xx, -1/x_adevarat(2)*(xx*x_adevarat(1) + x_adevarat(3)),'green', 'LineWidth', 2); % Rel adevarata
hold off;
legend('Esantion','Adevarat','CMMP','CMMPT');
