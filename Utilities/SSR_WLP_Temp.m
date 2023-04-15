
function  [X] =  SSR_WLP_Temp( Y, C, NSig, m, p )
  
    [U,SigmaY,V] =   svd(full(Y),'econ');    
    PatNum       = size(Y,2);
    Temp         =   sqrt(max( diag(SigmaY).^2 - PatNum*NSig^2, 0 ));
    s = diag(SigmaY);
    s1 = zeros(size(s));
 
    for i=1:4
        W_Vec    =   (C*sqrt(PatNum)*NSig^2)./( Temp.^(1/p) + eps );               % Weight vector
    
       	s1       =   solve_Lp_w(s, W_Vec, p);
       	Temp     =   s1;
    end
    SigmaX = diag(s1);
    X =  U*SigmaX*V' + m; 
return;
