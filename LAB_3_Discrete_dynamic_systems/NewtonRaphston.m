clc;
close all;
clear;


%Ustawienie maksymalnej liczby iteracji:
ite=8;
%Ustawienie precyzji wyszukiwania rozwi¹zania równania:
eps=0.0000001;

%Punkt startowy:
start=-1;

%Równanie w którym szukamy pierwiastków:
equ=@(x) x^3-2*x^2-11*x+12;
%Pochodna równania:
equ_prim=@(x) 3*x^2-4*x-11;

%Ustawienie parametrów:
last_x=start;
new_x=last_x-(equ(last_x)/equ_prim(last_x));

%Wyszukiwanie pierwiastków równania zdefiniowanym zestawem regu³:
while( abs(equ(last_x))>eps && abs(last_x-new_x)>=eps && ite > 0)
    last_x=new_x;
    new_x=last_x-(equ(last_x)/equ_prim(last_x));
    ite=ite-1;  
end

if abs(equ(last_x))<=eps
    disp('Znaleziono rozwi¹zanie:');
    disp(["x=",num2str(new_x)]);
    disp(["f(x)=",num2str(equ(new_x))]);
else
    disp('Nie znaleziono rozwi¹zania');
end
%%