function [P]=plott275
  x= -1:.5:1;
  y= -1:.5:1;
  [X,Y]=meshgrid(x,y);
  [ m_x, n_x] = size(x);
  
 

r = sqrt(X.^2 + Y.^2); % r in function of (x, y)
theta = atan2(Y, X); % theta in function of (x, y)
phi = 0;
r
u =r.*cos(theta); % x component of the vector field
v = r.*sin(theta); % y component of the vector field

quiver(x, y, u, v)

E
%ploar gotten from https://stackoverflow.com/questions/46209000/plot-vector-field-expressed-in-polar-coordinates-with-quiver-in-matlab
## quiver(X,Y,E(:,:,1),E(:,:,2))
endfunction
