clc
clear
m_20=0; 
m_30=0;    
m_40=0;  
m_10=0;  
m_50=0; 
m_60=0; 
m_70=0; 


All_data_Results_2_20 = cell(1,200);
All_data_Results_2_30 = cell(1,200);
All_data_Results_2_40 = cell(1,200);
All_data_Results_2_10 = cell(1,200);
All_data_Results_2_50 = cell(1,200);
All_data_Results_2_60 = cell(1,200);
All_data_Results_2_70 = cell(1,200);

for i = 3
ImageNum =i;

switch ImageNum
    
          case 1
                filename = 'WDC_New';
            case 2
                filename = 'Pavia_data';
            case 3
                filename = 'chart_and_stuffed_toy_ms_256';
                             
end

for j  =    1:7
  
        



randn ('seed',0);

filename




Sigma_Num            = [10, 20, 30, 40, 50, 75, 100];



Sigma             =       Sigma_Num (j)




 if  Sigma <=10
     
 p = 0.95; 

 [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 

 m_10= m_10+1;
 
 s=strcat('A',num2str(m_10));
 
 All_data_Results_2_10{m_10}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_10_Test.xls', All_data_Results_2_10{m_10},'sheet1',s);
 
 
 
 
 elseif  Sigma <=20
     
p = 0.90; 

 [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_20= m_20+1;
 
 s=strcat('A',num2str(m_20));
 
 All_data_Results_2_20{m_20}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_20_Test.xls', All_data_Results_2_20{m_20},'sheet1',s);
 
 
 elseif  Sigma <=30

     
               p = 0.90; 
     
 [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_30= m_30+1;
 
 s=strcat('A',num2str(m_30));
 
 All_data_Results_2_30{m_30}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_30_Test.xls', All_data_Results_2_30{m_30},'sheet1',s);
 
 
 elseif  Sigma <=40
     
               p = 0.90; 

     
  [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_40= m_40+1;
 
 s=strcat('A',num2str(m_40));
 
 All_data_Results_2_40{m_40}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_40_Test.xls', All_data_Results_2_40{m_40},'sheet1',s);
 
 

  elseif  Sigma <=50
      
                p = 0.90;
                

     
[filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_50= m_50+1;
 
 s=strcat('A',num2str(m_50));
 
 All_data_Results_2_50{m_50}={filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_50_Test.xls', All_data_Results_2_50{m_50},'sheet1',s);
 
 
  elseif  Sigma <=75
      
      
             p = 0.90; 

     
 [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_60= m_60+1;
 
 s=strcat('A',num2str(m_60));
 
 All_data_Results_2_60{m_60}= {filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 xlswrite('NLSSR_Sigma_75_Test.xls', All_data_Results_2_60{m_60},'sheet1',s);
 
 
 else
     
     
             p = 0.90;
     

  [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s]     =  NLSSR_Denoising_Test (filename, Sigma, p); 
 
 m_70= m_70+1;
 
 s=strcat('A',num2str(m_70));
 
 All_data_Results_2_70{m_70}= {filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, jj, Time_s};
 
 
 xlswrite('NLSSR_Sigma_100_Test.xls', All_data_Results_2_70{m_70},'sheet1',s);   
 

 
 
 end
 
 


 
    
 clearvars -except filename i m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40...
    m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60 m_70 All_data_Results_2_70       
end

 clearvars -except filename  m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40...
    m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60 m_70 All_data_Results_2_70 
end




         