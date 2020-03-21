%Oscylator Van der Pola
function result = handle_vanderpol( x )
    global eps;
    result(1,1)=x(2,1);
    result(2,1)=-x(1,1)+eps*x(2,1)*(1-x(1,1)^2);
end

