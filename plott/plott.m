function [plott] = plott(q, x_o, y_o, z_o)
  x= -1:.5:1;
  y= -1:.5:1;
 z= -1:.5:1;
 
  [ m_x, n_x] = size(x);
  E = zeros( n_x,6 );
  
  k = 9*(10^(9));
  [xx,yy,zz] = meshgrid(x,y,z);
 d=[xx-x_o,yy-y_o,zz-z_o]
 for i = 1:3
 for o = 1:n_x
   if i=1
  E(o,i)=x(o);
elseif i=2
  E(o,i)=y(o);
elseif
end
end
for c = 1:n_x
  E(c,2)=y(c);
end
for p = 1:n_x
  E(p,3)=z(p);
end
 for j = 4:6
   for h = 1:n_x
     for k = 1: n_x
 for i = 1:n_x
 E(i,j)=(1/((xx(i))^2+(yy(h))^2+(zz(k)^2)))*d(i,j);
endfor
endfor
endfor
endfor
for u_o = 1:n_x
  u(u_o,1)=E(u_o,4);
end
for v_o = 1:n_x
  v(v_o,1)=E(v_o,5);
end
for w_o = 1:n_x
  w(w_o,1)=E(w_o,6);
end
E
u
v
w
  quiver3(x,y,z,u,v,w)
 endfunction
