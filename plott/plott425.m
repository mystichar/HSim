function [P]=plott425(a,b,c,q)
  h=.25
  x= 0:h:2;
  y= 0:h:2;
  z= 0:h:2;
  t= 0:h:2;
 
##  tree=[1,2,3,4,5,6]
##  q_p=[1,1,1,1,1,1,1,1,1]
##  m=[1,1,1,1,1,1,1,1,1]
##  x_o=[0,0,0,0,0,0,0,0,0]
##  y_o=[1,2,3,1,2,3,1,2,3]
##  z_o=[1,1,1,2,2,2,3,3,3]
##  u_o=[1,1,1,2,2,2,3,3,3]
##  v_o=[0,0,0,0,0,0,0,0,0]
##  w_o=[0,0,0,0,0,0,0,0,0]
   q_p=[1,-4]
  m=[1,1]
  x_o=[0,1]
  y_o=[1,0]
  z_o=[1,1]
  u_o=[1,2]
  v_o=[0,-1]
  w_o=[0,-1]
  
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
    for k=1:n_x
      for j=1:n_x
        for i=1:n_x
E(j,i,k,1,p) =1;
E(j,i,k,3,p) =0;
E(j,i,k,2,p) =0;
E(j,i,k,o,n_a+1)= E(j,i,k,o,n_a+1)+E(j,i,k,o,p);
        end
      end
    end
  end
end


for p=1:n_m
  for i=2:n_x
   P(i,1,p)=P(i-1,1,p)+P(i-1,4,p)*(h);
   P(i,2,p)=P(i-1,2,p)+P(i-1,5,p)*(h);
   P(i,3,p)=P(i-1,3,p)+P(i-1,6,p)*(h);
   P(i,4,p)=P(i-1,4,p)+((q_p(p))/(m(p)))*(h);
   P(i,5,p)=P(i-1,5,p);
   P(i,6,p)=P(i-1,6,p);
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
