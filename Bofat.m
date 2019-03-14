function [Bofat]=Bofat(a,b,c,u,v,w,q,x_o,y_o,z_o)
  a=[0,0];
  b=[0,0];
  c=[0,0];
  q=[1,0];
    [ m_a, n_a] = size(a);
 u=1;
 v=0;
 w=0;
  V(1,:)=u;
  V(2,:)=v;
  V(3,:)=w;


  B=zeros(3,a);
  B(3,n_a+1)=0;

 for p=1:n_a
if q(p)==0
for o=1:3
B(o,p)=0;
endfor
else
rs=[1/((x_o-a(p))^2+(y_o-b(p))^2+(z_o-c(p))^2)];
rv=rs*[cos(atan2((y_o-b(p)),(x_o-a(p))))*sin(acos((z_o-c(p))/(sqrt((x_o-a(p))^2+(y_o-b(p))^2+(z_o-c(p))^2)))),sin(atan2((y_o-b(p)),(x_o-a(p))))*sin(acos((z_o-c(p))/(sqrt((x_o-a(p))^2+(y_o-b(p))^2+(z_o-c(p))^2)))),(z_o-c(p))/(sqrt((x_o-a(p))^2+((y_o-b(p)))^2+(z_o-c(p))^2))];
##B(:,n_a+1) =[0,0,1];
B(:,p) =(q(p)/(rs^2))*cross(V(:,p),rv);
B(:,n_a+1) = B(:,n_a+1)+B(:,p);
endif
end
Bofat=B(:,n_a+1);
endfunction
