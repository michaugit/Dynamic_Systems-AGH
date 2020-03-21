clc;
close all;
clear;

%100hz~630rad/s

%Teraz testujemy równe wartoœci R i C patrz¹c na wynik filtracji za pomoc¹ wykresu bode
% a¿ do momentu gdy parametry spe³niaj¹ cel zadania.

R=0.02;
C=1;

%wykres bode
sys=tf([0 1],[R*C 1]);
bode(sys);

%Widzimy ¿e dla czêstotliwoœci wy¿szych od 630 rad/s, s¹ one t³umione o conajmniej 20DB