function [Plott]=plott51(a,b,c,q)
  h=.05;

  x_lol= 0:h:6;

  q_p=[1,1];
  m=[1,1];
  x_o=[0,0];
  y_o=[0,1];
  z_o=[0,0];
  u_o=[0,0];
  v_o=[0,0];
  w_o=[0,0];
  
P(1,1,:)=x_o;
P(1,2,:)=y_o;
P(1,3,:)=z_o;
P(1,4,:)=u_o;
P(1,5,:)=v_o;
P(1,6,:)=w_o;

  [ m_m, n_m] = size(m);

  [ m_xlol, n_xlol] = size(x_lol);

##particles will move one step after landing in another particle

for i=2:n_xlol
  for p=1:n_m
   Fix=zeros(size(P(i-1,1,:)));
   Fiy=Fix;
   Fiz=Fiy;
   Fiq=Fiz;
   Fix(p)=P(i-1,1,:)(p)+1;
   Fiy(p)=P(i-1,2,:)(p)+1;
   Fiz(p)=P(i-1,3,:)(p)+1;
   Fiq(p)=q_p(p);
   Fiq
   q_p
   q_p-Fiq
   P(i-1,6,p)
   P(i,1,p)=P(i-1,1,p)+P(i-1,4,p)*(h);
   P(i,2,p)=P(i-1,2,p)+P(i-1,5,p)*(h);
   P(i,3,p)=P(i-1,3,p)+P(i-1,6,p)*(h);
   P(i,4,p)=P(i-1,4,p)+(q_p(p))*(Eofat(P(i-1,1,:)-Fix,P(i-1,2,:)-Fiy,P(i-1,3,:)-Fiz,q_p-Fiq,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(1)/m(p))*(h);
   P(i,5,p)=P(i-1,5,p)+(q_p(p))*(Eofat(P(i-1,1,:)-Fix,P(i-1,2,:)-Fiy,P(i-1,3,:)-Fiz,q_p-Fiq,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(2)/m(p))*(h);
   P(i,6,p)=P(i-1,6,p)+(q_p(p))*(Eofat(P(i-1,1,:)-Fix,P(i-1,2,:)-Fiy,P(i-1,3,:)-Fiz,q_p-Fiq,P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(3)/m(p))*(h);
  end
end   

quiver3(0,0,0,0,0,0)
hold on
axis(3*[-1,1,-1,1,-1,1])
for p=1:n_m
plot3(P(:,1,p),P(:,2,p),P(:,3,p))
end

hold off


endfunction