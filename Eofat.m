function [Eofat]=Eofat(a,b,c,q,d,e,f)
  Eofat=[0,0,0];
  [ m_a, n_a] = size(a);


for  p=1:n_a

E(p,1) =(q(p)/((d-a(p))^2+(e-b(p))^2+(f-c(p))^2))*cos(atan2((e-b(p)),(d-a(p))))*sin(acos((f-c(p))/(sqrt((d-a(p))^2+(e-b(p))^2+(f-c(p))^2))));
E(p,3) =(q(p)/((d-a(p))^2+(e-b(p))^2+(f-c(p))^2))*(f-c(p))/(sqrt((d-a(p))^2+((e-b(p)))^2+(f-c(p))^2));
E(p,2) =(q(p)/((d-a(p))^2+(e-b(p))^2+(f-c(p))^2))*sin(atan2((e-b(p)),(d-a(p))))*sin(acos((f-c(p))/(sqrt((d-a(p))^2+(e-b(p))^2+(f-c(p))^2))));
E(n_a+1,1) = E(p,1)+E(1,1);
E(n_a+1,2) = E(1,2)+E(1,2);
E(n_a+1,3) = E(p,3)+E(1,3);
end
Eofat=[E(n_a+1,1),E(n_a+1,2),E(n_a+1,3)];
endfunction