function [P]=plott25
  x= -1:.1:1;
  y= -1:.1:1;
  z= -1:.1:1;
  [X,Y,Z]=meshgrid(x,y,z);
  [ m_x, n_x] = size(x);

    for k=1:n_x
      for j=1:n_x
        for i=1:n_x
E(j,i,k,1) =(1/((x(i))^2+(y(j))^2+(z(k))^2))*cos(atan2(y(j),x(i)))*sin(acos((z(k))/(sqrt((x(i))^2+(y(j))^2+(z(k))^2))));
E(j,i,k,3) =(1/((x(i))^2+(y(j))^2+(z(k))^2))*(z(k))/(sqrt((x(i))^2+(y(j))^2+(z(k))^2));
E(j,i,k,2) =(1/((x(i))^2+(y(j))^2+(z(k))^2))*sin(atan2(y(j),x(i)))*sin(acos((z(k))/(sqrt((x(i))^2+(y(j))^2+(z(k))^2))));
        end
      end
    end
 

E

 quiver3(X,Y,Z,E(:,:,:,1),E(:,:,:,2),E(:,:,:,3))
endfunction
