function [Plott]=plott49
  h=.01
  h_o=.25
  x= -1:h_o:3;
  y= -1:h_o:1;
  z= -1:h_o:1;
  x_lol= -2:h:12;
 
  
##
##  P(1,:,:)=[
##  1,1,5,1;
##  2,1,1,6;
##  1,4,1,8;
##  0,0,0,0;
##  0,0,0,0;
##  0,0,0,0;
##  1,-1,1,1;
##  1,3,1,1;]

  P(1,:,:)=[
  1,0;
  1,0;
  1,0;
  0,0;
  0,0;
  2,0;
  1,-1;
  1,100];

  [bbb,ccc,n_m] = size(P(1,1,:));
  [X,Y,Z]=meshgrid(x,y,z);

  [ m_xlol, n_xlol] = size(x_lol);
  r(2,:)=zeros(size(P(1,1,:)));



  for i=2:n_xlol
   for p=1:n_m
 
   for l=1:n_m
   q(l)=P(1,7,l);
   a(l)=P(i-1,1,l);
   b(l)=P(i-1,2,l);
   c(l)=P(i-1,3,l);
 end
   r(1,p)=a(p)+1;
   r(2,p)=q(p);
   
   P(i,1,p)=P(i-1,1,p)+P(i-1,4,p)*(h);
   P(i,2,p)=P(i-1,2,p)+P(i-1,5,p)*(h);
   P(i,3,p)=P(i-1,3,p)+P(i-1,6,p)*(h);
   
   P(i,4,p)=P(i-1,4,p)+(P(1,7,p))*(Eofat(a-r(1,:),b,c,q-r(2,:),P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(1)/P(1,8,p))*(h);
   P(i,5,p)=P(i-1,5,p)+(P(1,7,p))*(Eofat(a-r(1,:),b,c,q-r(2,:),P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(2)/P(1,8,p))*(h);
   P(i,6,p)=P(i-1,6,p)+(P(1,7,p))*(Eofat(a-r(1,:),b,c,q-r(2,:),P(i-1,1,p),P(i-1,2,p),P(i-1,3,p))(3)/P(1,8,p))*(h);
   r=r*0;
   
  end
end   



quiver3(0,0,0,0,0,0)
hold on

for p=1:n_m
plot3(P(:,1,p),P(:,2,p),P(:,3,p))

end

hold off


endfunction