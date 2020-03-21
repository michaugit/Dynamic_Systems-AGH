
%Wybór konkretnego zadania ze sprawozdania:
choice = menu('Wybierz zadanie:',...
              'Zadanie 1 Symulacja Lorenz i Van Der Pol            ',...
              'Zadanie 2 System Van der Pol dla ro¿nych epsilon',...
              'Zadanie 3 system ax-x3                                           ',...
              'Zadanie 4 Ciekawe przypadki portretów fazowych');

switch choice
    %% zadanie 1
    case 1
        
        clear;
        
        %deklaracja epsilona do funkcji symulujacej oscylatpor Van der Pola
        global eps;
        eps = 1;
        
        %Warunki poczatkowe
        init_cond_1=[ linspace(-5, 5, 45); linspace(-5, 5, 45)];
        % czas poczatkowy, koncowy i przedzial miedzy kolejnymi czasami
        t_0 = 0;
        t_k = 10;
        t_skok = 1/50;

        figure;
        subplot(1,2,1);
        hold on;
        for i=1:length(init_cond_1)
            X=euler(@handle_vanderpol, [init_cond_1(1,i);init_cond_1(2,i)],[t_0 t_k], t_skok);
            plot(X(1,:),X(2,:), 'b');
        end
        axis([-5 5 -5 5]);       % ustawienie parametrow wykresu
        title('Oscylator Van der Pola');
        xlabel('x1');
        ylabel('x2');
        grid on;
        hold off;
        
        % symalacja dla systemu lorenza
        clear;
      
        % wartosci czasowe
        t_0 = 0;
        t_k = 10;
        t_skok = 1/100;
        
        % zmienne do wzoru
        global sigma;
        global b;
        global r;
        
        sigma = 10;
        b = 8/3;
        r = 28;
        
        %rysowanie wykresów
        subplot(1,2,2);
        hold on;
        

        X=euler(@handle_lorenz, [1;2;20],[t_0 t_k], t_skok);
        plot3(X(1,:),X(2,:),X(3,:),'b');

        %ustawienia wykresu
        %axis([-20 20 -20 20 0 40]);
        title('System Lorenza');
        view([1 -5 3]);
        grid on;
        hold off;

     %% zadanie 2
    case 2
        clear;
        
        %Warunki poczatkowe
        init_cond_1=[ linspace(-5, 5, 45); linspace(-5, 5, 45)];
        % czas poczatkowy, koncowy i przedzial miedzy kolejnymi czasami
        t_0 = 0;
        t_k = 10;
        t_skok = 1/50;
        
        %wektor z kolejnymi epsilonami
        global eps;
        epsilon = [-40, -5, -1, 0, 1, 3, 5, 50];
        figure;
        for k=1:length(epsilon)
            subplot(2,4,k);
            hold on;
            for i=1:length(init_cond_1)
                eps=epsilon(k);
                X=euler(@handle_vanderpol, [init_cond_1(1,i);init_cond_1(2,i)],[t_0 t_k], t_skok);
                plot(X(1,:),X(2,:), 'b');
            end
            axis([-5 5 -5 5]);       % ustawienie parametrow wykresu
            title([{'Van der Pol'},strcat('epsilon = ', num2str(epsilon(k)))]);
            xlabel('x1');
            ylabel('x2');
            grid on;
            hold off;
        end
        
    %% Zadanie 3
    case 3
        clear;
        global a;
        
        %Warunki poczatkowe
        init_cond_1=[linspace(-10,10,20)];
        
        % czas poczatkowy, koncowy i przedzial miedzy kolejnymi czasami
        t_0 = 0;
        t_k = 10;
        t_skok = 1/100;
        
        
        
        AXIS_3=[0 5 -3 3];
        figure;
        a=-1;   % wykres z wzpolczynnikiem a=-1
        subplot(4,1,1);
        hold on;

        for i=1:length(init_cond_1)
            X=euler(@handle_axx3, init_cond_1(i),[t_0 t_k], t_skok);
            plot(t_0:t_skok:t_k,X);
        end

        axis(AXIS_3);       % ustawienie parametrow wykresu
        title('a=-1');
        xlabel('t');
        ylabel('x');
        hold off;

        a=0;
        subplot(4,1,2);
        hold on;            % wykres z wzpolczynnikiem a=0
        for i=1:length(init_cond_1)
            X=euler(@handle_axx3, init_cond_1(i),[t_0 t_k], t_skok);
            plot(t_0:t_skok:t_k,X);
        end
        
        axis(AXIS_3);       % ustawienie parametrow wykresu
        title('a=0');
        xlabel('t');
        ylabel('x');
        hold off;
        
        a=1;        % wykres z wzpolczynnikiem a=1
        subplot(4,1,3);
        hold on;
        for i=1:length(init_cond_1)
            X=euler(@handle_axx3, init_cond_1(i),[t_0 t_k], t_skok);
            plot(t_0:t_skok:t_k,X);
        end
        
        axis(AXIS_3);       % ustawienie parametrow wykresu
        title('a=1');
        xlabel('t');
        ylabel('x');
        hold off;
        
        subplot(4,1,4)
        title('Zaleznosc pkt. rownowagi od a');
        hold on;
        line([-5 5], [0 0]);
        plot(0:0.1:5,sqrt(0:0.1:5), 'r');
        plot(0:0.1:5,-sqrt(0:0.1:5), 'g');
        axis([-5 5 -5 5]);
        xlabel('a');
        ylabel('x');
        hold off;

        
    %% Zadanie 4
    case 4
        clear;
        global sigma;
        global b;
        global r;
        % wartosci czasowe
        t_0 = 0;
        t_k = 10;
        t_skok = 1/100;
        
        % Ciekawy Przypadek 1
        sigma=-2;
        b=5;
        r=20;
        
        figure;
        subplot(1,3,1);
        hold on;
        
        X=euler(@handle_lorenz, [1;2;20],[t_0 t_k], t_skok);
        plot3(X(1,:),X(2,:),X(3,:),'b');
        
        %ustawienia wykresu
        title('Ciekawy Lorenz 1');
        view([1 -5 3]);
        grid on;
        hold off;
        
        % Ciekawy przypadek 2
        sigma=-10;
        b=100;
        r=50;
        
        subplot(1,3,2);
        hold on;
        X=euler(@handle_lorenz, [1;2;20],[t_0 t_k], t_skok);
        plot3(X(1,:),X(2,:),X(3,:),'b');
       
        %ustawienia wykresu
        title('Ciekawy Lorenz 2');
        view([1 -5 3]);
        grid on;
        hold off;
        
        % Ciekawy przypadek 3
        sigma=-1;
        b=0.5;
        r=50;
        
        subplot(1,3,3);
        hold on;
        X=euler(@handle_lorenz, [1;2;20],[t_0 t_k], t_skok);
        plot3(X(1,:),X(2,:),X(3,:),'b');
       
        %ustawienia wykresu
        title('Ciekawy Lorenz 3');
        view([1 -5 3]);
        grid on;
        hold off;
end