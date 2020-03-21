clc;
close all;
clear;

%Ustawienia równania stanu:
%A jest macierz¹ stanu naszego uk³adu, a B jest macierz¹ sterowania;
A=[1,1;1,1];

%B=0 oznacza ¿e system jest autonomiczny
B=[0;0];

%Ustawienie czemu jest równy y:
%u¿ywajac eye  dla C , [0 0] dla D
%uzyskujemy [y1,y2]=[x1,x2]
C=eye(2);

%Nie mamy sterowania na wyjœciu wiêc D=0
D=[0;0];

%Czas próbkowania (czas miêdzy pobraniem próbek z wejœcia  a przetworzeniem
%na sygna³ dyskretny)
h=1e-2;

%Pocz¹tkowy stan systemu
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
%Sterowanie na wyjœciu:
D=0;
h=1;    


for i=1:9
    %Ustawienie parametrów
    A=lambda(i);
    Start=10;
    %Symulacja
    sim('model');
    %Korzystaj¹c z równania ogólnego dla ci¹g³ych uk³adów dynamicznych:
    x_continues=exp(A.*tout)*Start;
   
    %figure(i); %ka¿dy wykres osobno
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
    legend('System Dyskretny','System Ci¹g³y');
    title({'System dynamiczny z',['A=',num2str(lambda(i))],['x(0)=',num2str(Start)]});
end;





