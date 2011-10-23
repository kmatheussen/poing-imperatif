if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___A_____initrepeat(a, b, retsel__) = 
  func__1925(a, b, retsel__) with{
    func__1925(a, b, retsel__) = 
      (a, b, retsel__);

  };

c___A_____init(a, b, retsel__) = 
  func__1926(a, b, retsel__) with{
    func__1926(a, b, retsel__) = 
      func__1927((1 ), b, retsel__);

    func__1927(a, b, retsel__) = 
      func__1928(a, (1.3 ), retsel__);

    func__1928(a, b, retsel__) = 
      (a, b, retsel__);

  };

c___B__process(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
  func__1933(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) with{
    func__1933(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1934(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1___a, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);

    func__1934(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1935(a1_get_res1929+1, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);

    func__1935(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1936(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2___b, a1_get_res1931, a2_get_res1932, retsel__);

    func__1936(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1937(a1___a, a1___b, a1___retsel__, a2___a, a2_get_res1930+1, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);

    func__1937(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1938(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1___a, a2_get_res1932, retsel__);

    func__1938(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      func__1939(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2___b, retsel__);

    func__1939(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      (a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, 0);

  };
c___B__process__return__(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      (a1_get_res1931 , a2_get_res1932 ) with{
  
};

c___B_____initrepeat(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
  func__1940(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) with{
    func__1940(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      (a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);

  };

c___B_____init(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
  func__1941(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) with{
    func__1941(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      helper1944(c___A_____init(a1___a, a1___b, a1___retsel__), a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) with{
           helper1944((a1___a, a1___b, a1___retsel__), a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
              func__1942(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);};

    func__1942(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      helper1945(a1___a, a1___b, a1___retsel__, c___A_____init(a2___a, a2___b, a2___retsel__), a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) with{
           helper1945(a1___a, a1___b, a1___retsel__, (a2___a, a2___b, a2___retsel__), a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
              func__1943(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);};

    func__1943(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = 
      (a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);

  };

c___B = (function__1949 ~ (_,_,_,_,_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, _, _, _, _, !) : process_return_convert1947 with{
    function__1949(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, notused__0, notfirst__1948) = (if__(notfirst__1948,
          function_process__1951(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, 0),
          function_init__1950(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, 0)
    )),1;
  function_init__1950(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = process_convert1946(c___B_____init(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__));
  function_process__1951(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = process_convert1946(c___B_____initrepeat(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__));
  process_convert1946((a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__)) = c___B__process(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);
  process_return_convert1947(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__) = c___B__process__return__(a1___a, a1___b, a1___retsel__, a2___a, a2___b, a2___retsel__, a1_get_res1929, a2_get_res1930, a1_get_res1931, a2_get_res1932, retsel__);
};
process = c___B ; 
    
