function [coasts] = loadcoasts(resolution,varargin)
% LOADCOASTS Load in coordinate data representing all of the world's
%            coastlines.
%
% >> [coasts] = LOADCOASTS(resolution)
%
%---Input Variables--------------------------------------------------------
% resolution  - desired data resolution: full - 'f', high - 'h',
%               intermediate - 'i', low - 'l', or coarse - 'c'
% lakes       - optional flag to include all lakes (default) or only major
%               lakes, like the great lakes ('nolakes' option)
%
%---Output Variables-------------------------------------------------------
% coasts      - struct containing coast data
%
%--------------------------------------------------------------------------
% Last updated 10/25/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

% Specify locations of coast binary files
if strcmp(resolution,'c')
    cfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/gshhs_c.b';
    coasts = gshhs(cfile);
elseif strcmp(resolution,'f')
    cfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/gshhs_f.b';
    coasts = gshhs(cfile);
elseif strcmp(resolution,'h')
    cfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/gshhs_h.b';
    coasts = gshhs(cfile);
    if nargin == 2 && strcmp(varargin{1},'nolakes')
        coasts = [coasts(1:4); coasts(6:145450)];
    end
elseif strcmp(resolution,'i')
    cfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/gshhs_i.b';
    coasts = gshhs(cfile);
    if nargin == 2 && strcmp(varargin{1},'nolakes')
        coasts = [coasts(1:4); coasts(6:33300)];
    end
elseif strcmp(resolution,'l')
    cfile = '/Users/aburky/IFILES/MODELS/GSHHG/bin/gshhs_l.b';
    coasts = gshhs(cfile);
    if nargin == 2 && strcmp(varargin{1},'nolakes')
        coasts = [coasts(1:4); coasts(6:5850)];
    end
else
    error(['Invalid resolution. Accepted options are ''c'', ''f'', ',...
        'h'', ''i'', or ''l'''])        
end