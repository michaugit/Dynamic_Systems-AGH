function result = function_handle2( t, x )
%funkcja definiuj¹ca rownanie rozniczkowe przyklad 2
    result = zeros(size(x));
    result(1) = -x(1);
    result(2) = -x(2)^2;
end

