 function det = sphere_determinants()
% this function takes as input grids of latitude and longitude created for
% instance with meshgrid. The output is the fraction of the sphere owned by
% each cell (lat and lon are assumed to be cell-centered quantities)

%x = cat(2,cos(glon).*sin(glat), sin(glon).*sin(glat), cos(glat));
%   4    3
%    cell1
%   1    2
% lon=0:1:360;
lon=linspace(0,2*pi,361);
% lat=0:1:180;
lat=linspace(0,pi,181);
% [glon,glat] = meshgrid(lon,lat);
% x = cat(3,cos(glon).*sin(glat), sin(glon).*sin(glat), cos(glat));

% Esum=0;
A=zeros(180,360);
 for i=1:360
     for j=1:180
         dtheta = lon(i+1)-lon(i);
         A(j,i)=-dtheta*(cos(lat(j+1))-cos(lat(j)));
         
         
%         x1 = squeeze(x(j,i,:));
%         x2 = squeeze(x(j,i+1,:));
%         x3 = squeeze(x(j+1,i+1,:));
%         x4 = squeeze(x(j+1,i,:));              
%         % compute area of triangle 123
%         a12 = acos(x1'*x2);
%         a23 = acos(x3'*x2);
%         a13 = acos(x1'*x3);
%         A1 = (cos(a23)-cos(a12)*cos(a13))/(sin(a12)*sin(a13));
%         A2 = (cos(a13)-cos(a12)*cos(a23))/(sin(a12)*sin(a23));
%         A3 = (cos(a12)-cos(a13)*cos(a23))/(sin(a13)*sin(a23));
%         E = A1+A2+A3-pi;
%         if(isnan(E)) E=0;end
%         Esum=Esum+E;
     end
 end
 det=A/(4*pi);
% 
% 
% end