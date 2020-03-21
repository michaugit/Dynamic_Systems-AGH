function result = function_handle4( t, x )
%funkcja definiuj¹ca jedyny punkt równowagi dla systemu zlinearyzowanego dla przykladu 2
    result = zeros(size(x));
    result(1)=-x(1);
    result(2)=0;

end

