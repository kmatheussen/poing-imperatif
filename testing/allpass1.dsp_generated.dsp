if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);



c___Allpass__process(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
  func__1925(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) with{
    func__1925(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1926(bufsize, feedback, buffer__pos, buffer__val, bufidx, float(input_1), bufout_2, output_3, retsel__);

    func__1926(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1927(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, (rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, (bufidx ))), output_3, retsel__);

    func__1927(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1928(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, (- input_1 + bufout_2 ), retsel__);

    func__1928(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1929(bufsize, feedback, (bufidx ), (input_1 + (bufout_2 * feedback )), bufidx, input_1, bufout_2, output_3, retsel__);

    func__1929(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1930(bufsize, feedback, buffer__pos, buffer__val, bufidx+1, input_1, bufout_2, output_3, retsel__);

    func__1930(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      if__((bufidx >= bufsize ),     func__1931(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__),     func__1932(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__));

    func__1931(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1933(bufsize, feedback, buffer__pos, buffer__val, (0 ), input_1, bufout_2, output_3, retsel__);

    func__1933(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1932(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    func__1932(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      (bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, 0);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };
c___Allpass__process__return__(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      (output_3 ) with{
      buffer__size = (bufsize );
    buffer__init = (0.0):float;

};

c___Allpass_____initrepeat(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
  func__1934(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) with{
    func__1934(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1935(int(bufsize), feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    func__1935(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1936(bufsize, float(feedback), buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    func__1936(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      (bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };

c___Allpass_____init(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
  func__1937(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) with{
    func__1937(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1938(int(bufsize), feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    func__1938(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      func__1939(bufsize, float(feedback), buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    func__1939(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = 
      (bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };

c___Allpass(bufsize, feedback, input_1) = (function__1943 ~ (_,_,_,_,_,_,_,_,_)   )  : process_return_convert1941 with{
    function__1943(notused__8, notused__7, buffer__pos, buffer__val, bufidx, notused__3, notused__2, notused__1, notused__0) = c___Allpass_____initrepeat(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, 0.0, 0.0, 0) : process_convert1940;
  process_convert1940(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = c___Allpass__process(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);
  process_return_convert1941(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__) = c___Allpass__process__return__(bufsize, feedback, buffer__pos, buffer__val, bufidx, input_1, bufout_2, output_3, retsel__);
};
c___UseAllpass__process(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
  func__1946(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) with{
    func__1946(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      (bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, 0);

  };
c___UseAllpass__process__return__(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      (5 ) with{
  
};

c___UseAllpass_____initrepeat(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
  func__1947(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) with{
    func__1947(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1948(int(bufsize), feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1948(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1949(bufsize, float(feedback), allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1949(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1950(bufsize, feedback, ((bufsize , feedback ) : ):_, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1950(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      helper1958(bufsize, feedback, c___Allpass_____initrepeat(allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__), retsel__) with{
           helper1958(bufsize, feedback, (allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__), retsel__) = 
              func__1951(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);};

    func__1951(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      (bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

  };

c___UseAllpass_____init(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
  func__1952(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) with{
    func__1952(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1953(int(bufsize), feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1953(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1954(bufsize, float(feedback), allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1954(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1955(bufsize, feedback, ((bufsize , feedback )):(_,!), allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1955(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      func__1956(bufsize, feedback, allpass___bufsize, ((bufsize , feedback )):(!,_), allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

    func__1956(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      helper1959(bufsize, feedback, c___Allpass_____init(allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__), retsel__) with{
           helper1959(bufsize, feedback, (allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__), retsel__) = 
              func__1957(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);};

    func__1957(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = 
      (bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);

  };

c___UseAllpass(bufsize, feedback) = (function__1963 ~ (_,_,_,_,_,_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, _, _, _, _, _, !) : process_return_convert1961 with{
    function__1963(notused__11, notused__10, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, notused__0, notfirst__1962) = (if__(notfirst__1962,
          function_process__1965(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, 0),
          function_init__1964(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, 0)
    )),1;
  function_init__1964(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = process_convert1960(c___UseAllpass_____init(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__));
  function_process__1965(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = process_convert1960(c___UseAllpass_____initrepeat(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__));
  process_convert1960((bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__)) = c___UseAllpass__process(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);
  process_return_convert1961(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__) = c___UseAllpass__process__return__(bufsize, feedback, allpass___bufsize, allpass___feedback, allpass___buffer__pos, allpass___buffer__val, allpass___bufidx, allpass___input_1, allpass___bufout_2, allpass___output_3, allpass___retsel__, retsel__);
};
c___Allpass3__process(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
  func__1966(bufsize, feedback, bufout, input_4, output_5, retsel__) with{
    func__1966(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1967(bufsize, feedback, bufout, float(input_4), output_5, retsel__);

    func__1967(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1968(bufsize, feedback, bufout, input_4, (- input_4 + bufout ), retsel__);

    func__1968(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1969(bufsize, feedback, (input_4 + (bufout * feedback ): @ (bufsize )), input_4, output_5, retsel__);

    func__1969(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      (bufsize, feedback, bufout, input_4, output_5, 0);

  };
c___Allpass3__process__return__(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      (output_5 ) with{
  
};

c___Allpass3_____initrepeat(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
  func__1970(bufsize, feedback, bufout, input_4, output_5, retsel__) with{
    func__1970(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1971(int(bufsize), feedback, bufout, input_4, output_5, retsel__);

    func__1971(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1972(bufsize, float(feedback), bufout, input_4, output_5, retsel__);

    func__1972(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      (bufsize, feedback, bufout, input_4, output_5, retsel__);

  };

c___Allpass3_____init(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
  func__1973(bufsize, feedback, bufout, input_4, output_5, retsel__) with{
    func__1973(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1974(int(bufsize), feedback, bufout, input_4, output_5, retsel__);

    func__1974(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      func__1975(bufsize, float(feedback), bufout, input_4, output_5, retsel__);

    func__1975(bufsize, feedback, bufout, input_4, output_5, retsel__) = 
      (bufsize, feedback, bufout, input_4, output_5, retsel__);

  };

c___Allpass3(bufsize, feedback, input_4) = (function__1979 ~ (_,_,_,_,_,_)   )  : process_return_convert1977 with{
    function__1979(notused__5, notused__4, bufout, notused__2, notused__1, notused__0) = c___Allpass3_____initrepeat(bufsize, feedback, bufout, input_4, 0.0, 0) : process_convert1976;
  process_convert1976(bufsize, feedback, bufout, input_4, output_5, retsel__) = c___Allpass3__process(bufsize, feedback, bufout, input_4, output_5, retsel__);
  process_return_convert1977(bufsize, feedback, bufout, input_4, output_5, retsel__) = c___Allpass3__process__return__(bufsize, feedback, bufout, input_4, output_5, retsel__);
};
feedback = 0.2 ; 
bufsize = 3 ; 

allpass ( dt , fb ) = ( _ , _ <: ( * ( fb ) , _ : + : @ ( dt ) ) , - ) ~ _ : ( ! , _ ) ; 
counter = + ( 1 ) ~ _ ; 
input = counter ; 

c___Delay__process(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
  func__1982(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) with{
    func__1982(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1983(bufsize, buffer__pos, buffer__val, bufidx, float(input_6), output_7, retsel__);

    func__1983(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1984(bufsize, buffer__pos, buffer__val, bufidx, input_6, (rwtable(buffer__size, buffer__init, buffer__pos, buffer__val, (bufidx ))), retsel__);

    func__1984(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1985(bufsize, (bufidx ), (input_6 ), bufidx, input_6, output_7, retsel__);

    func__1985(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1986(bufsize, buffer__pos, buffer__val, bufidx+1, input_6, output_7, retsel__);

    func__1986(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      if__((bufidx >= bufsize ),     func__1987(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__),     func__1988(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__));

    func__1987(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1989(bufsize, buffer__pos, buffer__val, (0 ), input_6, output_7, retsel__);

    func__1989(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1988(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);

    func__1988(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      (bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, 0);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };
c___Delay__process__return__(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      (output_7 ) with{
      buffer__size = (bufsize );
    buffer__init = (0.0):float;

};

c___Delay_____initrepeat(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
  func__1990(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) with{
    func__1990(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1991(int(bufsize), buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);

    func__1991(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      (bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };

c___Delay_____init(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
  func__1992(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) with{
    func__1992(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      func__1993(int(bufsize), buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);

    func__1993(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = 
      (bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);

    buffer__size = (bufsize );
    buffer__init = (0.0):float;
  };

c___Delay(bufsize, input_6) = (function__1997 ~ (_,_,_,_,_,_,_)   )  : process_return_convert1995 with{
    function__1997(notused__6, buffer__pos, buffer__val, bufidx, notused__2, notused__1, notused__0) = c___Delay_____initrepeat(bufsize, buffer__pos, buffer__val, bufidx, input_6, 0.0, 0) : process_convert1994;
  process_convert1994(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = c___Delay__process(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);
  process_return_convert1995(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__) = c___Delay__process__return__(bufsize, buffer__pos, buffer__val, bufidx, input_6, output_7, retsel__);
};
process = counter , 
c___Allpass ( bufsize + 1 , feedback , input ) , 
c___Allpass3 ( bufsize , feedback , input ) , 
allpass ( bufsize , feedback , input ) , 
( counter : @ ( 1 ) ) , 
( counter : @ ( 2 ) ) , 
( counter : @ ( 3 ) ) , 
c___Delay ( 1 , counter ) , 
c___Delay ( 2 , counter ) , 
c___Delay ( 3 , counter ) ; 
                                                                                                                                             
