clc;
close all;
clear;

step_size=0.01;

%oprocentowanie
int_rate=0.04;

%ca³kowite oprocentowanie
total_intrest=1+int_rate;
A=total_intrest;

%Sterowanie = 0
B=0;
D=0;
%y=x 
C=1;


%Kapita³ pocz¹tkowy
Start=10000;

%Czas kapitalizacji (1*12- to co 12msc ; 0,5*12 to co 6 miesiêcy itd...)
rates=[1, 0.5,0.4, 0.3 , 0.2 ];

numb_of_rates=length(rates);

%Kalkulacja zmiany stanu konta bankowego dla ka¿dej kapitalizacji
names=strings(1,numb_of_rates);
for i=1:numb_of_rates
    cap_rate=rates(i);
    h=cap_rate;
    
    sim('bank_model');
    plot(tout,x);
    hold on;
    if i==1
        names(i)= "Kapitalizacja co " + rates(i)+ " rok";
    else
        names(i)= "Kapitalizacja co " + rates(i)+ " roku";
    end
    
end
title({'Kapitalizacja odsetek',['Kapita³ pocz¹tkowy=',num2str(Start)], ['Oprocentowanie=' , num2str(int_rate) ] });
legend(names);
xlabel('Czas');
ylabel('Stan konta');


