function [erender]=erender(Parts,Bounds,h)


x= Bounds(1,1):h:Bounds(1,2);
y= Bounds(2,1):h:Bounds(2,2);
z= Bounds(3,1):h:Bounds(3,2);

E=zeros(x,x,x,x,x);

##Parts(1,:)=a#x
##Parts(2,:)=b#y
##Parts(3,:)=c#z
##Parts(4,:)=q#q

 [ m_a, n_a] = size(Parts(1,:));
 [X,Y,Z]=meshgrid(x,y,z);
 [ m_x, n_x] = size(x);
  
 E=zeros(x,x,x,x,x);
 
 E(1,1,1,1,n_a+2)=1;
 for o=1:3
  for p=1:n_a
     for k=1:n_x
       for j=1:n_x
         for i=1:n_x
 E(j,i,k,1,p) =(Parts(4,:)(p)/((x(i)-Parts(1,:)(p))^2+(y(j)-Parts(2,:)(p))^2+(z(k)-Parts(3,:)(p))^2))*cos(atan2((y(j)-Parts(2,:)(p)),(x(i)-Parts(1,:)(p))))*sin(acos((z(k)-Parts(3,:)(p))/(sqrt((x(i)-Parts(1,:)(p))^2+(y(j)-Parts(2,:)(p))^2+(z(k)-Parts(3,:)(p))^2))));
 E(j,i,k,3,p) =(Parts(4,:)(p)/((x(i)-Parts(1,:)(p))^2+(y(j)-Parts(2,:)(p))^2+(z(k)-Parts(3,:)(p))^2))*(z(k)-Parts(3,:)(p))/(sqrt((x(i)-Parts(1,:)(p))^2+((y(j)-Parts(2,:)(p)))^2+(z(k)-Parts(3,:)(p))^2));
 E(j,i,k,2,p) =(Parts(4,:)(p)/((x(i)-Parts(1,:)(p))^2+(y(j)-Parts(2,:)(p))^2+(z(k)-Parts(3,:)(p))^2))*sin(atan2((y(j)-Parts(2,:)(p)),(x(i)-Parts(1,:)(p))))*sin(acos((z(k)-Parts(3,:)(p))/(sqrt((x(i)-Parts(1,:)(p))^2+(y(j)-Parts(2,:)(p))^2+(z(k)-Parts(3,:)(p))^2))));
 E(j,i,k,o,n_a+1) = E(j,i,k,o,n_a+1)+E(j,i,k,o,p);
         end
       end
     end
   end
end
hold on
E(:,:,:,1,n_a+2)=X;
E(:,:,:,2,n_a+2)=Y;
E(:,:,:,3,n_a+2)=Z;
quiver3(E(:,:,:,1,n_a+2),E(:,:,:,2,n_a+2),E(:,:,:,3,n_a+2),E(:,:,:,1,n_a+1),E(:,:,:,2,n_a+1),E(:,:,:,3,n_a+1))
eplott=E;
hold off

endfunction
