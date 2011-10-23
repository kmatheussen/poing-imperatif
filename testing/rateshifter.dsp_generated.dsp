if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

import ( "math.lib" ) ; 

c___SAMPLERATE = c___SR ; 

c___DELAY_SIZE = 8192 ; 
c___M_PI = 3.1415926535897932384626433832795028841 ; 

pitchSlider = hslider ( "Pitch" , 1.0 , 0.25 , 4.0 , 0.025 ) ; 
bufSlider = hslider ( "Buffer size" , 4 , 1 , 7 , 1 ) ; 
volumeSlider = hslider ( "Volume" , 1.0 , 0.1 , 6.0 , 0.025 ) ; 

c___Fixp16__set_all(all, in, fr, all_1, inc_2, retsel__) = 
  func__1925(all, in, fr, all_1, inc_2, retsel__) with{
    func__1925(all, in, fr, all_1, inc_2, retsel__) = 
      func__1926(all, in, fr, int(all_1), inc_2, retsel__);

    func__1926(all, in, fr, all_1, inc_2, retsel__) = 
      func__1927((all_1 ), in, fr, all_1, inc_2, retsel__);

    func__1927(all, in, fr, all_1, inc_2, retsel__) = 
      func__1928(all, (all_1 >> 16 ), fr, all_1, inc_2, retsel__);

    func__1928(all, in, fr, all_1, inc_2, retsel__) = 
      func__1929(all, in, (all_1 &  65535 ), all_1, inc_2, retsel__);

    func__1929(all, in, fr, all_1, inc_2, retsel__) = 
      (all, in, fr, all_1, inc_2, retsel__);

  };

c___Fixp16__inc_all(all, in, fr, all_1, inc_2, retsel__) = 
  func__1930(all, in, fr, all_1, inc_2, retsel__) with{
    func__1930(all, in, fr, all_1, inc_2, retsel__) = 
      func__1931(all, in, fr, all_1, int(inc_2), retsel__);

    func__1931(all, in, fr, all_1, inc_2, retsel__) = 
      func__1932(all, in, fr, ((all + inc_2 )):_, inc_2, retsel__);

    func__1932(all, in, fr, all_1, inc_2, retsel__) = 
      helper1936(c___Fixp16__set_all(all, in, fr, all_1, inc_2, retsel__)) with{
           helper1936((all, in, fr, all_1, inc_2, retsel__)) = 
              func__1933(all, in, fr, all_1, inc_2, retsel__);};

    func__1933(all, in, fr, all_1, inc_2, retsel__) = 
      (all, in, fr, all_1, inc_2, retsel__);

  };

c___Fixp16_____initrepeat(all, in, fr, all_1, inc_2, retsel__) = 
  func__1934(all, in, fr, all_1, inc_2, retsel__) with{
    func__1934(all, in, fr, all_1, inc_2, retsel__) = 
      (all, in, fr, all_1, inc_2, retsel__);

  };

c___Fixp16_____init(all, in, fr, all_1, inc_2, retsel__) = 
  func__1935(all, in, fr, all_1, inc_2, retsel__) with{
    func__1935(all, in, fr, all_1, inc_2, retsel__) = 
      (all, in, fr, all_1, inc_2, retsel__);

  };

c___Fixp32_____initrepeat(retsel__) = 
  func__1937(retsel__) with{
    func__1937(retsel__) = 
      (retsel__);

  };

c___Fixp32_____init(retsel__) = 
  func__1938(retsel__) with{
    func__1938(retsel__) = 
      (retsel__);

  };

f_round ( f ) = int ( rint ( f ) ) ; 

cube_interp ( fr , inm1 , in , inp1 , inp2 ) = 
in + 
0.5 * fr * ( inp1 - 
inm1 + 
fr * ( 4.0 * inp1 + 2.0 * inm1 - 
5.0 * in - 
inp2 + 
fr * ( 3.0 * ( in - inp1 ) - 
inm1 + 
inp2 ) ) ) ; 
closest_power2 ( x ) = pow ( 2 , int ( temp + 0.5 ) ) with { 
temp = log ( x ) / log ( 2 ) ; 
} ; 

buffer_size = closest_power2 ( 2.7 * c___SAMPLERATE ) ; 


c___RateShifter__process(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
  func__1943(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) with{
    func__1943(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1944(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, (rate * 4294967296.0 f ), read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1944(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1945(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr___in, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1945(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1946(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, (read_ptr_get_res1939 ), read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1946(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1947(rate, read_ptr___retsel__, write_ptr, (write_ptr ), (input_3 ), buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1947(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1948(rate, read_ptr___retsel__, ((write_ptr + 1 )& buffer_mask ), buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1948(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1949(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr___fr, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1949(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1950(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, (cube_interp((float )read_ptr_get_res1940 / 4294967296.0 f , rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, ((rp_5 - 1 )& buffer_mask )), rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, (rp_5 )), rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, ((rp_5 + 1 )& buffer_mask )), rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, ((rp_5 + 2 )& buffer_mask )))), read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1950(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1951(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_4___all, read_ptr_get_res1942, retsel__);

    func__1951(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      helper1961(rate, c___Fixp32__inc_all(read_ptr___retsel__), write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) with{
           helper1961(rate, (read_ptr___retsel__), write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
              func__1952(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);};

    func__1952(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1953(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr___in, retsel__);

    func__1953(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1954(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1954(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      (rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, 0);

    buffer__size = (buffer_size );
    buffer__init = (0.0):float;
  };
c___RateShifter__process__return__(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      (out_6 ) with{
      buffer__size = (buffer_size );
    buffer__init = (0.0):float;

};

c___RateShifter_____initrepeat(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
  func__1955(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) with{
    func__1955(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1956(float(rate), read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1956(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      (rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    buffer__size = (buffer_size );
    buffer__init = (0.0):float;
  };

c___RateShifter_____init(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
  func__1957(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) with{
    func__1957(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1958(float(rate), read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1958(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      helper1962(rate, c___Fixp32_____init(read_ptr___retsel__), write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) with{
           helper1962(rate, (read_ptr___retsel__), write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
              func__1959(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);};

    func__1959(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      func__1960(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, (buffer_size - 1 ), input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    func__1960(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = 
      (rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);

    buffer__size = (buffer_size );
    buffer__init = (0.0):float;
  };

c___RateShifter(rate, input_3) = (function__1966 ~ (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, !) : process_return_convert1964 with{
    function__1966(notused__14, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, notused__8, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, notused__0, notfirst__1965) = (if__(notfirst__1965,
          function_process__1968(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, 0),
          function_init__1967(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, 0)
    )),1;
  function_init__1967(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = process_convert1963(c___RateShifter_____init(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__));
  function_process__1968(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = process_convert1963(c___RateShifter_____initrepeat(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__));
  process_convert1963((rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__)) = c___RateShifter__process(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);
  process_return_convert1964(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__) = c___RateShifter__process__return__(rate, read_ptr___retsel__, write_ptr, buffer__pos, buffer__val, buffer_mask, input_3, read_inc_4, read_ptr_get_res1939, rp_5, read_ptr_get_res1940, out_6, read_inc_get_res1941, read_ptr_get_res1942, retsel__);
};

                                                                                                                                                                               
