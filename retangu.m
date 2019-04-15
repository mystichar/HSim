function [retangu]=retangu(a,b,c,h)
x=0:h:a;
y=0:h:b;
z=0:h:c;
  [ m_x, n_x] = size(x);
  [ m_y, n_y] = size(y);
  [ m_z, n_z] = size(z);
  retangu = zeros( n_x^3,3 );
   for k= 1:n_z
  for j= 1:n_y
    for i=1:n_x
  retangu(j+n_x*(i-1)+n_x^2*(k-1),1)=x(i)-a/2;
  retangu(j+n_x*(i-1)+n_x^2*(k-1),2)=y(j)-b/2;
  retangu(j+n_x*(i-1)+n_x^2*(k-1),3)=z(k)-c/2;
end
end
end

 fill3(retangu(:,3),retangu(:,2),retangu(:,1),'.','MarkerSize',50);

 endfunction