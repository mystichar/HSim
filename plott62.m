function [Plott]=plott62
  h=.001;

  x_lol= -3:h:6;
##
##     q_p=[1];
##  m=[1];
##  x_o=[1];
##  y_o=[1];
##  z_o=[1];
##  u_o=[0];
##  v_o=[1];
##  w_o=[0];
##  a=[0];
##  b=[0];
##  c=[1];
##  q=[1];
##  u_q=[1];
##  v_q=[0];
##  w_q=[0];

  q_p=[1,1,0];
  m=[9999999,1,1];
  x_o=[0,1,0];
  y_o=[0,1,-1];
  z_o=[1,1,0];
  u_o=[1,0,0];
  v_o=[0,1,0];
  w_o=[0,0,0];
    [ m_m, n_m] = size(m);

P(:,1,1)=x_o;
P(:,2,1)=y_o;
P(:,3,1)=z_o;
P(:,4,1)=u_o;
P(:,5,1)=v_o;
P(:,6,1)=w_o;
P(:,1,n_m)=0

  [ m_xlol, n_xlol] = size(x_lol);

##particles will move one step after landing in another particle

for i=2:n_xlol
  for p=1:n_m
   Fix(1,n_m)=0;
   Fiy=Fix;
   Fiz=Fiy;
   Fiq=Fiz;
   Fiq(1,p)=q_p(p);
   vpt=-[P(p,4,i-1);P(p,5,i-1);P(p,6,i-1)];
   B=Bofat(P(:,1,i-1)-Fix,P(:,2,i-1)-Fiy,P(:,3,i-1)-Fiz,P(:,4,i-1),P(:,5,i-1),P(:,6,i-1),q_p-Fiq,P(p,1,i-1),P(p,2,i-1),P(p,3,i-1));
   kcroz=cross(vpt,B);
   P(p,1,i-1);
   P(p,1,i)=P(p,1,i-1)+P(p,4,i-1)*(h);
   P(p,2,i)=P(p,2,i-1)+P(p,5,i-1)*(h);
   P(p,3,i)=P(p,3,i-1)+P(p,6,i-1)*(h);
   P(p,4,i)=P(p,4,i-1)+(q_p(p))*(kcroz(1))/m(p)*(h);
   P(p,5,i)=P(p,5,i-1)+(q_p(p))*(kcroz(2))/m(p)*(h);
   P(p,6,i)=P(p,6,i-1)+(q_p(p))*(kcroz(3))/m(p)*(h);
   Fix=zeros(size(Fix));
   Fiy=zeros(size(Fix));
   Fiz=zeros(size(Fix));
   Fiq=zeros(size(Fix));
   end
end   

quiver3(0,0,0,0,0,0)
hold on
axis(3*[-1,1,-1,1,-1,1])
for i=1:n_xlol
for p=1:n_m
 forn(p,i)=P(p,1,i);
 form(p,i)=P(p,2,i);
 forp(p,i)=P(p,3,i);
end
end

for p=1:n_m
plot3(forn(p,:),form(p,:),forp(p,:))
end

hold off


endfunction