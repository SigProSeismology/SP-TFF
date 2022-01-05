function [xr, yr]= ellip_p(xc, yc, a, b, m,  alpha);
x = zeros(m,1);
y = zeros(m,1);
theta = linspace(0,2*pi,m);
for k = 1:m
        x(k) = a * cos(theta(k));
        y(k) = b * sin(theta(k));
end
%alpha = input('Enter the rotation angle');
%alpha =30;
R  = [cos(alpha) -sin(alpha); ...
      sin(alpha)  cos(alpha)];
rCoords = R*[x' ; y'];   
xr = rCoords(1,:)';      
yr = rCoords(2,:)';      