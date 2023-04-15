function [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,ERGAS_Final, SAM_Final, iter, Time_s]     =  NLSSR_Denoising_Test  (filename, Sigma, p)

randn ('seed',0);

time0                              =               clock;

fn                                 =               [filename, '.mat'];

load (fn);

Ori_Image                          =                im2double(NRD);

[M, N, kk]                         =               size (Ori_Image);

nSig                               =               Sigma/255;

noiselevel                         =               nSig*ones(1,kk);    


for i       =       1 : kk
    
Ori_Image_noise(:,:,i)             =                Ori_Image(:,:,i)  + noiselevel(i)*randn(M,N);

end


Opts                               =                Opts_Set(255*mean(noiselevel),kk,  p);



[Denoising, iter]                  =                NLSSR_Denoising_Main( 255*Ori_Image_noise, 255*Ori_Image, Opts);  



Time_s                             =                (etime(clock,time0));



if isequal (filename,'Pavia_data')

output_image                       =                 Denoising{iter-1};
else
output_image                       =                 Denoising{iter};
end
    



[PSNR_all,SSIM,FSIM,SAM_vector, ERGASvector]     =       evaluate(Ori_Image,output_image/255,M,N);

PSNR_Final                         =                 mean(PSNR_all)

FSIM_Final                         =                 mean(FSIM)

SSIM_Final                         =                 mean(SSIM)

SAM_Final                          =                 mean (SAM_vector)

ERGAS_Final                        =                 mean (ERGASvector)
    
    
    
    
  
    


 if Sigma==10
     
     
     for j = 1:kk
         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);    
       

aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
imwrite(uint8(eeee*255),strcat('./10_Result/',Final_denoisng));
     end
     
     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)

   
 elseif Sigma==20
% 
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      
% 


   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./20_Result/',Final_denoisng));
     end

     
     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
   
   
 elseif Sigma==30
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      

       
   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./30_Result/',Final_denoisng));
     end
% 

     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
   
% 
 elseif Sigma==40
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      

       
   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./40_Result/',Final_denoisng));
     end
% 
% 

     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
   
   
 elseif Sigma==50
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      

       
   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./50_Result/',Final_denoisng));
     end

     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
   
   
 elseif Sigma==75
%     
     for j = 1:kk
%         
      psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      

       
   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./75_Result/',Final_denoisng));
     end
% 
% 

     Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
   
   
 else
%     
     for j = 1:kk
%         
       psnr_e =  csnr (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       ssim_e =  cal_ssim (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255,0,0);
%       
       fsim_e =  FeatureSIM (double(output_image(:,:,j)), double (Ori_Image(:,:,j))*255);      

       
   aa= output_image(:,:,j);

cc= aa- min(aa(:));

dd= max(aa(:))-min(aa(:));
eeee= cc/dd;
    
       
 
       Final_denoisng= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8(eeee*255),strcat('./100_Result/',Final_denoisng));
     end
     
     
          Final_denoisng_2= strcat(filename,'_NLSSR','_sigma_',num2str(Sigma),'.xls');
     
     
   xlswrite(Final_denoisng_2,PSNR_all)
% 
 end


end