clc;
close all;
clear;

%Ustawienia r�wnania stanu:
%A jest macierz� stanu naszego uk�adu, a B jest macierz� sterowania;
A=[1,1;1,1];

%B=0 oznacza �e system jest autonomiczny
B=[0;0];

%Ustawienie czemu jest r�wny y:
%u�ywajac eye  dla C , [0 0] dla D
%uzyskujemy [y1,y2]=[x1,x2]
C=eye(2);

%Nie mamy sterowania na wyj�ciu wi�c D=0
D=[0;0];

%Czas pr�bkowania (czas mi�dzy pobraniem pr�bek z wej�cia  a przetworzeniem
%na sygna� dyskretny)
h=1e-2;

%Pocz�tkowy stan systemu
Start=0;


%%
%
% x(k+1)=lambda*x(k)

lambda=[-1.1, -1 , -0.7 ,-0.3, 0, 0.3 ,0.7, 1, 1.1];

%Set state spaces to n=1 -->dim(x)=1 
%Make x(i+1)=1*x
%y=x

A=1;
%Sterowanie
B=0;
%y=x
C=1;
%Sterowanie na wyj�ciu:
D=0;
h=1;    


for i=1:9
    %Ustawienie parametr�w
    A=lambda(i);
    Start=10;
    %Symulacja
    sim('model');
    %Korzystaj�c z r�wnania og�lnego dla ci�g�ych uk�ad�w dynamicznych:
    x_continues=exp(A.*tout)*Start;
   
    %figure(i); %ka�dy wykres osobno
    subplot(2,5,i); %wszystkie wykresy razem
    for j=1:(11/h)
        hold on;
        y=x(j);
        plot((j-1),y,'green*');
        plot(tout,x_continues,'blue');
        hold on;
    end;
   % hold on;
   
    hold off;
    
    %Parametry wykresu
    grid on;
    xlabel('czas t');
    ylabel('x(t)');
    axis([0 10  -50 50]);
    legend('System Dyskretny','System Ci�g�y');
    title({'System dynamiczny z',['A=',num2str(lambda(i))],['x(0)=',num2str(Start)]});
end;





