function [P]=plott475(a,b,c,q)
  h=.5
  x= -2:h:2;
  y= -2:h:2;
  z= -2:h:2;
  t= -2:h:2;
 
##  tree=[1,2,3,4,5,6]
##  q_p=[1,1,1,1,1,1,1,1,1]
##  m=[1,1,1,1,1,1,1,1,1]
##  x_o=[0,0,0,0,0,0,0,0,0]
##  y_o=[1,2,3,1,2,3,1,2,3]
##  z_o=[1,1,1,2,2,2,3,3,3]
##  u_o=[1,1,1,2,2,2,3,3,3]
##  v_o=[0,0,0,0,0,0,0,0,0]
##  w_o=[0,0,0,0,0,0,0,0,0]
   q_p=[1,1]
  m=[1,1]
  x_o=[0,0]
  y_o=[0,1]
  z_o=[0,1]
  u_o=[0,0]
  v_o=[0,0]
  w_o=[0,0]
  
P(1,1,:)=x_o
P(1,2,:)=y_o
P(1,3,:)=z_o
P(1,4,:)=u_o
P(1,5,:)=v_o
P(1,6,:)=w_o
  [ m_a, n_a] = size(a);
  [ m_m, n_m] = size(m);
  [X,Y,Z]=meshgrid(x,y,z);
  [ m_x, n_x] = size(x);
  
  E=zeros(x,x,x,x,x);

E(1,1,1,1,n_a+1)=1;
for o=1:3
 for p=1:n_a
    
E(j,i,k,1,p) =(q(p)/((xx-a(p))^2+(yy-b(p))^2+(zz-c(p))^2))*cos(atan2((yy-b(p)),(xx-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))));
E(j,i,k,3,p) =(q(p)/((xx-a(p))^2+(yy-b(p))^2+(zz-c(p))^2))*(zz-c(p))/(sqrt((xx-a(p))^2+((y(j)-b(p)))^2+(z(k)-c(p))^2));
E(j,i,k,2,p) =(q(p)/((xx-a(p))^2+(yy-b(p))^2+(zz-c(p))^2))*sin(atan2((yy-b(p)),(xx-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))));
E(j,i,k,o,n_a+1) = E(j,i,k,o,n_a+1)+E(j,i,k,o,p);

  end
end



for p=1:n_m
  for i=2:n_x
   P(i,1,p)=P(i-1,1,p)+P(i-1,4,p)*(h);
   P(i,2,p)=P(i-1,2,p)+P(i-1,5,p)*(h);
   P(i,3,p)=P(i-1,3,p)+P(i-1,6,p)*(h);
   P(i,4,p)=P(i-1,4,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,1,p))(1)/m(p))*(h);
   P(i,5,p)=P(i-1,5,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,2,p))(1)/m(p))*(h);
   P(i,6,p)=P(i-1,6,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(1)/m(p))*(h);
  end
end   

 % 

quiver3(X,Y,Z,E(:,:,:,1,n_a+1),E(:,:,:,2,n_a+1),E(:,:,:,3,n_a+1))
hold on

for p=1:n_m
plot3(P(:,1,p),P(:,2,p),P(:,3,p));
end
hold off
endfunction
