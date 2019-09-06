function [lat1,lon1,vtheta1,vphi1] = get_plate_motions(filename)
%read file
fh = fopen(filename,'r');
data = fscanf(fh,'%e %e %e %e\n');% format should be lon lat vphi vtheta
% theta is colat, phi is lon. vphi is northward in pm files
data = reshape(data,[4 length(data)/4]);
fclose(fh);
lon = data(1,:); nlon = length(unique(lon));
lat = data(2,:); nlat = length(unique(lat));
vphi = data(3,:);
vtheta = data(4,:);
lat = reshape(lat,[nlon nlat]);
lon = reshape(lon,[nlon nlat]);
vtheta = reshape(vtheta,[nlon nlat]);
vphi   = reshape(vphi  ,[nlon nlat]);
% pad out arrays by +2 in each dimension
lat1 = zeros(nlon+2,nlat+2);
lon1 = zeros(nlon+2,nlat+2);
vtheta1 = zeros(nlon+2,nlat+2);
vphi1 = zeros(nlon+2,nlat+2);
lat1(2:end-1,2:end-1) = lat;
lon1(2:end-1,2:end-1) = lon;
vtheta1(2:end-1,2:end-1) = vtheta;
vphi1(2:end-1,2:end-1) = vphi;

% make boundaries periodic
dlat = lat(1,2)-lat(1,1);
dlon = lon(2,1)-lon(1,1);

%leading dimension is longitude
lon1(:,1) = lon1(:,2); lon1(:,end) = lon1(:,end-1);
lon1(1,:) = lon1(2,:) - dlon; lon1(end,:) = lon1(end-1,:) + dlon;
lat1(:,1) = lat1(:,2) - dlat; lat1(:,end) = lat1(:,end-1) + dlat;
lat1(1,:) = lat1(2,:);
lat1(end,:) = lat1(end-1,:);

vtheta1(1,:) = vtheta1(end-1,:);
vtheta1(end,:) = vtheta1(2,:); 
vtheta1(:,1) = -vtheta1(end:-1:1,2); 
vtheta1(:,end) = -vtheta1(end:-1:1,end-1);

vphi1(1,:) = vphi1(end-1,:); 
vphi1(end,:) = vphi1(2,:); 
vphi1(:,1) = -vphi1(end:-1:1,2); 
vphi1(:,end) = -vphi1(end:-1:1,end-1);
% lat1(1,:) = lat1(end-1,:); lat1(end,:) = lat1(2,:); lat1(:,1) = lat1(:,end-1); lat1(:,end) = lat1(:,2);
% lon1(1,:) = lon1(end-1,:); lon1(end,:) = lon1(2,:); lon1(:,1) = lon1(:,end-1); lon1(:,end) = lon1(:,2);
% vtheta1(1,:) = vtheta1(end-1,:); vtheta1(end,:) = vtheta1(2,:); vtheta1(:,1) = vtheta1(:,end-1); vtheta1(:,end) = vtheta1(:,2);
% vphi1(1,:) = vphi1(end-1,:); vphi1(end,:) = vphi1(2,:); vphi1(:,1) = vphi1(:,end-1); vphi1(:,end) = vphi1(:,2);
end