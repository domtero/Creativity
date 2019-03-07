function [Zout] = OffenseGaussian_Offense(X,Y,Zin,sigma,mag,Loc) % mag 10 originally
% Maybe: input X,Y, and current z. Then run test to see what gets added.
% C = A < B
% D = A.*~C+B.*C
%     x=linspace(-10, 10);
%     y=linspace(0, 10);
%     [X,Y]=meshgrid(x,y);
%     sigma_def = 0.5;
%     d = [0, 2];
%     dLoc = [0 2;-6 2; 6 2; 0 5; -6 5; 6 6];
    Zout = Zin;
    for i = 1:length(Loc)
        Z=(mag/sqrt(2*pi*sigma^2).*exp(-((X-Loc(i,1)).^2/(2*sigma^2))-((Y-Loc(i,2)).^2/(2*sigma^2)))); %(0, 2)
%         C = Zout < Z;
        Zout = Zout+Z;
    end
end

% function [Zout] = OffenseGaussian_Offense(X,Y,Zin,sigma,mag,Loc) % mag 30 originally
% %     x=linspace(-10, 10);
% %     y=linspace(0, 10);
% %     [X,Y]=meshgrid(x,y);
% %     sigma = 0.5;
% %     d = [0, 2];    
%     Zout = Zin;
%     for i = 1:length(Loc)
%         Z=(mag/sqrt(2*pi*sigma^2).*exp(-((X-Loc(i,1)).^2/(2*sigma^2))-((Y-Loc(i,2)).^2/(2*sigma^2)))); %(0, 2)
% %         C = Zout < Z;
%         Zout = Zout+Z;
%     end
% end