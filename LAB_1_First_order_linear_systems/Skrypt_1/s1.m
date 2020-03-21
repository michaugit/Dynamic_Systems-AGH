WPC=4;                           % warunek pocz¹tkowy
R=10;                            % opór [Om]
C=0.1;                           % pojemnoœæ [F]
K=1/(R*C);                       % sta³a przy równaniu ró¿niczkowym

open('michal_model_1_5_bez_sterowania')         % otwórz model simulink
temp=sim('michal_model_1_5_bez_sterowania');    % uruchom symulacjê


plot(temp.tout,temp.x)          % utwórz wykres i  sformatuj go
title('Symulacja obwodu RC')    % tytu³
xlabel('Czas [s]')              % oœ x
ylabel('Napiêcie [V]')          % oœ y
grid on                         % siatka
