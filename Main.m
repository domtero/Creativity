%% Combining Surfaces
%% Initialize
close all; clear all; clc;

x=linspace(-10, 10, 200);
y=linspace(0, 10, 100);
[X,Y]=meshgrid(x,y);
Ztot = X.*0-25; %default to very low value that will always be exceeded.
%% Pull to Goal
% zgoal = -15 + (X./2).^2 + (Y./2).^2;
% zflat = X.*0;
Ztot = Setting_Offense(X,Y,Ztot,-10,5,5);
figure()
hold on
surf(X,Y,Ztot);
hold off
%% Gaussians of Defense
sigma_def = 0.3;
% Defense Locations
dLoc = [0 2;-6 2; 6 2; 0 5; -6 5; 6 5];
% Gaussian Distributions from Defense
mag = 10;
Ztot = DefenseGaussian_Offense(X,Y,Ztot,sigma_def,mag,dLoc);

figure()
hold on
surf(X,Y,Ztot);
hold off
%% Gaussians of Offense
% Offense Locations
oLoc = [0 2;-6 2; 6 2; 0 5; -6 5; 6 5];
% Gaussian Distributions from Offense
mag = 50; sigma = 3;
Ztot = OffenseGaussian_Offense(X,Y,Ztot,sigma,mag,oLoc);

figure()
hold on
surf(X,Y,Ztot);
hold off

%% Gradient Testing
% normalize gradient, multiply by constant velocity to get velocity vector.
gradient(Ztot)