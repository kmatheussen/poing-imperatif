if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___Vol__process(volume, input_1, retsel__) = 
  func__1925(volume, input_1, retsel__) with{
    func__1925(volume, input_1, retsel__) = 
      func__1926(volume, float(input_1), retsel__);

    func__1926(volume, input_1, retsel__) = 
      (volume, input_1, 0);

  };
c___Vol__process__return__(volume, input_1, retsel__) = 
      (input_1 * volume ) with{
  
};

c___Vol_____initrepeat(volume, input_1, retsel__) = 
  func__1927(volume, input_1, retsel__) with{
    func__1927(volume, input_1, retsel__) = 
      func__1928(float(volume), input_1, retsel__);

    func__1928(volume, input_1, retsel__) = 
      (volume, input_1, retsel__);

  };

c___Vol_____init(volume, input_1, retsel__) = 
  func__1929(volume, input_1, retsel__) with{
    func__1929(volume, input_1, retsel__) = 
      func__1930(float(volume), input_1, retsel__);

    func__1930(volume, input_1, retsel__) = 
      (volume, input_1, retsel__);

  };

c___Vol(volume, input_1) = (input_1 * volume );

half_volume = c___Vol ( 0.5 ) ; 
counter = + ( 1 ) ~ _ ; 
process = counter , half_volume ( counter ) ; 
                         
