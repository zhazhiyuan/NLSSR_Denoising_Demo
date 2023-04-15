% ***************************************************************
% author:   Wei Hu                                             **
% date:     04/12/2013                                         **
% modified: 01/13/2015                                         **
% purpose:  compute weighted GBT basis functions               **
%           for a patch with AWGN                              **
% input:    patch: noisy patch                                 **
%           nSig: noise variance                               **
% output:   V: computed GBT basis                              **
% ***************************************************************

function [ L ] = WGBT(patch,nSig)  

% step 1: construct a similarity graph
[BW_big, T, gd] = edge_double_grid_alternate_tree(patch,nSig);  % gd: gradient
alpha = 0.1;  % 0.1~0.2
sigma = alpha*(nSig + max(max(abs(gd))));
SimMat = exp(-gd.^2/(sigma^2));

% step 2: compute basis vectors by eigen-decomposition
W = AdjMatWei(SimMat);  % generate weighted adjacency matrix  
D = diag(sum(W,2));  
L = D - W;
%[V, Lam] = eig(L);

end

