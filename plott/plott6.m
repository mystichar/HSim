function [P]=plott6
  a=[0,0]
  b=[0,0]
  c=[0,0]
  q=[1,0]
  V=[1,0;
     0,0;
     0,0]
  x= -1:.25:1;
  y= -1:.25:1;
  z= -1:.25:1;
  
  
  [ m_a, n_a] = size(a);
  [X,Y,Z]=meshgrid(x,y,z);
  [ m_x, n_x] = size(x);
  
  B=zeros(x,x,x,x,x);
  B(n_x,n_x,n_x,3,n_a+1)=0;
E(1,1,1,1,n_a+1)=1;
for o=1:3
 for p=1:n_a
    for k=1:n_x
      for j=1:n_x
        for i=1:n_x
rs=[1/((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2)];
rv=rs*[cos(atan2((y(j)-b(p)),(x(i)-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2)))),sin(atan2((y(j)-b(p)),(x(i)-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2)))),(z(k)-c(p))/(sqrt((x(i)-a(p))^2+((y(j)-b(p)))^2+(z(k)-c(p))^2))];
B(j,i,k,:,p) =(q(p)/(rs^2))*cross(V(:,p),rv);
B(j,i,k,o,n_a+1) = B(j,i,k,o,n_a+1)+B(j,i,k,o,p);
        end
      end
    end
  end
end
  

quiver3(X,Y,Z,B(:,:,:,1,n_a+1),B(:,:,:,2,n_a+1),B(:,:,:,3,n_a+1))

endfunction
