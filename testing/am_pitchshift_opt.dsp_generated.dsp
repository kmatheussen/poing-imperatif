if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);
































c___DELAY_SIZE = 8192 ; 
c___M_PI = 3.1415926535897932384626433832795028841 ; 

pitchSlider = hslider ( "Pitch" , 1.0 , 0.25 , 4.0 , 0.025 ) ; 
bufSlider = hslider ( "Buffer size" , 4 , 1 , 7 , 1 ) ; 
volumeSlider = hslider ( "Volume" , 1.0 , 0.1 , 6.0 , 0.025 ) ; 

c___Fixp16__get_fr(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1925(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1925(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, 0);

  };
c___Fixp16__get_fr__return__(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all &  65535 ) with{
  
};

c___Fixp16__get_in(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1926(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1926(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, 0);

  };
c___Fixp16__get_in__return__(all, delay_mask_1, all_2, inc_3, retsel__) = 
      ((all >> 16 )& delay_mask_1 ) with{
  
};

c___Fixp16__set_all(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1927(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1927(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1928(all, delay_mask_1, int(all_2), inc_3, retsel__);

    func__1928(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1929(all, delay_mask_1, (int(all_2 )), inc_3, retsel__);

    func__1929(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1930((all_2 ), delay_mask_1, all_2, inc_3, retsel__);

    func__1930(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, retsel__);

  };

c___Fixp16__inc_all(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1931(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1931(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1932(all, delay_mask_1, all_2, int(inc_3), retsel__);

    func__1932(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1933(all, delay_mask_1, all_2, (int(inc_3 )), retsel__);

    func__1933(all, delay_mask_1, all_2, inc_3, retsel__) = 
      func__1934(all, delay_mask_1, ((all + inc_3 )):_, inc_3, retsel__);

    func__1934(all, delay_mask_1, all_2, inc_3, retsel__) = 
      helper1938(c___Fixp16__set_all(all, delay_mask_1, all_2, inc_3, retsel__)) with{
           helper1938((all, delay_mask_1, all_2, inc_3, retsel__)) = 
              func__1935(all, delay_mask_1, all_2, inc_3, retsel__);};

    func__1935(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, retsel__);

  };

c___Fixp16_____initrepeat(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1936(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1936(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, retsel__);

  };

c___Fixp16_____init(all, delay_mask_1, all_2, inc_3, retsel__) = 
  func__1937(all, delay_mask_1, all_2, inc_3, retsel__) with{
    func__1937(all, delay_mask_1, all_2, inc_3, retsel__) = 
      (all, delay_mask_1, all_2, inc_3, retsel__);

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


c___PitchShift__process(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
  func__1943(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
    func__1943(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1944(pitch, (int(size )), delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1944(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1945(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, (last_gain ), gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1945(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1946(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, (last_inc ), i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1946(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1947(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, (f_round(pitch * 65536.0 )), input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1947(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1948(pitch, size, delay__pos, delay__val, wptr, ((1 << (size + 6 ))- 1 ), delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1948(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1949(pitch, size, delay__pos, delay__val, wptr, delay_mask, (1 << (size + 5 )), last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1949(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1950(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, (0.0 ), tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1950(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1951(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count+1, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1951(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      if__((count > 14 ),     func__1952(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__),     func__1953(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__));

    func__1952(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1955(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, (0 ), last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1955(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1956(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, (delay_mask ):_, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1956(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1992(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16__get_in(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1992(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1957(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1957(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1958(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, c___Fixp16__get_in__return__(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1958(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1959(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, ((rptr_callget_res1939 - wptr + int(delay_ofs / 2 ))& delay_mask ), rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1959(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1960(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, (0.5 * tmp_9 / float(delay_ofs )), rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1960(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1961(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, (sin(c___M_PI * 2.0 * tmp_9 )* 0.5 + 0.5 ), rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1961(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1962(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, ((tmp_9 - gain_5 )/ 15.0 ), i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1962(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1954(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1954(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1953(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1953(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1963(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5 + ((gain_inc_6 )), gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1963(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1964(pitch, size, (wptr ), (input_4 ), wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1964(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1965(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, (delay_mask ):_, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1965(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1993(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16__get_in(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1993(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1966(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1966(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1967(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, c___Fixp16__get_in__return__(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1967(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1968(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, (rptr_callget_res1940 ), out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1968(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1994(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16__get_fr(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1994(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1969(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1969(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1970(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, c___Fixp16__get_fr__return__(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), rptr_callget_res1942, retsel__);

    func__1970(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1971(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8 + ((cube_interp(float(rptr_callget_res1941 )* 0.0000152587 , rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 - 1 )& delay_mask )), rwtable(delay__size, delay__init, delay__pos, delay__val, (i_7 )), rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 + 1 )& delay_mask )), rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 + 2 )& delay_mask )))* (1.0 - gain_5 ))), tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1971(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1972(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7 + ((delay_ofs )), out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1972(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1995(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16__get_fr(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1995(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1973(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1973(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1974(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, c___Fixp16__get_fr__return__(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), retsel__);

    func__1974(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1975(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8 + ((cube_interp(float(rptr_callget_res1942 )* 0.0000152587 , rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 - 1 )& delay_mask )), rwtable(delay__size, delay__init, delay__pos, delay__val, (i_7 & delay_mask )), rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 + 1 )& delay_mask )), rwtable(delay__size, delay__init, delay__pos, delay__val, ((i_7 + 2 )& delay_mask )))* gain_5 )), tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1975(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1976(pitch, size, delay__pos, delay__val, ((wptr + 1 )& delay_mask ), delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1976(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1977(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, ((om )):_, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1977(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1996(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16__inc_all(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1996(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1978(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1978(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      (pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, 0);

    delay__size = (c___DELAY_SIZE );
    delay__init = (0.0):float;
  };
c___PitchShift__process__return__(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      (out_8 ) with{
      delay__size = (c___DELAY_SIZE );
    delay__init = (0.0):float;

};

c___PitchShift_____initrepeat(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
  func__1979(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
    func__1979(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1980(float(pitch), size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1980(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1981(pitch, int(size), delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1981(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      (pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    delay__size = (c___DELAY_SIZE );
    delay__init = (0.0):float;
  };

c___PitchShift_____init(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
  func__1982(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
    func__1982(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1983(float(pitch), size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1983(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1984(pitch, int(size), delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1984(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1985(pitch, size, delay__pos, delay__val, (0 ), delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1985(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1986(pitch, size, delay__pos, delay__val, wptr, ( 255 ), delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1986(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1987(pitch, size, delay__pos, delay__val, wptr, delay_mask, ( 128 ), last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1987(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1988(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, (0.5 ), count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1988(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1989(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, (0 ), last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1989(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      func__1990(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, (0.0 ), rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    func__1990(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      helper1997(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, c___Fixp16_____init(rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) with{
           helper1997(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, (rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__), om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
              func__1991(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);};

    func__1991(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = 
      (pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);

    delay__size = (c___DELAY_SIZE );
    delay__init = (0.0):float;
  };

c___PitchShift(pitch, size, input_4) = (function__2001 ~ (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, !) : process_return_convert1999 with{
    function__2001(notused__26, notused__25, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, notused__10, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, notused__0, notfirst__2000) = (if__(notfirst__2000,
          function_process__2003(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, 0),
          function_init__2002(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, 0)
    )),1;
  function_init__2002(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = process_convert1998(c___PitchShift_____init(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__));
  function_process__2003(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = process_convert1998(c___PitchShift_____initrepeat(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__));
  process_convert1998((pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__)) = c___PitchShift__process(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);
  process_return_convert1999(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__) = c___PitchShift__process__return__(pitch, size, delay__pos, delay__val, wptr, delay_mask, delay_ofs, last_gain, count, last_inc, rptr___all, rptr___delay_mask_1, rptr___all_2, rptr___inc_3, rptr___retsel__, om, input_4, gain_5, gain_inc_6, i_7, out_8, tmp_9, rptr_callget_res1939, rptr_callget_res1940, rptr_callget_res1941, rptr_callget_res1942, retsel__);
};
process = c___PitchShift ( pitchSlider , bufSlider ) * volumeSlider ; 
                                                                                                                                        
