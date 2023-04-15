% ***************************************************************
% author:   Wei Hu                                             **
% date:     04/12/2013                                         **
% modified: 01/13/2015                                         **
% purpose:  compute the adjacency matrix                       **
%           of a weigthed graph                                **
% input:    BWb: edge map                                      **
% output:   A: adjacency matrix                                **
% ***************************************************************

function [A] = AdjMatWei(BWb) 

BWb(2:2:end,2:2:end) = 0; % for 4-connectivity graphs
 
[N1,N2] = size(BWb);

N1 = N1./2;
N2 = N2./2;

offsets = [-1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1]./2;  

A = zeros(N1*N2);

% Form adjacency matrix for pixels in the current block 
for m = 1:N1
    for n = 1:N2
        ixt = sub2ind([N1 N2],m,n); % Convert subscripts to linear indices : x(Nj+i) = x(i,j)

        mN = m+offsets(:,1);
        nN = n+offsets(:,2);

        ixkeep = find((mN>0.5)&(mN<N1+0.5)&(nN>0.5)&(nN<N2+0.5)); % return linear indices
        mN = mN(ixkeep); nN = nN(ixkeep);

        for kk = 1:length(mN)
            mt = mN(kk)+sign(offsets(ixkeep(kk),1))*mod(offsets(ixkeep(kk),1),1);
            nt = nN(kk)+sign(offsets(ixkeep(kk),2))*mod(offsets(ixkeep(kk),2),1);

            ixt2 = sub2ind([N1 N2],mt,nt);

            A(ixt,ixt2) = BWb(2*(mN(kk))-1,2*(nN(kk))-1); 
            A(ixt2,ixt) = A(ixt,ixt2); % A is symmetric

        end
    end
end