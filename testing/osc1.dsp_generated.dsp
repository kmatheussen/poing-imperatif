if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___Oscillator__process(frequency, phase, retsel__) = 
  func__1925(frequency, phase, retsel__) with{
    func__1925(frequency, phase, retsel__) = 
      func__1926(frequency, phase + ((frequency * 3.14 * 2 / 44100 )), retsel__);

    func__1926(frequency, phase, retsel__) = 
      (frequency, phase, 0);

  };
c___Oscillator__process__return__(frequency, phase, retsel__) = 
      (sin(phase )) with{
  
};

c___Oscillator_____initrepeat(frequency, phase, retsel__) = 
  func__1927(frequency, phase, retsel__) with{
    func__1927(frequency, phase, retsel__) = 
      func__1928(float(frequency), phase, retsel__);

    func__1928(frequency, phase, retsel__) = 
      (frequency, phase, retsel__);

  };

c___Oscillator_____init(frequency, phase, retsel__) = 
  func__1929(frequency, phase, retsel__) with{
    func__1929(frequency, phase, retsel__) = 
      func__1930(float(frequency), phase, retsel__);

    func__1930(frequency, phase, retsel__) = 
      (frequency, phase, retsel__);

  };

c___Oscillator(frequency) = (function__1934 ~ (_,_,_)   )  : process_return_convert1932 with{
    function__1934(notused__2, phase, notused__0) = c___Oscillator_____initrepeat(frequency, phase, 0) : process_convert1931;
  process_convert1931(frequency, phase, retsel__) = c___Oscillator__process(frequency, phase, retsel__);
  process_return_convert1932(frequency, phase, retsel__) = c___Oscillator__process__return__(frequency, phase, retsel__);
};
freq = hslider ( "freq" , 400.0 , 10 , 3000 , 1 ) ; 

process = c___Oscillator ( freq ) ; 
                      
