 function [rectangle_rotate] = rectangle_rotate
   a=1;
   b=1;
   c=1;
   h=.1;
   equis=1;
   egriega=0;
   zeta=0;
   v=[1,0,0];
   R=retangu(a,b,c,h);
   cor=[0,0,0.5]
  plot3(0,0,0,0,0,0)
  
   [R_m, R_n]=size(R(:,1))


   
   plot3(R(:,1),R(:,2),R(:,3),'.','MarkerSize',50);
   
       hold on
for p = 1:R_m
R_prime(p,:)=vector_rotate(R(p,:)+cor,v,pi/3);
end
  plot3(R_prime(:,1),R_prime(:,2),R_prime(:,3),'.','MarkerSize',50);
 hold off
 endfunction
