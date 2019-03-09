function [eplott]=eplott(parts)
  
E=zeros(x,x,x,x,x);
Parts(
a,b,c,q
 E(1,1,1,1,n_a+1)=1;
 for o=1:3
  for p=1:n_a
     for k=1:n_x
       for j=1:n_x
         for i=1:n_x
 E(j,i,k,1,p) =(q(p)/((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))*cos(atan2((y(j)-b(p)),(x(i)-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))));
 E(j,i,k,3,p) =(q(p)/((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))*(z(k)-c(p))/(sqrt((x(i)-a(p))^2+((y(j)-b(p)))^2+(z(k)-c(p))^2));
 E(j,i,k,2,p) =(q(p)/((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))*sin(atan2((y(j)-b(p)),(x(i)-a(p))))*sin(acos((z(k)-c(p))/(sqrt((x(i)-a(p))^2+(y(j)-b(p))^2+(z(k)-c(p))^2))));
 E(j,i,k,o,n_a+1) = E(j,i,k,o,n_a+1)+E(j,i,k,o,p);
         end
       end
     end
   end
end
quiver3(X,Y,Z,E(:,:,:,1,n_a+1),E(:,:,:,2,n_a+1),E(:,:,:,3,n_a+1))


endfunction
