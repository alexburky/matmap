function [lon,lat,z] = loadtopo(lonBounds,latBounds)
% LOADTOPO  Load in topography and bathymetry data from a .nc file.
%           (Data can be found at https://topex.ucsd.edu/marine_topo/)
%
% >> [lon,lat,z] = LOADTOPO(lonBounds,latBounds)
%
%---Input Variables--------------------------------------------------------
% lonBounds  - vector containing the longitude boundaries of the desired
%              region (e.g. lonBounds = [30 60])
% latBounds  - vector containing the latitude boundaries of the desired
%              region (e.g. latBounds = [-60 -30])
%
%---Output Variables-------------------------------------------------------
% lon        - vector containing the longitude coordinates of the
%              topography data grid
% lat        - vector containing the latitude coordinates of the topography
%              data grid
% z          - vector containing the elevation data
%
%--------------------------------------------------------------------------
% Last updated 7/22/2021 by aburky@princeton.edu
%--------------------------------------------------------------------------

% Check the user input for correctness
if length(lonBounds) ~= 2
    error('Need to specify two longitude points: lonBounds = [min max]')
elseif length(latBounds) ~= 2
    error('Need to specify two latitude points: latBounds = [min max]')
else
    latBounds = sort(latBounds);
    lonBounds = sort(lonBounds);
end

% Specify the location of the NetCDF file
ncfile = '/Users/aburky/IFILES/MODELS/GLOBAL_TOPO/topo_20.1.nc';
ncid = netcdf.open(ncfile,'NC_NOWRITE');

% Extract data from NetCDF file
x = netcdf.getVar(ncid,0)';
y = netcdf.getVar(ncid,1)';
z = netcdf.getVar(ncid,2)';

% Close the NetCDF file
netcdf.close(ncid);

[~,xmin] = min(abs(x-(lonBounds(1))));
[~,xmax] = min(abs(x-(lonBounds(2))));
[~,ymin] = min(abs(y-(latBounds(1))));
[~,ymax] = min(abs(y-(latBounds(2))));

lon = x(xmin:xmax);
lat = y(ymin:ymax);
z = z(ymin:ymax,xmin:xmax);