% ***************************************************************
% author:   Wei Hu                                             **
% date:     04/12/2013                                         **
% modified: 01/13/2015                                         **
% purpose:  compute the gradients and edge map of an image     **
% input:    X: noisy image                                     **
%           nSig: noise variance                               **
% output:   BW_big: the computed edge map                      **
%           T: threshold for edge detection                    **
%           Y: gradients                                       **
% ***************************************************************

function [BW_big, T, Y] = edge_double_grid_alternate_tree(X,nSig)

X = double(X);
[Nx,Ny]=size(X);
Y = zeros(2*Nx,2*Ny);

for i = 2:Nx-1
    for j = 2:Ny-1
        Y(2*(i-0.5)-1,2*j-1) = X(i,j)-X(i-1,j);
        Y(2*i-1,2*(j+0.5)-1) = X(i,j)-X(i,j+1);
    end
end

% First Column
for i = 2:Nx-1
    j = 1;
    
    Y(2*(i-0.5)-1,2*j-1) = X(i,j)-X(i-1,j);
    Y(2*i-1,2*(j+0.5)-1) = X(i,j)-X(i,j+1);
end

% Last Column
for i = 2:Nx
    j = Ny;
    
    Y(2*(i-0.5)-1,2*j-1) = X(i,j)-X(i-1,j);
end

% First Row
for j = 1:Ny-1
    i = 1;    
    Y(2*i-1,2*(j+0.5)-1) = X(i,j)-X(i,j+1);
end

% Last Row
for j = 1:Ny-1
    i = Nx;   
    Y(2*(i-0.5)-1,2*j-1) = X(i,j)-X(i-1,j);
    Y(2*i-1,2*(j+0.5)-1) = X(i,j)-X(i,j+1);
end

[ifull,jfull] = meshgrid(1:2*Nx,1:2*Ny);
ifull = ifull(:); jfull = jfull(:);
ixkeep = find((mod(ifull,2) == 0) | (mod(jfull,2) == 0));

mu_g = mean(abs(Y(ixkeep)));
std_g = std(abs(Y(ixkeep)));

T = (mu_g + std_g);  
if T <= nSig
    T = (mu_g + std_g+nSig);
end
    
BW_big = zeros(2*Nx, 2*Ny);
BW_big(abs(Y)>T) = 1;
if sum(BW_big(:)) == 1
    BW_big = zeros(2*Nx, 2*Ny); 
end
