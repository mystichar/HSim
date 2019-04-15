function [rotatate] = rotatate
  gamatria=.2
  u=[1,2,3];
  v=[1,0,0];
   quiver3(0,0,0,u(1),u(2),u(3))
     hold on
  for t=1:180
  u_prime(t,:)=u*cos(gamatria+pi*t/90)+cross(u,v)*sin(gamatria+pi*t/90)+v*dot(v,u)*(1-cos(gamatria+pi*t/90));
 quiver3(0,0,0,u_prime(t,1),u_prime(t,2),u_prime(t,3));
 end

 
  hold off
endfunction
