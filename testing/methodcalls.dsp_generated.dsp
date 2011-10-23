if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___A__a_get(var_a, retsel__) = 
  func__1925(var_a, retsel__) with{
    func__1925(var_a, retsel__) = 
      (var_a, 0);

  };
c___A__a_get__return__(var_a, retsel__) = 
      (3 ) with{
  
};

c___A_____initrepeat(var_a, retsel__) = 
  func__1926(var_a, retsel__) with{
    func__1926(var_a, retsel__) = 
      (var_a, retsel__);

  };

c___A_____init(var_a, retsel__) = 
  func__1927(var_a, retsel__) with{
    func__1927(var_a, retsel__) = 
      (var_a, retsel__);

  };

c___B__get(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
  func__1930(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
    func__1930(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, 0);

  };
c___B__get__return__(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (arg_1 + 4 ) with{
  
};

c___B__process(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
  func__1931(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
    func__1931(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      helper1940(c___A__a_get(a___var_a, a___retsel__), var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
           helper1940((a___var_a, a___retsel__), var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
              func__1932(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);};

    func__1932(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      func__1933(a___var_a, a___retsel__, var_b, arg_1, c___A__a_get__return__(a___var_a, a___retsel__), this_callget_res1929, retsel__);

    func__1933(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      func__1934(a___var_a, a___retsel__, var_b, (5 ):_, a_callget_res1928, this_callget_res1929, retsel__);

    func__1934(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      helper1941(c___B__get(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__)) with{
           helper1941((a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__)) = 
              func__1935(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);};

    func__1935(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      func__1936(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, c___B__get__return__(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__), retsel__);

    func__1936(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, 0);

  };
c___B__process__return__(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (a_callget_res1928 + this_callget_res1929 ) with{
  
};

c___B_____initrepeat(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
  func__1937(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
    func__1937(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);

  };

c___B_____init(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
  func__1938(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
    func__1938(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      helper1942(c___A_____init(a___var_a, a___retsel__), var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) with{
           helper1942((a___var_a, a___retsel__), var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
              func__1939(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);};

    func__1939(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = 
      (a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);

  };

c___B = (function__1946 ~ (_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, !) : process_return_convert1944 with{
    function__1946(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, notused__0, notfirst__1945) = (if__(notfirst__1945,
          function_process__1948(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, 0),
          function_init__1947(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, 0)
    )),1;
  function_init__1947(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = process_convert1943(c___B_____init(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__));
  function_process__1948(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = process_convert1943(c___B_____initrepeat(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__));
  process_convert1943((a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__)) = c___B__process(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);
  process_return_convert1944(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__) = c___B__process__return__(a___var_a, a___retsel__, var_b, arg_1, a_callget_res1928, this_callget_res1929, retsel__);
};
process = c___B ; 
    
