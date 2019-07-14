function [E] = plott2(q,x_o,y_o,z_o)
  x= -1:.5:1;
  y= -1:.5:1;
  z= -1:.5:1;
  [X,Y,Z]=meshgrid(x,y,z);
  k = 9*(10^(9));
  [ m_x, n_x] = size(x);
  D = zeros( n_x^3,6 );
  for k= 1:n_x
  for j= 1:n_x
    for i=1:n_x
  D(j+n_x*(i-1)+n_x^2*(k-1),3)=x(j);
  D(j+n_x*(i-1)+n_x^2*(k-1),2)=y(i);
  D(j+n_x*(i-1)+n_x^2*(k-1),1)=z(k);
  D(j+n_x*(i-1)+n_x^2*(k-1),4)=atan((D(j+n_x*(i-1)+n_x^2*(k-1),2))/(D(j+n_x*(i-1)+n_x^2*(k-1),3)));
  D(j+n_x*(i-1)+n_x^2*(k-1),5)=atan((D(j+n_x*(i-1)+n_x^2*(k-1),1))/(D(j+n_x*(i-1)+n_x^2*(k-1),2)));
  D(j+n_x*(i-1)+n_x^2*(k-1),6)=atan((D(j+n_x*(i-1)+n_x^2*(k-1),1))/(sqrt((D(j+n_x*(i-1)+n_x^2*(k-1),3))^2+(D(j+n_x*(i-1)+n_x^2*(k-1),2))^2)));
end
end
end

for u=1:n_x^3
  for j=1:3
E(u,j)=(1/((D(u,1)-z_o)^2+(D(u,2)-y_o)^2+(D(u,3)-x_o)^2))*D(u,j+3);
end
end
for u=1:n_x^3
E(u,4)=(1/((D(u,1)-z_o)^2+(D(u,2)-y_o)^2+(D(u,3)-x_o)^2));
end
for u_o = 1:n_x
  u(u_o,1)=E(u_o,1);
end
for v_o = 1:n_x
  v(v_o,1)=E(v_o,2);
end
for w_o = 1:n_x
  w(w_o,1)=E(w_o,3);
end
[U,V,W]=meshgrid(u,v,w);
U
V
W
X
Y
Z
quiver3(X,Y,Z,U,V,W)
D
E
endfunction
