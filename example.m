% example.m
%
% This is a minimal working example which produces a map of Eastern North
% America using all of the matmap functions. It takes about 30 seconds to
% run on a 2017 MacBook Pro
%
%--------------------------------------------------------------------------
% Last updated 7/22/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

clear,clc

% Define the lat/lon bounds
latBounds = [20 55];
lonBounds = [-100 -60];

% Load in the topography data
[lon,lat,z] = loadtopo(lonBounds,latBounds);

% Load in the coastline data
coasts = loadcoasts('l');

% Load in the border data
borders = loadborders('h');

% Load in the lake data
lakes = loadlakes('l');

% Plot the map
imagesc(lon,lat,z)
ax1 = gca;
ax1.YDir = 'normal';
ax1.TickDir = 'out';
hold on
geoshow([coasts.Lat],[coasts.Lon],'Color',[0.25 0.25 0.25],'LineWidth',0.5)
for i = 1:length(lakes)
    fill(lakes(i).X(1:end-1),lakes(i).Y(1:end-1),[205 255 253]/255,...
        'LineWidth',0.5,'EdgeColor',[0.25 0.25 0.25]);
end

% Make the colorbar
cmap = colortopo(z);
colormap(cmap)
colorbar