if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___A_____initrepeat(retsel__) = 
  func__1925(retsel__) with{
    func__1925(retsel__) = 
      (retsel__);

  };

c___A_____init(retsel__) = 
  func__1926(retsel__) with{
    func__1926(retsel__) = 
      (retsel__);

  };

c___B_____initrepeat(a___retsel__, retsel__) = 
  func__1927(a___retsel__, retsel__) with{
    func__1927(a___retsel__, retsel__) = 
      (a___retsel__, retsel__);

  };

c___B_____init(a___retsel__, retsel__) = 
  func__1928(a___retsel__, retsel__) with{
    func__1928(a___retsel__, retsel__) = 
      helper1930(c___A_____init(a___retsel__), retsel__) with{
           helper1930((a___retsel__), retsel__) = 
              func__1929(a___retsel__, retsel__);};

    func__1929(a___retsel__, retsel__) = 
      (a___retsel__, retsel__);

  };

c___C__get50(b___a___retsel__, b___retsel__, retsel__) = 
  func__1931(b___a___retsel__, b___retsel__, retsel__) with{
    func__1931(b___a___retsel__, b___retsel__, retsel__) = 
      (b___a___retsel__, b___retsel__, 0);

  };
c___C__get50__return__(b___a___retsel__, b___retsel__, retsel__) = 
      (50 ) with{
  
};

c___C_____initrepeat(b___a___retsel__, b___retsel__, retsel__) = 
  func__1932(b___a___retsel__, b___retsel__, retsel__) with{
    func__1932(b___a___retsel__, b___retsel__, retsel__) = 
      (b___a___retsel__, b___retsel__, retsel__);

  };

c___C_____init(b___a___retsel__, b___retsel__, retsel__) = 
  func__1933(b___a___retsel__, b___retsel__, retsel__) with{
    func__1933(b___a___retsel__, b___retsel__, retsel__) = 
      helper1935(c___B_____init(b___a___retsel__, b___retsel__), retsel__) with{
           helper1935((b___a___retsel__, b___retsel__), retsel__) = 
              func__1934(b___a___retsel__, b___retsel__, retsel__);};

    func__1934(b___a___retsel__, b___retsel__, retsel__) = 
      (b___a___retsel__, b___retsel__, retsel__);

  };

c___D__process(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
  func__1937(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) with{
    func__1937(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      helper1943(c___C__get50(c___b___a___retsel__, c___b___retsel__, c___retsel__), c_callget_res1936, retsel__) with{
           helper1943((c___b___a___retsel__, c___b___retsel__, c___retsel__), c_callget_res1936, retsel__) = 
              func__1938(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);};

    func__1938(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      func__1939(c___b___a___retsel__, c___b___retsel__, c___retsel__, c___C__get50__return__(c___b___a___retsel__, c___b___retsel__, c___retsel__), retsel__);

    func__1939(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      (c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, 0);

  };
c___D__process__return__(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      (c_callget_res1936 ) with{
  
};

c___D_____initrepeat(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
  func__1940(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) with{
    func__1940(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      (c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);

  };

c___D_____init(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
  func__1941(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) with{
    func__1941(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      helper1944(c___C_____init(c___b___a___retsel__, c___b___retsel__, c___retsel__), c_callget_res1936, retsel__) with{
           helper1944((c___b___a___retsel__, c___b___retsel__, c___retsel__), c_callget_res1936, retsel__) = 
              func__1942(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);};

    func__1942(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = 
      (c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);

  };

c___D = (function__1948 ~ (_,_,_,_,_,_)   ) : (_, _, _, _, _, !) : process_return_convert1946 with{
    function__1948(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, notused__0, notfirst__1947) = (if__(notfirst__1947,
          function_process__1950(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, 0),
          function_init__1949(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, 0)
    )),1;
  function_init__1949(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = process_convert1945(c___D_____init(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__));
  function_process__1950(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = process_convert1945(c___D_____initrepeat(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__));
  process_convert1945((c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__)) = c___D__process(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);
  process_return_convert1946(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__) = c___D__process__return__(c___b___a___retsel__, c___b___retsel__, c___retsel__, c_callget_res1936, retsel__);
};
process = 50 , c___D ; 
      
