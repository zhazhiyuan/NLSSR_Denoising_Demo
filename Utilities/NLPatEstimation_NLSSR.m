function [E_Temp] = NLPatEstimation_NLSSR( Temp, Opts, Sigma)

 
   
              M_Temp  =   repmat(mean( Temp, 2 ),1,Opts.patnum);
            
            Temp    =   Temp - M_Temp;
            
            E_Temp 	=   SSR_WLP_Temp(Temp, Opts.c1, Sigma,M_Temp, Opts.p);           
            
            
            
            
            
            
 
end

