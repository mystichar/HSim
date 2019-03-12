function [egraph]=egraph(E)
[m_E,n_E]=size(E(1,1,1,1,:));
n_a=n_E-2;
quiver3(E(:,:,:,1,n_a+2),E(:,:,:,2,n_a+2),E(:,:,:,3,n_a+2),E(:,:,:,1,n_a+1),E(:,:,:,2,n_a+1),E(:,:,:,3,n_a+1))
endfunction
