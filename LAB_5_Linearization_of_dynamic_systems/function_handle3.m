function result = function_handle3( t, x )
%funkcja definiuj¹ca rownanie rozniczkowe przyklad 3
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = -2 * x(1) - 3 * x(1)^2 - x(2);
end

