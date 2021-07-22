function [lakes] = loadlakes(resolution)
% LOADLAKES Load in a shape file containing polygons representing all of 
%           the world's lakes.
%
% >> [lakes] = LOADLAKES(resolution)
%
%---Input Variables--------------------------------------------------------
% resolution  - desired shape resolution: full - 'f', high - 'h',
%               intermediate - 'i', low - 'l', or coarse - 'c'
%
%---Output Variables-------------------------------------------------------
% lakes       - struct containing lake polygon data
%
%--------------------------------------------------------------------------
% Last updated 7/22/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

% Specify locations of shape files
if strcmp(resolution,'c')
    lfile = ['/Users/aburky/IFILES/MODELS/GSHHG/shp/GSHHS_shp/',...
        'c/GSHHS_c_L2.shp'];
    lakes = shaperead(lfile);
elseif strcmp(resolution,'f')
    lfile = ['/Users/aburky/IFILES/MODELS/GSHHG/shp/GSHHS_shp/',...
        'f/GSHHS_f_L2.shp'];
    lakes = shaperead(lfile);
elseif strcmp(resolution,'h')
    lfile = ['/Users/aburky/IFILES/MODELS/GSHHG/shp/GSHHS_shp/',...
        'h/GSHHS_h_L2.shp'];
    lakes = shaperead(lfile);    
elseif strcmp(resolution,'i')
    lfile = ['/Users/aburky/IFILES/MODELS/GSHHG/shp/GSHHS_shp/',...
        'i/GSHHS_i_L2.shp'];
    lakes = shaperead(lfile);    
elseif strcmp(resolution,'l')
    lfile = ['/Users/aburky/IFILES/MODELS/GSHHG/shp/GSHHS_shp/',...
        'l/GSHHS_l_L2.shp'];
    lakes = shaperead(lfile);
else
    error(['Invalid resolution. Accepted options are ''c'', ''f'', ',...
        'h'', ''i'', or ''l'''])        
end