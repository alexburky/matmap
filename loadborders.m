function [borders] = loadborders(resolution)
% LOADBORDERS Load in coordinate data representing all of the world's
%             geographic/geopolitical borders.
%
% >> [borders] = LOADBORDERS(resolution)
%
%---Input Variables--------------------------------------------------------
% resolution  - desired data resolution: full - 'f', high - 'h',
%               intermediate - 'i', low - 'l', or coarse - 'c'
%
%---Output Variables-------------------------------------------------------
% borders     - struct containing border data
%
%--------------------------------------------------------------------------
% Last updated 7/22/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

% Specify locations of border binary files
if strcmp(resolution,'c')
    bfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/wdb_borders_c.b';
    borders = gshhs(bfile);
elseif strcmp(resolution,'f')
    bfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/wdb_borders_f.b';
    borders = gshhs(bfile);
elseif strcmp(resolution,'h')
    bfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/wdb_borders_h.b';
    borders = gshhs(bfile);    
elseif strcmp(resolution,'i')
    bfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/wdb_borders_i.b';
    borders = gshhs(bfile);    
elseif strcmp(resolution,'l')
    bfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/wdb_borders_l.b';
    borders = gshhs(bfile);
else
    error(['Invalid resolution. Accepted options are ''c'', ''f'', ',...
        'h'', ''i'', or ''l'''])        
end