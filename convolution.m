tstart1 = 0; tstop1 = 6;
tstart2 = 0; tstop2 = 2;
tstart3 = 0; tstop3 = 6;

t1 = linspace(tstart1,tstop1, 1001);
f = -2 * (double(t1>=-4) - double(t1>=2));

t2 = linspace(tstop2, tstop3, 1001);
g1 = double(t2>=6) - double(t2>=8);

t3 = linspace(tstart3, tstop3, 1001);
g2 = -3 * (double(t3>=8) - double(t3>=14));

th1 = linspace(tstop1, tstop1 + tstop2, 2001);
h1 = 6/1000 * conv(f,g1);

tht = linspace(tstop1, tstop1 + tstop3, 2001);
h2 = 6/1000 * conv(f,g2);

th2 = linspace(tstop1, tstop1 +tstop2 + tstop3, 2001);
h_total = h1 + h2;

subplot(4,1,1);
plot(t1,f,'LineWidth',3);
axis([-6 16 -4 2]); grid;


%{
subplot(4,1,2);
plot(t2,g1,'LineWidth',3);
axis([-6 16 -4 2]); grid;


subplot(4,1,3);
plot(t2,g2,'LineWidth',3);
axis([-6 16 -4 2]); grid;
%}
subplot(4,1,2);
plot(tht,h_total,'LineWidth',3);
axis([-6 16 -4 2]); grid;

subplot(4,1,3);
plot(th1,h1,'LineWidth',3);
axis([-6 16 -4 2]); grid;

subplot(4,1,4);
plot(th2,h2,'LineWidth',3);
axis([-6 16 -4 2]); grid;