function [vector_rotate] = vector_rotate(u,v,gamatria)
  v=v/norm(v);
  vector_rotate=u*cos(gamatria)+cross(u,v)*sin(gamatria)+v*dot(v,u)*(1-cos(gamatria));
endfunction
