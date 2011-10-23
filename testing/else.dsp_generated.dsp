if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___A__process(r, retsel__) = 
  func__1925(r, retsel__) with{
    func__1925(r, retsel__) = 
      if__((r > 7 ),     func__1926(r, retsel__),     func__1927(r, retsel__));

    func__1926(r, retsel__) = 
      func__1930((5 ), retsel__);

    func__1930(r, retsel__) = 
      func__1929(r, retsel__);

    func__1929(r, retsel__) = 
      func__1928(r, retsel__);

    func__1927(r, retsel__) = 
      func__1932(r+1, retsel__);

    func__1932(r, retsel__) = 
      func__1931(r, retsel__);

    func__1931(r, retsel__) = 
      func__1928(r, retsel__);

    func__1928(r, retsel__) = 
      if__((r > 7 ),     func__1933(r, retsel__),     func__1934(r, retsel__));

    func__1933(r, retsel__) = 
      func__1937((3 ), retsel__);

    func__1937(r, retsel__) = 
      func__1936(r, retsel__);

    func__1936(r, retsel__) = 
      func__1935(r, retsel__);

    func__1934(r, retsel__) = 
      if__((r < 1 ),     func__1938(r, retsel__),     func__1939(r, retsel__));

    func__1938(r, retsel__) = 
      func__1941(r + ((5 )), retsel__);

    func__1941(r, retsel__) = 
      func__1940(r, retsel__);

    func__1940(r, retsel__) = 
      func__1939(r, retsel__);

    func__1939(r, retsel__) = 
      func__1935(r, retsel__);

    func__1935(r, retsel__) = 
      (r, 0);

  };
c___A__process__return__(r, retsel__) = 
      (r ) with{
  
};

c___A_____initrepeat(r, retsel__) = 
  func__1942(r, retsel__) with{
    func__1942(r, retsel__) = 
      (r, retsel__);

  };

c___A_____init(r, retsel__) = 
  func__1943(r, retsel__) with{
    func__1943(r, retsel__) = 
      func__1944((0 ), retsel__);

    func__1944(r, retsel__) = 
      (r, retsel__);

  };

c___A = (function__1948 ~ (_,_,_)   ) : (_, _, !) : process_return_convert1946 with{
    function__1948(r, notused__0, notfirst__1947) = (if__(notfirst__1947,
          function_process__1950(r, 0),
          function_init__1949(r, 0)
    )),1;
  function_init__1949(r, retsel__) = process_convert1945(c___A_____init(r, retsel__));
  function_process__1950(r, retsel__) = process_convert1945(c___A_____initrepeat(r, retsel__));
  process_convert1945((r, retsel__)) = c___A__process(r, retsel__);
  process_return_convert1946(r, retsel__) = c___A__process__return__(r, retsel__);
};
process = c___A ; 
    
