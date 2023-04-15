function [Denoising, iter]            =               NLSSR_Denoising_Main( N_Img, O_Img, Opts )


delta                                 =                              2;

E_Img                                 =                             N_Img;     

[Height, Width, Band]                 =                             size(E_Img);  

N                                     =                             Height*Width;

TotalPatNum                           =                             (Height-Opts.patsize+1)*(Width-Opts.patsize+1);         

Average                               =                              mean(N_Img,3);                   

[Neighbor_arr, Num_arr, Self_arr]     =	                             NeighborIndex(Average, Opts);   

Denoising                             =                              cell (1,Opts.Iter );

All_PSNR                              =                              zeros (1,Opts.Iter );

for iter = 1 : Opts.Iter 
 
 k_subspace                           =                              Opts.k_subspace+delta*(iter-1);
 
 Y                                    =                              reshape(E_Img, N, Band)';
 
 E_Img1                               =                               E_Img;
 
 [E,~,~]                              =                               svd(Y,'econ');
 
 if k_subspace< Band
 
 E                                    =                               E(:,1:k_subspace);
 else
  k_subspace    = Band;
  E                                    =                               E(:,1:k_subspace);    
 end
 

 E_Img                                =                               reshape((E'*Y)', Height,Width, k_subspace);
   
 N_Img1                               =                               reshape((E'*reshape(N_Img, N, Band)')', Height,Width, k_subspace); %%% add change N_Img1 as N_Img 
   
 Band1                                =                                k_subspace;


 
Average                               =                                 mean(E_Img,3);

[CurPat, Mat, Sigma_arr]	          =	                                Cub2Patch( E_Img, N_Img1, Average, Opts );

if (mod(iter-1,2)==0)

    Opts.patnum                        =                                  Opts.patnum - 10;                                     
     
       
    NL_mat                            =                                   Graph_Block_matching(Mat, Opts, Neighbor_arr, Num_arr, Self_arr);   
        if(iter==1)
            Sigma_arr = Opts.nSig * ones(size(Sigma_arr))*sqrt(k_subspace/Band);                    
        end
end



 EPat = zeros(size(CurPat));
    W    = zeros(size(CurPat));
    Temp = cell(length(Self_arr),1);
    E_Temp = cell(length(Self_arr),1);

    
     for i = 1:length(Self_arr)
      Temp{i}          =      CurPat(:, NL_mat(1:Opts.patnum,i)); 
     end   
    
     parfor i = 1:length(Self_arr)
     E_Temp{i}    =  NLPatEstimation_NLSSR( Temp{i},Opts, Sigma_arr(Self_arr(i))); 
     end   
    
    for  i      =  1 : length(Self_arr)                                 % For each keypatch group
     EPat(:,NL_mat(1:Opts.patnum,i))  = EPat(:,NL_mat(1:Opts.patnum,i)) + E_Temp{i};      
     W(:,NL_mat(1:Opts.patnum,i))     = W(:,NL_mat(1:Opts.patnum,i)) + ones(size(CurPat,1),size(NL_mat(1:Opts.patnum,i),1));
     end   
    
 
% reconstruct patches to 3-D image
    [Spa_Img, Spa_Wei]   =  Patch2Cub( EPat, W, Opts.patsize, Height, Width, Band1 );       % Patch to Cubic
    E_Img = Spa_Img./Spa_Wei;
 
    E_Img = reshape(reshape(E_Img, Height*Width, k_subspace)*E',Height,Width, Band);
    
     


[PSNR_iter]                          =                                    evaluate_1(O_Img/255,E_Img/255,Height,Width);

PSNR_iter                            =                                    mean(PSNR_iter);

All_PSNR (iter)                      =                                     PSNR_iter; 

%SSIM                                         =                     mean(SSIM);

Denoising{iter}                     =                                      E_Img;

fprintf( 'NLSSR for HSI denoising: Iter = %2.3f, PSNR = %2.2f \n', iter, PSNR_iter );

if iter<Opts.Iter
    
     E_Img                                   =                     0.1*N_Img+0.9*E_Img;
     
else
    
end


       if  iter > 2
      
       
       
         if All_PSNR (iter) - All_PSNR (iter-1) <  0
           
               break;
         end
       
      end


end


end

