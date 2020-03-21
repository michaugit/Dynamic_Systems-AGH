%Czyszczenie
clc;
close all;
clear;

%Ustawienie parametrów modelu
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
f=i; %generowanie 10 wykresów dla ró¿nych czestotliwoœci f
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
title({['Ampliuda A=',num2str(A)],['Czêstotliwoœæ f=', num2str(i)]});
end;