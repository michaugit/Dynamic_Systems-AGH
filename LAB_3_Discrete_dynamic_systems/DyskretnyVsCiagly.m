clc;
close all;
clear;

%Parametry z _c u¿ywane s¹ w ci¹g³ym "State Space"
%Ustawienia równania stanu:
%A jest macierz¹ stanu naszego uk³adu, a B jest macierz¹ sterowania;
A=[1,1;1,1];
A_c=A;

%B=0 oznacza ¿e system jest autonomiczny
B=[0;0];
B_c=B;

%Ustawienie czemu jest równy y:
%u¿ycie eye  dla C , [0 0] dla D
%[y1,y2]=[x1,x2]
C=eye(2);
C_c=C;

%Nie mamy sterowania na wyjœciu wiêc D=0
D=[0;0];
D_c=D;

%Czas próbkowania (czas miêdzy pobraniem próbek z wejœcia  a przetworzeniem
%na sygna³ dyskretny)
h=1;


%Pocz¹tkowy stan systemu
Start=0;
Start_c=Start;


%%
%Czêœæ 2

%Moje I, N zale¿¹ od d³ugoœci imienia i nazwiska:
I=length('Micha³');
N=length('Pieni¹dz');

%Ustawienie odpowiednich wartoœci w macierzach
A_c=[0 1;-I -N];
B_c=[0;1];
C_c=[1 0; 0 1];
D_c=[0;0];

%Czas próbkowania
h=1;
% h=1/2;

%U¿ycie wzoru z konspektu:
A=expm(h*A_c);

%zdefiniowanie zmiennej symbolicznej t
syms t;
%Int = funkcja ca³kowania w matlabie od 0 do h przy u¿yciu t
%Rzutowanie na Double
B=double(int(expm(t*A_c)*B_c,t,0,h));
C=C_c; 
D=D_c;

%Pocz¹tkowy stan systemu
Start=5;
Start_c=Start;
sim('model_2');

%Wykresy

figure(2);
subplot(1,2,1);
plot(tout,x(:,1),'red');
hold on;
plot(tout,x(:,3),'blue');
title("Dyskretny-Ci¹g³y x1(t),");
legend('Ci¹g³y','Dyskretny');
xlabel("czas t");
ylabel("x1(t)");



subplot(1,2,2);
plot(tout,x(:,2),'red');
hold on;
plot(tout,x(:,4),'blue');

title("Dyskretny-Ci¹g³y x2(t)");
legend('Ci¹g³y','Dyskretny');
xlabel("czas t");
ylabel("x2(t)");

