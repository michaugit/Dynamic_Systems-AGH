function result = function_handle6( t, x )
%funkcja definiuj�ca system zlinearyzowany dla zerowego punktu r�wnowagi do przykladu 3
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = -2*x(1)-x(2);

end

