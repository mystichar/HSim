function [Plott]=plott475(on)
  h=.005
  h_o=.25
  x= 1:h_o:3;
  y= 1:h_o:1;
  z= 1:h_o:1;
  x_lol= -2:h:2;
 
  
  Parts(7,:,1)=(-1)*[1,1,1,1,1,1,1,1,1]
  Parts(8,:,1)=[1,1,1,1,1,1,1,1,1]
  Parts(1,:,1)=(4)*[1,1,1,1,1,1,1,1,1]
  Parts(2,:,1)=[-1,1,1,-1,1,1,-1,1,1]
  Parts(3,:,1)=[-1,-1,-0.5,0,0,0,1,-1,1]
  Parts(4,:,1)=(0)*[1,1,1,2,2,2,3,3,3]
  Parts(5,:,1)=[0,0,0,0,0,0,0,0,0]
  Parts(6,:,1)=[0,0,0,0,0,0,0,0,0]
  
##   q_p=[-1,-1,-4]
##  m=[1,1,2]
##  x_o=[0,0,0]
##  y_o=[0,1,1]
##  z_o=[0,1,1]
##  u_o=[0,0,0]
##  v_o=[0,1,1]
##  w_o=[1,0,0]
  
P(1,1,:)=Parts(1,:)
P(1,2,:)=Parts(2,:)
P(1,3,:)=Parts(3,:)
P(1,4,:)=Parts(4,:)
P(1,5,:)=Parts(5,:)
P(1,6,:)=Parts(6,:)
  [ m_Parts, n_Parts] = size(Parts);
  [ m_m, n_m] = size(m);
  [X,Y,Z]=meshgrid(x,y,z);
  [ m_x, n_x] = size(x);
  [ m_xlol, n_xlol] = size(x_lol);
  

for p=1:n_m
  for i=2:n_xlol
   P(i,1,p)=P(i-1,1,p)+P(i-1,4,p)*(h);
   P(i,2,p)=P(i-1,2,p)+P(i-1,5,p)*(h);
   P(i,3,p)=P(i-1,3,p)+P(i-1,6,p)*(h);
   P(i,4,p)=P(i-1,4,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(1)/m(p))*(h);
   P(i,5,p)=P(i-1,5,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(2)/m(p))*(h);
   P(i,6,p)=P(i-1,6,p)+(q_p(p))*(Eofat(a,b,c,q,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(3)/m(p))*(h);
  end
end   
P (:,4,:)
 


quiver3(0,0,0,0,0,0)
hold on
axis([1,3,-1,1,-1,1])
for p=1:n_m
plot3(P(:,1,p),P(:,2,p),P(:,3,p));
end
hold off


endfunction