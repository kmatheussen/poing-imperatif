if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);



slider = hslider ( "slider" , 4 , 1 , 10 , 1 ) ; 
process = slider > 1000 ; 
                     
