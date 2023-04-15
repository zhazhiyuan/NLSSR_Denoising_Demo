function  [Opts]=Opts_Set(nSig, band,  p )


Opts.nSig        =   nSig;                            
Opts.SearchWin   =   30;                                 
                   
Opts.step        =  4;                                   
Opts.p           =  p;    


if band<=50
    
    if nSig<=10.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;      
    Opts.Iter          =   7; 
    Opts.lamada        =   0.58; 
    Opts.k_subspace    =   9;
    Opts.c1            =  15*sqrt(2); 
elseif nSig <= 20.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   7; 
    Opts.lamada        =   0.54; 
    Opts.k_subspace    =   7;
    Opts.c1            =  29*sqrt(2);  
elseif nSig <= 30.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   8; 
    Opts.lamada        =   0.56; 
    Opts.k_subspace    =   6;
    Opts.c1            =  26*sqrt(2);     
elseif nSig <= 40.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   8; 
    Opts.lamada        =   0.54; 
    Opts.k_subspace    =   5;
    Opts.c1            =  28*sqrt(2);    
elseif nSig <= 50.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   9; 
    Opts.lamada        =  0.58; 
    Opts.k_subspace    =   5;
    Opts.c1            =  25*sqrt(2);  
    elseif nSig <= 75.1
    Opts.patsize       =   5;
    Opts.patnum        =   200;
    Opts.Iter          =   10; 
    Opts.lamada        =  0.56; 
    Opts.k_subspace    =   4;
    Opts.c1            =  28*sqrt(2); 
    
    
    else
    Opts.patsize       =   5;
    Opts.patnum        =   200;
    Opts.Iter          =   11;%5;
    Opts.lamada        =  0.54;% 0.58; 
    Opts.k_subspace    =   4;
    Opts.c1            =  29*sqrt(2);%5*sqrt(2);
            
    end
    
    
    
 
elseif band<=100
    if nSig<=10.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;      
    Opts.Iter          =   6; 
    Opts.lamada        =   0.57; 
    Opts.k_subspace    =   10;
    Opts.c1            =  24*sqrt(2); 
elseif nSig <= 20.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =   0.55; 
    Opts.k_subspace    =   7;
    Opts.c1            =  40*sqrt(2); 
elseif nSig <= 30.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =   0.60; 
    Opts.k_subspace    =   6;
    Opts.c1            =  35*sqrt(2);    
elseif nSig <= 40.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =   0.52; 
    Opts.k_subspace    =   5;
    Opts.c1            =  45*sqrt(2);     
elseif nSig <= 50.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =  0.53; 
    Opts.k_subspace    =   5;
    Opts.c1            =  45*sqrt(2);   
else
    Opts.patsize       =   5;
    Opts.patnum        =   200;
    Opts.Iter          =   6; 
    Opts.lamada        =  0.53; 
    Opts.k_subspace    =   5;
    Opts.c1            =  50*sqrt(2);      
    end
  %%%%%%%%%%%%%%%%%%  
    elseif band<=250
     if nSig<=10.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;      
    Opts.Iter          =   8; 
    Opts.lamada        =   0.56; 
    Opts.k_subspace    =   10;
    Opts.c1            =  24*sqrt(2);    
elseif nSig <= 20.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   7; 
    Opts.lamada        =   0.55; 
    Opts.k_subspace    =   7;
    Opts.c1            =  40*sqrt(2); 
elseif nSig <= 30.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =   0.58; 
    Opts.k_subspace    =   7;
    Opts.c1            =  35*sqrt(2);       
elseif nSig <= 40.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =   0.56; 
    Opts.k_subspace    =   5;
    Opts.c1            =  45*sqrt(2);        
elseif nSig <= 50.1
    Opts.patsize       =   5;
    Opts.patnum        =   150;
    Opts.Iter          =   6; 
    Opts.lamada        =  0.57; 
    Opts.k_subspace    =   5;
    Opts.c1            =  45*sqrt(2);  
else
    Opts.patsize       =   5;
    Opts.patnum        =   200;
    Opts.Iter          =   6; 
    Opts.lamada        =  0.58; 
    Opts.k_subspace    =   5;
    Opts.c1            =  50*sqrt(2); 
    end
end













end
   

