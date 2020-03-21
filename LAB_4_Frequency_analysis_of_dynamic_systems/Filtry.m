%Czyszczenie
clc;
close all;
clear;

%Zdefiniowanie ró¿nych filtrów
%Oraz zapisanie ró¿nych filtrów do cell Array aby móc z nich korzystaæ w pêlach
ArrayL = cell(1,4);
ArrayM = cell(1,4);
%Dolnoprzepustowy
L=[0 1];
M=[4 1];
ArrayL{1}=L;
ArrayM{1}=M;
%Górnoprzepustowy
L=[0.4 0];
M=[0.4 1];
ArrayL{2}=L;
ArrayM{2}=M;
%Pasmoprzepustowy
L=[1 0];
M=[1 2 1];
ArrayL{3}=L;
ArrayM{3}=M;
%Filtr drugiego rzêdu
L=[0 1];
M=[1 0.1 1];
ArrayL{4}=L;
ArrayM{4}=M;


%Wyœwietlanie charakterystyki tych systemu za pomoc¹ funkcji bode
% subplot(2,2,1);
% 
% bode(fil_lowpass);
% title('Dolnoprzepustowy');
% subplot(2,2,2);
% 
% bode(fil_upperpass);
% title('Górnoprzepustowy');
% subplot(2,2,3);
% 
% bode(fil_rangepass);
% title('Pasmoprzepustowy');
% subplot(2,2,4);
% 
% bode(fil_secnd);
% title('Filtr drugiego rzêdu');
% WYKRESY BODE POJAWIAJ¥ SIÊ TAK¯E W PÊTLACH NI¯EJ- WIÊC ZAKOMENTOWANE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

titles={'Dolnoprzepustowy','Górnoprzepustowy','Pasmoprzepustowy','Filtr drugiego rzêdu'};
%Sin czêstotliwoœæ (f-frequnecy), Amplituda (A- Ampitude), faza(p-pahse)
v_f=[0.001 1 30 0.01 5];
v_A=[2 3 1 2 4];
v_p=[1 5 2 1 0];

%inicjalizacjia Array'a do sumowania sygna³ów
ArrayOfControlOuts = cell(1,4);
ArrayOfStateOuts = cell(1,4);
for k=1:4
    ArrayOfControlOuts{k}=0;
    ArrayOfStateOuts{k}=0;
end;

 for z=1:4
    L=ArrayL{z};
    M=ArrayM{z};
    figure;
      
    for i=1:6
        if i<6
        f=v_f(i);
        A=v_A(i);
        p=v_p(i);
        
        subplot(2,3,i);
        
        %Symulacja
        sim('model_2');
        
        %zapis do sumowania
        ArrayOfControlOuts{z}=ArrayOfControlOuts{z}+out(:,1);
        ArrayOfStateOuts{z}=ArrayOfStateOuts{z}+out(:,2);

        %Wykres stanu i sterowania
        plot(tout,out(:,1));
        hold on;
        plot(tout,out(:,2));
        hold on;
        xlabel('czas');
        ylabel('amplituda');
        legend('Sterowanie','Stan');
        title([strcat(titles(z)),strcat('f=', num2str(f),', A=',num2str(A),', p=',num2str(p))]);
        else
            subplot(2,3,i);
            bode(tf(L,M));
            title(strcat(titles(z) , ' - "bode"'));
        end;        
    end;
end;

%suma sygna³ów
figure;
for j=1:4
    subplot(2,2,j);
    plot(tout,ArrayOfControlOuts{j});
    hold on;
    plot(tout,ArrayOfStateOuts{j});
    hold on;
    xlabel('czas');
    ylabel('amplituda');
    legend('Sterowanie','Stan');
    title(strcat(titles(j),' - suma sygna³ów'));
end;
    





















        