clc;
close all;
clear;

%100hz~630rad/s

%Teraz testujemy r�wne warto�ci R i C patrz�c na wynik filtracji za pomoc� wykresu bode
% a� do momentu gdy parametry spe�niaj� cel zadania.

R=0.02;
C=1;

%wykres bode
sys=tf([0 1],[R*C 1]);
bode(sys);

%Widzimy �e dla cz�stotliwo�ci wy�szych od 630 rad/s, s� one t�umione o conajmniej 20DB