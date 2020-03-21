WPC=4;                           % warunek pocz�tkowy
R=10;                            % op�r [Om]
C=0.1;                           % pojemno�� [F]
K=1/(R*C);                       % sta�a przy r�wnaniu r�niczkowym

open('michal_model_1_5_bez_sterowania')         % otw�rz model simulink
temp=sim('michal_model_1_5_bez_sterowania');    % uruchom symulacj�


plot(temp.tout,temp.x)          % utw�rz wykres i  sformatuj go
title('Symulacja obwodu RC')    % tytu�
xlabel('Czas [s]')              % o� x
ylabel('Napi�cie [V]')          % o� y
grid on                         % siatka
