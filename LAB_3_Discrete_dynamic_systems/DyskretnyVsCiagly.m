clc;
close all;
clear;

%Parametry z _c u�ywane s� w ci�g�ym "State Space"
%Ustawienia r�wnania stanu:
%A jest macierz� stanu naszego uk�adu, a B jest macierz� sterowania;
A=[1,1;1,1];
A_c=A;

%B=0 oznacza �e system jest autonomiczny
B=[0;0];
B_c=B;

%Ustawienie czemu jest r�wny y:
%u�ycie eye  dla C , [0 0] dla D
%[y1,y2]=[x1,x2]
C=eye(2);
C_c=C;

%Nie mamy sterowania na wyj�ciu wi�c D=0
D=[0;0];
D_c=D;

%Czas pr�bkowania (czas mi�dzy pobraniem pr�bek z wej�cia  a przetworzeniem
%na sygna� dyskretny)
h=1;


%Pocz�tkowy stan systemu
Start=0;
Start_c=Start;


%%
%Cz�� 2

%Moje I, N zale�� od d�ugo�ci imienia i nazwiska:
I=length('Micha�');
N=length('Pieni�dz');

%Ustawienie odpowiednich warto�ci w macierzach
A_c=[0 1;-I -N];
B_c=[0;1];
C_c=[1 0; 0 1];
D_c=[0;0];

%Czas pr�bkowania
h=1;
% h=1/2;

%U�ycie wzoru z konspektu:
A=expm(h*A_c);

%zdefiniowanie zmiennej symbolicznej t
syms t;
%Int = funkcja ca�kowania w matlabie od 0 do h przy u�yciu t
%Rzutowanie na Double
B=double(int(expm(t*A_c)*B_c,t,0,h));
C=C_c; 
D=D_c;

%Pocz�tkowy stan systemu
Start=5;
Start_c=Start;
sim('model_2');

%Wykresy

figure(2);
subplot(1,2,1);
plot(tout,x(:,1),'red');
hold on;
plot(tout,x(:,3),'blue');
title("Dyskretny-Ci�g�y x1(t),");
legend('Ci�g�y','Dyskretny');
xlabel("czas t");
ylabel("x1(t)");



subplot(1,2,2);
plot(tout,x(:,2),'red');
hold on;
plot(tout,x(:,4),'blue');

title("Dyskretny-Ci�g�y x2(t)");
legend('Ci�g�y','Dyskretny');
xlabel("czas t");
ylabel("x2(t)");

