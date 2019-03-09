function [P]=plott45(a,b,c,q)
  x= 0:.25:2;
  y= 0:.25:2;
  z= 0:.25:2;
  t= 0:.25:2;
  pa=1
  m=[1,1]
  v_o=[0,1;0,0;0,0]
  P=zeros(t,t,t,t,t,t,m)
P(1,:,1,1,1,1)=x
P(1,:,2,1,1,1)=y
P(1,:,3,1,1,1)=z
  [ m_a, n_a] = size(a);
  [ m_m, n_m] = size(m);
  [X,Y,Z]=meshgrid(x,y,z);
  [ m_x, n_x] = size(x);
  n_m
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
E(j,i,k,o,n_a+1) = E(j,i,k,o,n_a+1)+E(j,i,k,o,p);
        end
      end
    end
  end
end


 for p=0:n_m
   
   end
  
 % 

quiver3(X,Y,Z,E(:,:,:,1,n_a+1),E(:,:,:,2,n_a+1),E(:,:,:,3,n_a+1))
hold on
i=1:pa
for i=1:pa
plot3(P(i,:,1),P(i,:,2),P(i,:,3));
end
P(1,:,1)
P(1,:,2)
hold off
endfunction
