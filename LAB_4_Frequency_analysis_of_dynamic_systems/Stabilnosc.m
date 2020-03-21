%Czyszczenie
clc;
close all;
clear;

%Ustawienie parametr�w systemu
%Liczebnik N, Mianownik D
N=[0 1];
D=[1 1 2];
roots(D)
%Stworzenie systemu
system=tf(N,D);


%Wykres charakterystyki Nyuqiust'a
subplot(1,2,1);
nyquist(system);
hold on;
%Wydrukowanie pustego punktu (-1,0), aby �atwiej by�o stwierdzi�, czy wykres obejmuje punktu(?1,0) na p�aszczy�nie zespolonej.
plot(-1,0,'');
title({'Transmitancja operatorowa 1.20'});


%To samo dla drugiego systemu
N=[1 0];
D=[1 -0.1 2];
roots(D)
system=tf(N,D);

subplot(1,2,2);
nyquist(system);
hold on;
plot(-1,0,'');
title({'Transmitancja operatorowa 1.21'});
