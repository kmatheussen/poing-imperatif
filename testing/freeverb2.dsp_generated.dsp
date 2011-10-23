

fixedgain = 0.015 ; 
scalewet = 3.0 ; 
scaledry = 2.0 ; 
scaledamp = 0.4 ; 
scaleroom = 0.28 ; 
offsetroom = 0.7 ; 
initialroom = 0.5 ; 
initialdamp = 0.5 ; 
initialwet = 1.0 / scalewet ; 
initialdry = 0 ; 
initialwidth = 1.0 ; 
initialmode = 0.0 ; 
freezemode = 0.5 ; 
stereospread = 23 ; 
allpassfeed = 0.5 ; 





combtuningL1 = 1116 ; 
combtuningL2 = 1188 ; 
combtuningL3 = 1277 ; 
combtuningL4 = 1356 ; 
combtuningL5 = 1422 ; 
combtuningL6 = 1491 ; 
combtuningL7 = 1557 ; 
combtuningL8 = 1617 ; 

allpasstuningL1 = 556 ; 
allpasstuningL2 = 441 ; 
allpasstuningL3 = 341 ; 
allpasstuningL4 = 225 ; 









dampSlider = hslider ( "Damp" , 0.99 , 0 , 1 , 0.025 ) * scaledamp ; 
roomsizeSlider = hslider ( "RoomSize" , 0.99 , 0 , 1 , 0.025 ) * scaleroom + offsetroom ; 
wetSlider = hslider ( "Wet" , 0.99 , 0 , 1 , 0.025 ) ; 
drySlider = hslider ( "Dry" , 0 , 0 , 1 , 0.025 ) ; 
combfeed = roomsizeSlider ; 




c___Allpass__process(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
  func__1925(bufsize, feedback, bufout, input_1, output_2, retsel__) with{
    func__1925(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      func__1926(bufsize, feedback, bufout, float(input_1), output_2, retsel__);

    func__1926(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      func__1927(bufsize, feedback, bufout, input_1, (- input_1 + bufout ), retsel__);

    func__1927(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      func__1928(bufsize, feedback, (input_1 + (bufout * feedback ): @ (bufsize )), input_1, output_2, retsel__);

    func__1928(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      (bufsize, feedback, bufout, input_1, output_2, 0);

  };

c___Allpass__process__return__(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      (output_2 ) with{
  
};

c___Allpass_____initrepeat(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
  func__1929(bufsize, feedback, bufout, input_1, output_2, retsel__) with{
    func__1929(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      func__1930(int(bufsize), feedback, bufout, input_1, output_2, retsel__);

    func__1930(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      func__1931(bufsize, float(feedback), bufout, input_1, output_2, retsel__);

    func__1931(bufsize, feedback, bufout, input_1, output_2, retsel__) = 
      (bufsize, feedback, bufout, input_1, output_2, retsel__);

  };


c___Allpass(bufsize, feedback, input_1) = (function__1938 ~ (_,_,_,_,_,_)   )  : process_return_convert1936 with{
    function__1938(notused__5, notused__4, bufout, notused__2, notused__1, notused__0) = c___Allpass_____initrepeat(bufsize, feedback, bufout, input_1, 0.0, 0) : process_convert1935;
  process_convert1935(bufsize, feedback, bufout, input_1, output_2, retsel__) = c___Allpass__process(bufsize, feedback, bufout, input_1, output_2, retsel__);
  process_return_convert1936(bufsize, feedback, bufout, input_1, output_2, retsel__) = c___Allpass__process__return__(bufsize, feedback, bufout, input_1, output_2, retsel__);
};

c___Comb__process(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
  func__1941(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) with{
    func__1941(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1942(bufsize, feedback, damp, filterstore, bufout, float(input_3), retsel__);

    func__1942(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1943(bufsize, feedback, damp, ((bufout * (1.0 - damp ))+ (filterstore * damp )), bufout, input_3, retsel__);

    func__1943(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1944(bufsize, feedback, damp, filterstore, (input_3 + (filterstore * feedback ): @ (bufsize )), input_3, retsel__);

    func__1944(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      (bufsize, feedback, damp, filterstore, bufout, input_3, 0);

  };
c___Comb__process__return__(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      (bufout ) with{
  
};

c___Comb_____initrepeat(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
  func__1945(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) with{
    func__1945(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1946(int(bufsize), feedback, damp, filterstore, bufout, input_3, retsel__);

    func__1946(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1947(bufsize, float(feedback), damp, filterstore, bufout, input_3, retsel__);

    func__1947(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      func__1948(bufsize, feedback, float(damp), filterstore, bufout, input_3, retsel__);

    func__1948(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = 
      (bufsize, feedback, damp, filterstore, bufout, input_3, retsel__);

  };


c___Comb(bufsize, feedback, damp, input_3) = (function__1956 ~ (_,_,_,_,_,_,_)   )  : process_return_convert1954 with{
    function__1956(notused__6, notused__5, notused__4, filterstore, bufout, notused__1, notused__0) = c___Comb_____initrepeat(bufsize, feedback, damp, filterstore, bufout, input_3, 0) : process_convert1953;
  process_convert1953(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = c___Comb__process(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__);
  process_return_convert1954(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__) = c___Comb__process__return__(bufsize, feedback, damp, filterstore, bufout, input_3, retsel__);
};


c___MonoReverb(fb1, fb2, damp, spread, input_4) = (allpass1_callget_res1959 ) with{
  allpass1 = c___Allpass(allpasstuningL1 + spread , fb2 );
  allpass2 = c___Allpass(allpasstuningL2 + spread , fb2 );
  allpass3 = c___Allpass(allpasstuningL3 + spread , fb2 );
  allpass4 = c___Allpass(allpasstuningL4 + spread , fb2 );
  comb1 = c___Comb(combtuningL1 + spread , fb1 , damp );
  comb2 = c___Comb(combtuningL2 + spread , fb1 , damp );
  comb3 = c___Comb(combtuningL3 + spread , fb1 , damp );
  comb4 = c___Comb(combtuningL4 + spread , fb1 , damp );
  comb5 = c___Comb(combtuningL5 + spread , fb1 , damp );
  comb6 = c___Comb(combtuningL6 + spread , fb1 , damp );
  comb7 = c___Comb(combtuningL7 + spread , fb1 , damp );
  comb8 = c___Comb(combtuningL8 + spread , fb1 , damp );
  comb1_callget_res1963 = comb1(input_4 );
  comb2_callget_res1964 = comb2(input_4 );
  comb3_callget_res1965 = comb3(input_4 );
  comb4_callget_res1966 = comb4(input_4 );
  comb5_callget_res1967 = comb5(input_4 );
  comb6_callget_res1968 = comb6(input_4 );
  comb7_callget_res1969 = comb7(input_4 );
  comb8_callget_res1970 = comb8(input_4 );
  allpass4_callget_res1962 = allpass4(comb1_callget_res1963 + comb2_callget_res1964 + comb3_callget_res1965 + comb4_callget_res1966 + comb5_callget_res1967 + comb6_callget_res1968 + comb7_callget_res1969 + comb8_callget_res1970 );
  allpass3_callget_res1961 = allpass3(allpass4_callget_res1962 );
  allpass2_callget_res1960 = allpass2(allpass3_callget_res1961 );
  allpass1_callget_res1959 = allpass1(allpass2_callget_res1960 );
};

c___StereoReverb(fb1, fb2, damp, spread, left_5, right_6) = (rev0_callget_res2086 , rev1_callget_res2087 ) with{
  rev0 = c___MonoReverb(fb1 , fb2 , damp , 0 );
  rev1 = c___MonoReverb(fb1 , fb2 , damp , spread );
  rev0_callget_res2086 = rev0(left_5 + right_6 );
  rev1_callget_res2087 = rev1(left_5 + right_6 );
};

c___FxCtrl(gain, wet, c___Fx, left_7, right_8) = (left_7 * (1 - wet )+ fx_left_9 * wet , right_8 * (1 - wet )+ fx_right_10 * wet ) with{
  fx_left_9 = multiset___2131 : (_,!);
  fx_right_10 = multiset___2131 : (!,_);
  multiset___2131 = (c___Fx(left_7 * gain , right_8 * gain ));
};

process = c___FxCtrl ( fixedgain , 
wetSlider , 
c___StereoReverb ( combfeed , 
allpassfeed , 
dampSlider , 
stereospread 
) ) ; 
                                                                                                                                                                                                        
