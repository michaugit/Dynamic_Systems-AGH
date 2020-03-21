%czyszczenie
clc;
close all;
clear;
%-------------------------
%Zadanie 5- ustawienie parametrów 
amplituda=1;
czestotliwosc=(2*pi*10); 
%(poniewa¿ bez tego nie mo¿na uruchomiæ wszystkiego ;)
%-------------------------






%*************************************************************************
%Zadanie 1
%Analizuj¹c uk³ad ze sterowaniem równym 0 (uk³ad autonomiczny) zbadaæ 
%wp³yw parametrów: R, C, WPC na zachowanie siê uk³adu

%StepBlock parametry:
StepTime=1;
InitialValue=0;
FinalValue=0;
SampleTime=0;
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz¹tkowy
R=1000;                            % opór [Om]
C=0.001;                           % pojemnoœæ [F]
K=1/(R*C);                         % sta³a przy równaniu ró¿niczkowym
%--------------------------------------------------------------------------
open('michal_model_1_5')         % otwórz model simulink
temp=sim('michal_model_1_5');    % uruchom symulacjê

figure(1)
plot(temp.tout,temp.x,'r')              % utwórz wykres i go sformatuj
title('Symulacja obwodu RC - uk³ad autonomiczny, sterowanie=0')  % tytu³
xlabel('Czas [s]')                      % oœ x
ylabel('Napiêcie [V]')                  % oœ y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   %zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego siê tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do³o¿ wykres sterowania
legend("Stan","Sterowanie")             %legenda
hold off;

%Model opisuje zmianê napiêcia (roz³adowywane siê) na kondensatorze w obwodzie RC,
%zaczynaj¹c z napiêciem V=WPC, na kondensatorze o pojemnoœci C i rezystorze o oporze R.
%Jeœli napiêcie sterowanie jest równe 0 przez ca³y czas to  nie ma ¿adnego wp³ywu na system.




%*************************************************************************
%Zadanie 2
%Dla WPC=0 przeanalizowaæ zachowanie siê uk³adu dla ró¿nych wartoœci 
%sta³ego sterowania rozpoczynaj¹cego siê w chwili t=0.

%StepBlock parametry:
StepTime=1;
InitialValue=5;                     % wartoœci sterowania
FinalValue=5;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=0;                             % warunek pocz¹tkowy
R=1000;                            % opór [Om]
C=0.001;                           % pojemnoœæ [F]
K=1/(R*C);                         % sta³a przy równaniu ró¿niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otwórz model simulink
temp=sim('michal_model_1_5');    % uruchom symulacjê

figure(2)
plot(temp.tout,temp.x,'r')              % utwórz wykres i go sformatuj
title('Symulacja obwodu RC - WPC=0, sterowanie=5 (const)')            % tytu³
xlabel('Czas [s]')                      % oœ x
ylabel('Napiêcie [V]')                  % oœ y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego siê tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do³o¿ wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obwód ze Ÿród³em pr¹du sta³ego
% Kondensator ³aduje siê asymptotycznie,
% Napiêcie na kondensatorze bêdzie równe napiêciu Ÿród³a 
% w „nieskoñczonym czasie”- d¹¿y do niego.





%*************************************************************************
%Zadanie 3
%Dla sterowania równego 1 rozpoczynaj¹cego siê w chwili t=0 przeanalizowaæ 
%zachowaniesiê uk³adu dla ró¿nych wartoœci WPC.

%StepBlock parametry:
StepTime=0;
InitialValue=1;                     % wartoœci sterowania
FinalValue=1;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz¹tkowy
R=1000;                            % opór [Om]
C=0.001;                           % pojemnoœæ [F]
K=1/(R*C);                         % sta³a przy równaniu ró¿niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otwórz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacjê

figure(3)
plot(temp.tout,temp.x,'r')              % utwórz wykres i go sformatuj
title('Symulacja obwodu RC - sterowanie=1 (const)')   % tytu³
xlabel('Czas [s]')                      % oœ x
ylabel('Napiêcie [V]')                  % oœ y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego siê tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do³o¿ wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obwód ze Ÿród³em pr¹du sta³ego
% Kondensator jest na³adowany napiêciem WPC,
% Napiêcie na kondensatorze z czasem zbli¿y siê do napiêcia Ÿród³a,
% bêdzie równe napiêciu Ÿród³a w „nieskoñczonym czasie”- d¹¿y do niego.





%*************************************************************************
%Zadanie 4
%Przeanalizowaæ zachowanie siê uk³adu dla sygna³u skokowego postaci:
%s=3 dla t?[0,5] i s=0 dla t > 5 i ró¿nych wartoœci R i C oraz WPC=0.

%StepBlock parametry:
StepTime=5;                         % czas po jakim nastêpuje zmiana
InitialValue=3;                     % wartoœci sterowania
FinalValue=0;                       % 
SampleTime=0;
%--------------------------------------------------------------------------
WPC=0;                             % warunek pocz¹tkowy
R=1000;                            % opór [Om]
C=0.002;                           % pojemnoœæ [F]
K=1/(R*C);                         % sta³a przy równaniu ró¿niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otwórz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacjê

figure(4)
plot(temp.tout,temp.x,'r')              % utwórz wykres i go sformatuj
title('Symulacja obwodu RC - sygna³ sterowania skokowy')            % tytu³
xlabel('Czas [s]')                      % oœ x
ylabel('Napiêcie [V]')                  % oœ y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego siê tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do³o¿ wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Model pokazuje obwód ze Ÿród³em pr¹du, który zmienia siê w czasie 5
% sekundy.
% Kondensator pocz¹tkowo jest pusty.
% Napiêcie na kondensatorze z czasem zbli¿a siê do napiêcia Ÿród³a,
% ale po odciêciu Ÿród³a zasilania, w 5 sekundzie- 
% napiêcie kondensatora zaczyna spadaæ do 0.





%*************************************************************************
%Zadanie 5 ===>USTAWIÆ SWITCH'a na "SIN WAVE"<====
% Przy pomocy bloczka Sine Wave zbadaæ zachowanie uk³adu gdy sygna³ steruj¹cy 
% przyjmujepostaæ sinusoidy o amplitudzie 1 oraz czêstotliwoœci 10 Hz 
% dla ró¿nych wartoœci parametrów R i C. 
% Analizê przeprowadziæ dla czasu symulacji wiêkszego ni¿ 
% 5 razy najwiêkszy rozpatrywany iloczyn R*C =>(2*5 = 10).

%Sine wave parametry:
amplituda=1;
czestotliwosc=(2*pi*10);           %10Hz, ale zmienna ma byæ w rad/s
%--------------------------------------------------------------------------
WPC=4;                             % warunek pocz¹tkowy
R=100;                             % opór [Om]
C=0.002;                           % pojemnoœæ [F]
K=1/(R*C);                         % sta³a przy równaniu ró¿niczkowym
%--------------------------------------------------------------------------
%open('michal_model_1_5')         % otwórz model simulink
temp=sim('michal_model_1_5');     % uruchom symulacjê

figure(5)
plot(temp.tout,temp.x,'r')              % utwórz wykres i go sformatuj
title('Symulacja obwodu RC - sygna³ steruj¹cy sinusoidalny')            % tytu³
xlabel('Czas [s]')                      % oœ x
ylabel('Napiêcie [V]')                  % oœ y
grid on                                 % siatka
hold on                                 % zostaw obecny wykres, kiedy dodawany jest nowy
temp.sterowanie=temp.sterowanie(:,:);   % zmiana zmiennej na jeden wymiar (nie wiadomo dlaczego siê tak dzieje)
plot(temp.tout,temp.sterowanie,'g')     % do³o¿ wykres sterowania
legend("Stan","Sterowanie")             % legenda
hold off;

% Napiêcie kondensatora zbli¿a siê do œredniej napiêcia Ÿród³owego 
% i "próbuje pod¹¿aæ" za zmianami napiêcia w czasie.
















