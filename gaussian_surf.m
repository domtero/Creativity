%%
close all; clear all; clc;

x=linspace(-10, 10);
y=linspace(0, 10);
[X,Y]=meshgrid(x,y);
sigma_def = 0.5;
d1 = [0, 2];
d2 = [-6,2];
d3 = [6, 2];
d4 = [0, 5];
d5 = [-6, 5];
d6 = [6, 5];
z1=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d1(1)).^2/(2*sigma_def^2))-((Y-d1(2)).^2/(2*sigma_def^2)))); %(0, 2)
z2=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d2(1)).^2/(2*sigma_def^2))-((Y-d2(2)).^2/(2*sigma_def^2)))); %(-6, 2)
z3=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d3(1)).^2/(2*sigma_def^2))-((Y-d3(2)).^2/(2*sigma_def^2)))); %(6, 2)
z4=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d4(1)).^2/(2*sigma_def^2))-((Y-d4(2)).^2/(2*sigma_def^2)))); %(0, 5)
z5=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d5(1)).^2/(2*sigma_def^2))-((Y-d5(2)).^2/(2*sigma_def^2)))); %(-6, 5)
z6=(10/sqrt(2*pi*sigma_def^2).*exp(-((X-d6(1)).^2/(2*sigma_def^2))-((Y-d6(2)).^2/(2*sigma_def^2)))); %(6, 5)
surf(X,Y,z1); hold on;
surf(X,Y,z2);
surf(X,Y,z3);
surf(X,Y,z4);
surf(X,Y,z5);
surf(X,Y,z6);
shading interp
axis tight
%title('defense player potential field')

%%
x=linspace(-10, 10);
y=linspace(0, 10);
[X,Y]=meshgrid(x,y);
sigma = 3;
o1 = [0, 2];
o2 = [-6,2];
o3 = [6, 2];
o4 = [0, 5];
o5 = [-6, 5];
o6 = [6, 5];
z1=(30/sqrt(2*pi*sigma^2).*exp(-((X-o1(1)).^2/(2*sigma^2))-((Y-o1(2)).^2/(2*0.25)))); %(0, 2)
z2=(30/sqrt(2*pi*sigma^2).*exp(-((X-o2(1)).^2/(2*sigma^2))-((Y-o2(2)).^2/(2*0.25)))); %(-6, 2)
%z3=(30/sqrt(2*pi*sigma^2).*exp(-((X-o3(1)).^2/(2*sigma^2))-((Y-o3(2)).^2/(2*0.25)))); %(6, 2)
z4=(30/sqrt(2*pi*sigma^2).*exp(-((X-o4(1)).^2/(2*sigma^2))-((Y-o4(2)).^2/(2*0.25)))); %(0, 5)
z5=(30/sqrt(2*pi*sigma^2).*exp(-((X-o5(1)).^2/(2*sigma^2))-((Y-o5(2)).^2/(2*0.25)))); %(-6, 5)
z6=(30/sqrt(2*pi*sigma^2).*exp(-((X-o6(1)).^2/(2*sigma^2))-((Y-o6(2)).^2/(2*0.25)))); %(6, 5)
surf(X,Y,z1); hold on;
surf(X,Y,z2);
%surf(X,Y,z3);
surf(X,Y,z4);
surf(X,Y,z5);
surf(X,Y,z6);
shading interp
axis tight
%title('offense teammate player potential field')

%%
zgoal = -15 + (X./2).^2 + (Y./2).^2;
zflat = X.*0;
surf(X,Y,zgoal);hold on;
surf(X,Y,zflat);
shading interp
colormap jet
axis tight
%title('goal potential field')
title('gradient field superposition');