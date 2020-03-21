function output = euler(wsk, x0, T, dt)
    
    t = T(1):dt:T(2);
    X = x0; 
    prevX = x0;
    
    for i = 1:length(t) - 1
        nextX = prevX + feval(wsk, prevX)*dt;
        X = [X nextX]; 
        prevX = nextX; 
    end 

    output = X; 
end