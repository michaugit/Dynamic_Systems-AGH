%Czyszczenie
clc;
close all;
clear;

%Ustawienie parametr�w modelu
%Amplituda:
 A=10;
% A=20;
% A=30;
% A=40;
% A=50;

%Ustawienie tansmitancji modelu T=(L/M)
L=[3 3];
M=[1 2 21];

for i=1:10
f=i; %generowanie 10 wykres�w dla r�nych czestotliwo�ci f
%Symulacja
sim('model');

%Wykes Sterowania i stanu
subplot(2,5,i); %wszystkie wykresy razem
plot(tout,out(:,1));
hold on;
plot(tout,out(:,2));
hold on;
xlabel('czas');
ylabel('amplituda');
legend('Sterowanie','Stan');
title({['Ampliuda A=',num2str(A)],['Cz�stotliwo�� f=', num2str(i)]});
end;