if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

c___Oscillator__increase_phase(frequency, phase, how_much_1, retsel__) = 
  func__1925(frequency, phase, how_much_1, retsel__) with{
    func__1925(frequency, phase, how_much_1, retsel__) = 
      func__1926(frequency, phase, float(how_much_1), retsel__);

    func__1926(frequency, phase, how_much_1, retsel__) = 
      func__1927(frequency, phase + ((how_much_1 )), how_much_1, retsel__);

    func__1927(frequency, phase, how_much_1, retsel__) = 
      (frequency, phase, how_much_1, retsel__);

  };

c___Oscillator__process(frequency, phase, how_much_1, retsel__) = 
  func__1928(frequency, phase, how_much_1, retsel__) with{
    func__1928(frequency, phase, how_much_1, retsel__) = 
      func__1929(frequency, phase, ((frequency * 3.14 * 2 / 44100 )):_, retsel__);

    func__1929(frequency, phase, how_much_1, retsel__) = 
      helper1935(c___Oscillator__increase_phase(frequency, phase, how_much_1, retsel__)) with{
           helper1935((frequency, phase, how_much_1, retsel__)) = 
              func__1930(frequency, phase, how_much_1, retsel__);};

    func__1930(frequency, phase, how_much_1, retsel__) = 
      (frequency, phase, how_much_1, 0);

  };
c___Oscillator__process__return__(frequency, phase, how_much_1, retsel__) = 
      (sin(phase )) with{
  
};

c___Oscillator_____initrepeat(frequency, phase, how_much_1, retsel__) = 
  func__1931(frequency, phase, how_much_1, retsel__) with{
    func__1931(frequency, phase, how_much_1, retsel__) = 
      func__1932(float(frequency), phase, how_much_1, retsel__);

    func__1932(frequency, phase, how_much_1, retsel__) = 
      (frequency, phase, how_much_1, retsel__);

  };

c___Oscillator_____init(frequency, phase, how_much_1, retsel__) = 
  func__1933(frequency, phase, how_much_1, retsel__) with{
    func__1933(frequency, phase, how_much_1, retsel__) = 
      func__1934(float(frequency), phase, how_much_1, retsel__);

    func__1934(frequency, phase, how_much_1, retsel__) = 
      (frequency, phase, how_much_1, retsel__);

  };

c___Oscillator(frequency) = (function__1939 ~ (_,_,_,_)   )  : process_return_convert1937 with{
    function__1939(notused__3, phase, notused__1, notused__0) = c___Oscillator_____initrepeat(frequency, phase, 0.0, 0) : process_convert1936;
  process_convert1936(frequency, phase, how_much_1, retsel__) = c___Oscillator__process(frequency, phase, how_much_1, retsel__);
  process_return_convert1937(frequency, phase, how_much_1, retsel__) = c___Oscillator__process__return__(frequency, phase, how_much_1, retsel__);
};
freq = hslider ( "freq" , 400.0 , 10 , 3000 , 1 ) ; 

process = c___Oscillator ( freq ) ; 
                      
