if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___Phase__increase_phase(phase, how_much_1, retsel__) = 
  func__1925(phase, how_much_1, retsel__) with{
    func__1925(phase, how_much_1, retsel__) = 
      func__1926(phase, float(how_much_1), retsel__);

    func__1926(phase, how_much_1, retsel__) = 
      func__1927(phase + ((how_much_1 )), how_much_1, retsel__);

    func__1927(phase, how_much_1, retsel__) = 
      (phase, how_much_1, retsel__);

  };

c___Phase_____initrepeat(phase, how_much_1, retsel__) = 
  func__1928(phase, how_much_1, retsel__) with{
    func__1928(phase, how_much_1, retsel__) = 
      (phase, how_much_1, retsel__);

  };

c___Phase_____init(phase, how_much_1, retsel__) = 
  func__1929(phase, how_much_1, retsel__) with{
    func__1929(phase, how_much_1, retsel__) = 
      (phase, how_much_1, retsel__);

  };

c___Oscillator__process(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
  func__1931(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) with{
    func__1931(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      func__1932(frequency, phase___phase, ((frequency * 3.14 * 2 / 44100 )):_, phase___retsel__, phase_get_res1930, retsel__);

    func__1932(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      helper1940(frequency, c___Phase__increase_phase(phase___phase, phase___how_much_1, phase___retsel__), phase_get_res1930, retsel__) with{
           helper1940(frequency, (phase___phase, phase___how_much_1, phase___retsel__), phase_get_res1930, retsel__) = 
              func__1933(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);};

    func__1933(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      func__1934(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase___phase, retsel__);

    func__1934(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      (frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, 0);

  };
c___Oscillator__process__return__(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      (sin(phase_get_res1930 )) with{
  
};

c___Oscillator_____initrepeat(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
  func__1935(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) with{
    func__1935(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      func__1936(float(frequency), phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);

    func__1936(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      (frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);

  };

c___Oscillator_____init(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
  func__1937(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) with{
    func__1937(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      func__1938(float(frequency), phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);

    func__1938(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      helper1941(frequency, c___Phase_____init(phase___phase, phase___how_much_1, phase___retsel__), phase_get_res1930, retsel__) with{
           helper1941(frequency, (phase___phase, phase___how_much_1, phase___retsel__), phase_get_res1930, retsel__) = 
              func__1939(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);};

    func__1939(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = 
      (frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);

  };

c___Oscillator(frequency) = (function__1945 ~ (_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, !) : process_return_convert1943 with{
    function__1945(notused__5, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, notused__0, notfirst__1944) = (if__(notfirst__1944,
          function_process__1947(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, 0),
          function_init__1946(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, 0)
    )),1;
  function_init__1946(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = process_convert1942(c___Oscillator_____init(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__));
  function_process__1947(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = process_convert1942(c___Oscillator_____initrepeat(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__));
  process_convert1942((frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__)) = c___Oscillator__process(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);
  process_return_convert1943(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__) = c___Oscillator__process__return__(frequency, phase___phase, phase___how_much_1, phase___retsel__, phase_get_res1930, retsel__);
};
freq = hslider ( "freq" , 400.0 , 10 , 3000 , 1 ) ; 

process = c___Oscillator ( freq ) ; 
                      
