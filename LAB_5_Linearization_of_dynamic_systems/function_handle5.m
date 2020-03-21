function result = function_handle5( t, x )
%funkcja definiuj¹ca system zlinearyzowany dla punktu [-2/3 0]^T dla przykladu 3
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = 2*x(1)-x(2);

end

