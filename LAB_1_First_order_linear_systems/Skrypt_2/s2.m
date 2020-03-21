%czyszczenie
clc;
close all;
clear;
%-------------------------
%Zadanie 5- ustawienie parametr�w 
amplituda=1;
czestotliwosc=(2*pi*10); 
%(poniewa� bez tego nie mo�na uruchomi� wszystkiego ;)
%-------------------------






%*************************************************************************
%Zadanie 1
%Analizuj�c uk�ad ze sterowaniem r�wnym 0 (uk�ad autonomiczny) zbada� 
%wp�yw parametr�w: R, C, WPC na zachowanie si� uk�adu

%StepBlock parametry:
StepTime=1;
InitialValue=0;
FinalValue=0;
SampleTime=0;
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz�tkowy
R=1000;                            % op�r [Om]
C=0.001;                           % pojemno�� [F]
K=1/(R*C);                         % sta�a przy r�wnaniu r�niczkowym
%--------------------------------------------------------------------------
open('michal_model_1_5')         % otw�rz model simulink
temp=sim('michal_model_1_5');    % uruchom symulacj�

figure(1)
plot(temp.tout,temp.x,'r')              % utw�rz wykres i go sformatuj
title('Symulacja obwodu RC - uk�ad autonomiczny, sterowanie=0')  % tytu�
xlabel('Czas [s]')                      % o� x
ylabel('Napi�cie [V]')                  % o� y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   %zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego si� tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do�o� wykres sterowania
legend("Stan","Sterowanie")             %legenda
hold off;

%Model opisuje zmian� napi�cia (roz�adowywane si�) na kondensatorze w obwodzie RC,
%zaczynaj�c z napi�ciem V=WPC, na kondensatorze o pojemno�ci C i rezystorze o oporze R.
%Je�li napi�cie sterowanie jest r�wne 0 przez ca�y czas to  nie ma �adnego wp�ywu na system.




%*************************************************************************
%Zadanie 2
%Dla WPC=0 przeanalizowa� zachowanie si� uk�adu dla r�nych warto�ci 
%sta�ego sterowania rozpoczynaj�cego si� w chwili t=0.

%StepBlock parametry:
StepTime=1;
InitialValue=5;                     % warto�ci sterowania
FinalValue=5;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=0;                             % warunek pocz�tkowy
R=1000;                            % op�r [Om]
C=0.001;                           % pojemno�� [F]
K=1/(R*C);                         % sta�a przy r�wnaniu r�niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otw�rz model simulink
temp=sim('michal_model_1_5');    % uruchom symulacj�

figure(2)
plot(temp.tout,temp.x,'r')              % utw�rz wykres i go sformatuj
title('Symulacja obwodu RC - WPC=0, sterowanie=5 (const)')            % tytu�
xlabel('Czas [s]')                      % o� x
ylabel('Napi�cie [V]')                  % o� y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego si� tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do�o� wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obw�d ze �r�d�em pr�du sta�ego
% Kondensator �aduje si� asymptotycznie,
% Napi�cie na kondensatorze b�dzie r�wne napi�ciu �r�d�a 
% w �niesko�czonym czasie�- d��y do niego.





%*************************************************************************
%Zadanie 3
%Dla sterowania r�wnego 1 rozpoczynaj�cego si� w chwili t=0 przeanalizowa� 
%zachowaniesi� uk�adu dla r�nych warto�ci WPC.

%StepBlock parametry:
StepTime=0;
InitialValue=1;                     % warto�ci sterowania
FinalValue=1;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz�tkowy
R=1000;                            % op�r [Om]
C=0.001;                           % pojemno�� [F]
K=1/(R*C);                         % sta�a przy r�wnaniu r�niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otw�rz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacj�

figure(3)
plot(temp.tout,temp.x,'r')              % utw�rz wykres i go sformatuj
title('Symulacja obwodu RC - sterowanie=1 (const)')   % tytu�
xlabel('Czas [s]')                      % o� x
ylabel('Napi�cie [V]')                  % o� y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego si� tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do�o� wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obw�d ze �r�d�em pr�du sta�ego
% Kondensator jest na�adowany napi�ciem WPC,
% Napi�cie na kondensatorze z czasem zbli�y si� do napi�cia �r�d�a,
% b�dzie r�wne napi�ciu �r�d�a w �niesko�czonym czasie�- d��y do niego.





%*************************************************************************
%Zadanie 4
%Przeanalizowa� zachowanie si� uk�adu dla sygna�u skokowego postaci:
%s=3 dla t?[0,5] i s=0 dla t > 5 i r�nych warto�ci R i C oraz WPC=0.

%StepBlock parametry:
StepTime=5;                         % czas po jakim nast�puje zmiana
InitialValue=3;                     % warto�ci sterowania
FinalValue=0;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=0;                             % warunek pocz�tkowy
R=1000;                            % op�r [Om]
C=0.002;                           % pojemno�� [F]
K=1/(R*C);                         % sta�a przy r�wnaniu r�niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otw�rz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacj�

figure(4)
plot(temp.tout,temp.x,'r')              % utw�rz wykres i go sformatuj
title('Symulacja obwodu RC - sygna� sterowania skokowy')            % tytu�
xlabel('Czas [s]')                      % o� x
ylabel('Napi�cie [V]')                  % o� y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego si� tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do�o� wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obw�d ze �r�d�em pr�du, kt�ry zmienia si� w czasie 5
% sekundy.
% Kondensator pocz�tkowo jest pusty.
% Napi�cie na kondensatorze z czasem zbli�a si� do napi�cia �r�d�a,
% ale po odci�ciu �r�d�a zasilania, w 5 sekundzie- 
% napi�cie kondensatora zaczyna spada� do 0.





%*************************************************************************
%Zadanie 5 ===>USTAWI� SWITCH'a na "SIN WAVE"<====
% Przy pomocy bloczka Sine Wave zbada� zachowanie uk�adu gdy sygna� steruj�cy 
% przyjmujeposta� sinusoidy o amplitudzie 1 oraz cz�stotliwo�ci 10 Hz 
% dla r�nych warto�ci parametr�w R i C. 
% Analiz� przeprowadzi� dla czasu symulacji wi�kszego ni� 
% 5 razy najwi�kszy rozpatrywany iloczyn R*C =>(2*5 = 10).

%Sine wave parametry:
amplituda=1;
czestotliwosc=(2*pi*10);           %10Hz, ale zmienna ma by� w rad/s
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz�tkowy
R=100;                             % op�r [Om]
C=0.002;                           % pojemno�� [F]
K=1/(R*C);                         % sta�a przy r�wnaniu r�niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otw�rz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacj�

figure(5)
plot(temp.tout,temp.x,'r')              % utw�rz wykres i go sformatuj
title('Symulacja obwodu RC - sygna� steruj�cy sinusoidalny')            % tytu�
xlabel('Czas [s]')                      % o� x
ylabel('Napi�cie [V]')                  % o� y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego si� tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do�o� wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Napi�cie kondensatora zbli�a si� do �redniej napi�cia �r�d�owego 
% i "pr�buje pod��a�" za zmianami napi�cia w czasie.
















