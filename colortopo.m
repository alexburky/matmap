function [cmap] = colortopo(z)
% COLORTOPO Generate a colormap from elevation data for the Earth.
%
% >> [cmap] = COLORTOPO(z)
%
%---Input Variables--------------------------------------------------------
% z     - matrix containing elevation data
%
%---Output Variables-------------------------------------------------------
% cmap  - the colormap
%
%--------------------------------------------------------------------------
% Last updated 7/22/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

% Get min/max elevation in dataset
zmin = round(min(min(z)));
zmax = round(max(max(z)));

% Depth intervals for colors
levels = [-6500,-4500,-3500,-3000,0,20,200,400,1000,2000,4000];
tmp = sort([levels,zmin,zmax]);
imin = find(tmp == zmin);
imax = find(tmp == zmax);

% Calculate number of points in each depth interval
j = 1;
for i = imin:(imax-1)
    n(j) = abs(abs(tmp(i)) - abs(tmp(i+1)));  
    j = j + 1;
end

% Construct colormap
j = 1;
for i = imin:(imax-1)
   if i == 1
       c{j} = ones(n(j),1)*[20,40,40];
   elseif i == 2
       c{j} = [linspace(20,80,n(j))',linspace(40,193,n(j))',...
           linspace(40,220,n(j))'];
   elseif i == 3
       c{j} = [linspace(80,105,n(j))',linspace(193,220,n(j))',...
           linspace(220,232,n(j))'];
   elseif i == 4
       c{j} = [linspace(105,150,n(j))',linspace(220,238,n(j))',...
           linspace(232,246,n(j))'];       
   elseif i == 5
       c{j} = [linspace(150,205,n(j))',linspace(238,255,n(j))',...
           linspace(246,253,n(j))'];       
   elseif i == 6
       c{j} = [linspace(15,15,n(j))',linspace(128,128,n(j))',...
           linspace(45,45,n(j))'];       
   elseif i == 7
       c{j} = [linspace(15,179,n(j))',linspace(128,212,n(j))',...
           linspace(45,110,n(j))'];       
   elseif i == 8
       c{j} = [linspace(179,215,n(j))',linspace(212,205,n(j))',...
           linspace(110,125,n(j))'];       
   elseif i == 9
       c{j} = [linspace(215,209,n(j))',linspace(205,160,n(j))',...
           linspace(125,82,n(j))'];       
   elseif i == 10
       c{j} = [linspace(209,55,n(j))',linspace(160,20,n(j))',...
           linspace(82,6,n(j))'];       
   elseif i == 11
       c{j} = [linspace(55,148,n(j))',linspace(20,135,n(j))',...
           linspace(6,136,n(j))'];       
   elseif i == 12
       c{j} = [linspace(148,255,n(j))',linspace(135,255,n(j))',...
           linspace(136,255,n(j))'];       
   end
   j = j + 1;
end

% Concatenate chunks into the final colormap
cmap = [];
for i = 1:length(c)
    cmap = [cmap; c{i}];
end
cmap = cmap/255;
