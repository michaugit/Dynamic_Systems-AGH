function result = function_handle6( t, x )
%funkcja definiuj¹ca system zlinearyzowany dla zerowego punktu równowagi do przykladu 3
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = -2*x(1)-x(2);

end

