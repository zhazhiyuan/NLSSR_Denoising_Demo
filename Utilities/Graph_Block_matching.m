function  [Init_Index]  =  Graph_Block_matching(X, Opts,Neighbor_arr,Num_arr, SelfIndex_arr)
L         =   length(Num_arr);
Init_Index   =  zeros(Opts.patnum,L);

for  i  =  1 : L
    
    Patch = X(:,SelfIndex_arr(i));
    
    Neighbors = X(:,Neighbor_arr(1:Num_arr(i),i));   
    
    mP        =      mean(Neighbors,2);
    mblk      =      reshape(mP,Opts.patsize,Opts.patsize);    
  
    Graph_L   =   WGBT_dict (mblk, Opts.nSig/255);
 
    Dist =  sum(abs(repmat(Graph_L*Patch,1,size(Neighbors,2))-Graph_L*Neighbors));  
    
    [val, index] = sort(Dist);
    
    Init_Index(:,i)=Neighbor_arr(index(1:Opts.patnum),i);
end
