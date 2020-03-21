clc;
close all;
clear;
%open('model_lab2') %otworz model


% MENU DO WYBORU MACIERZY J
choice=menu('Wybierz:','1. Podw�jna warto�� w�asna 0, dzielnik liniowy =>    J=[0,0;0,0]',...
                  '2. Podw�jna warto�� w�asna 0, dzielnik nieliniowy =>     J=[0,1;0,0]',...
                  '3. Warto�� w�asna_1 < 0, w�asna_2 = 0 =>     J=[-1,0;0,0] ',...
                  '4. Warto�� w�asna_1 < 0, w�asna_2 < 0 =>     J=[-2,0;0,-1]',...
                  '5. Warto�� w�asna podw�jna < 0, dzielnik nieliniowy =>   J=[-1,1;0,-1]',...
                  '6. Warto�� w�asna podw�jna < 0, dzielnik liniowy =>  J=[-1,0;0,-1]',...
                  '7. Warto�� w�asna_1 > 0,  w�asna_2 < 0 =>    J=[-1,0;0,1]',...
                  '8. Para sprz�ona Re = 0 =>  J=[0,1;-1,0]',...
                  '9. Para sprz�ona Re < 0 =>  J=[-1,1;-1,-1]');
switch choice
%---------Wybrane macierze Jordana-------
case 1
%1 Podw�jna warto�� w�asna 0 dzielnik liniowy
J=[0,0;0,0];

case 2
%2 Podw�jna warto�� w�asna 0 dzielnik nieliniowy
J=[0,1;0,0];

case 3
%3 Warto�� w�asna_1<0 w�asna_2=0 
J=[-1,0;0,0];
%- Warto�� w�asna_1=0 w�asna_2<0
%J=[0,0;0,-1];

case 4
%4 Warto�� w�asna_1<0 w�asna_2<0 
J=[-2,0;0,-1];
%J=[-1,0;0,-5];

case 5
%5 Warto�� w�asna podw�jna < 0 dzielnik nieliniowy 
J=[-1,1;0,-1];
%J=[-4,1;0,-4];

case 6
%6 Warto�� w�asna podw�jna < 0 dzielnik liniowy 
J=[-1,0;0,-1];

case 7
%7  Warto�� w�asna_1 > 0  w�asna_2 < 0 
J=[-1,0;0,1];
%J=[-3,0;0,1];

case 8
%8 Para sprz�ona Re=0
J=[0,1;-1,0];

case 9
%9 Para sprz�ona Re<0
J=[-1,1;-1,-1];

end;

%MENU DO WYBORU WEKTOR�W W�ASNYCH
choice2 = menu('Wybierz macierz z wektorami w�asnymi:',...
                  '1. Macierz jednostkowa => P=eye(2)',...
                  '2. P=[1 1 ; 1 1]',...
                  '3. P=[1 1 ; 0 1]',...
                  '4. P=[1 0.5 ; 1 1]',...
                  '5. P=[0 0 ; 1 1]',...
                  '6. P=[1 0 ; 1 1]')
              
%---------R�ne wybrane wektory w�asne:---------
switch choice2
    case 1
P=eye(2); %macierz jednostkowa 2x2
    case 2
P=[1 1 ; 1 1];
    case 3
P=[1 1 ; 0 1];
    case 4
P=[1 0.5 ; 1 1];
    case 5
P=[0 0 ; 1 1];
    case 6
P=[1 0 ; 1 1];
end;


%--------------Tytu�y do wykres�w:----------------
tytuly={'1. Podw�jna warto�� w�asna 0, dzielnik liniowy',...
        '2. Podw�jna warto�� w�asna 0, dzielnik nieliniowy',...
        '3. Warto�� w�asna_1 = 0, w�asna_2 < 0',...
        '4. Warto�� w�asna_1 < 0, w�asna_2 < 0',...
        '5. Warto�� w�asna podw�jna < 0, dzielnik nieliniowy',...
        '6. Warto�� w�asna podw�jna < 0, dzielnik liniowy',...
        '7. Warto�� w�asna_1 > 0,  w�asna_2 < 0',...
        '8. Para sprz�ona Re = 0',...
        '9. Para sprz�ona Re < 0'};



%Obliczanie A na podstwie macierzy przej�cia P
A=P*J*P^-1;

figure(1);
subplot(1,2,1);
for z=0:(0.02*pi):(2*pi)
   
    WPC=[sin(z);cos(z)];
    temp=sim('model_lab2');
    
    %Dla niekt�rych warto�ci warto u�y� rysowania ze znacznikiem
    %plot(temp.x(:,1),temp.x(:,2),'blue-+')
    plot(temp.x(:,1),temp.x(:,2),'blue')
    xlabel("x1");
    ylabel("x2");
    title(tytuly(choice));
    hold on;
end  
%wykresy wektor�w w�asnych 
    hold on;
    plot([0 P(1,1)],[0 P(2,1)],'red'); 
    %P(1,1) oznacza warto�� z pierwszego wiersza i pierwszej kolumny
    %P(2,1) oznacza warto�� z drugiego wiersza i pierwszej kolumny
    %P(1,1),P(2,1) oznaczaj� 1 wektor w�asny z macierzy P
    hold on;
    plot([0 P(1,2)],[0 P(2,2)],'green');
    hold off;
    

subplot(1,2,2);
for z=0:(0.02*pi):(2*pi)
    
    Q=[abs(sin(z)), abs(cos(z))];
    p=max(Q);
    
    WPC=[sin(z)/p;cos(z)/p];
    temp=sim('model_lab2');
    
    %----------------------------------------------------------------------
    %Zmiana warto�ci w�asnych podczas rysowania
    %tutaj niestety trzeba wcze�niej poda� macierz jak� mamy zamiar wybra�
    %je�li chcemy obserwowa� zmiany wykresu zmieniaj�c warto�ci w�asne w ramachdanej struktury
    %   J=[(-1-z),0;0,0];       %dla opcji 3
    %   J=[(-2-z),0;0,(-1-z)]   %dla opcji 4
    %   J=[(-1-z),1;0,(-1-z)];  %dla opcji 5
    %   J=[(-1-z),0;0,(-1-z)];  %dla opcji 6 
    %   J=[(-1-z),0;0,(1+z)];   %dla opcji 7
    %   J=[0,(1+z);(-1-z),0];   %dla opcji 8
    %   J=[(-1-z),(1+z);(-1-z),(-1-z)]; %dla opcji 9
    
    %   A=P*J*P^-1;
    %   plot(temp.x(:,1),temp.x(:,2))
    %----------------------------------------------------------------------
    
    %Dla niekt�rych warto�ci warto u�y� rysowania ze znacznikiem
    %plot(temp.x(:,1),temp.x(:,2),'blue-+')
    plot(temp.x(:,1),temp.x(:,2),'blue')
    xlabel("x1");
    ylabel("x2");
    title(tytuly(choice));
    hold on;
    
end  
%wykresy wektor�w w�asnych
plot([0 P(1,1)],[0 P(2,1)],'red');
hold on;
plot([0 P(1,2)],[0 P(2,2)],'green');
hold off;



