function [Zout] = Setting_Offense(X,Y,Zin,depress,flattenX,flattenY) % originally depress -15, flatten 2
    Zgoal = depress + (X./flattenX).^2 + (Y./flattenY).^2;
    Zbarrier = 5*sqrt(max(1.^2 - X.^2 - Y.^2, 0));
    
    C = Zin < Zgoal;
    Zout1 = Zin.*~C+Zgoal.*C;
%     C = Zout1 < Zbarrier
%     Zout = Zout1.*~C+Zbarrier.*C;
    Zout = Zout1 + Zbarrier;
end