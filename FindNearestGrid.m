function [resultX,resultY] = FindNearestGrid(X,Y,x,y) %x,y are point.
    d = (x-X).^2+(y-Y).^2; %// compute squared distances
    [~, ind] = min(d(:)); %// minimize distance and obtain (linear) index of minimum
    resultX = X(ind); %// use that index to obtain the result
    resultY = Y(ind);
end