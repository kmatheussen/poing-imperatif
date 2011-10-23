if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___A__process(func, result, retsel__) = 
  func__1925(func, result, retsel__) with{
    func__1925(func, result, retsel__) = 
      func__1926(func, result + ((func(0.5 ))), retsel__);

    func__1926(func, result, retsel__) = 
      (result, 0);

  };
c___A__process__return__(func, result, retsel__) = 
      (result ) with{
  
};

c___A_____initrepeat(func, result, retsel__) = 
  func__1927(func, result, retsel__) with{
    func__1927(func, result, retsel__) = 
      (result, retsel__);

  };

c___A_____init(func, result, retsel__) = 
  func__1928(func, result, retsel__) with{
    func__1928(func, result, retsel__) = 
      (result, retsel__);

  };

c___A(func) = (function__1932 ~ (_,_)   )  : process_return_convert1930 with{
    function__1932(result, notused__0) = c___A_____initrepeat(func, result, 0) : process_convert1929;
  process_convert1929(result, retsel__) = c___A__process(func, result, retsel__);
  process_return_convert1930(result, retsel__) = c___A__process__return__(func, result, retsel__);
};
c___B__process(func, result, retsel__) = 
  func__1935(func, result, retsel__) with{
    func__1935(func, result, retsel__) = 
      func__1936(func, result + ((func(0.5 ))), retsel__);

    func__1936(func, result, retsel__) = 
      (result, 0);

  };
c___B__process__return__(func, result, retsel__) = 
      (result ) with{
  
};

c___B_____initrepeat(func, result, retsel__) = 
  func__1937(func, result, retsel__) with{
    func__1937(func, result, retsel__) = 
      (result, retsel__);

  };

c___B_____init(func, result, retsel__) = 
  func__1938(func, result, retsel__) with{
    func__1938(func, result, retsel__) = 
      (result, retsel__);

  };

c___B(func) = (function__1942 ~ (_,_)   )  : process_return_convert1940 with{
    function__1942(result, notused__0) = c___B_____initrepeat(func, result, 0) : process_convert1939;
  process_convert1939(result, retsel__) = c___B__process(func, result, retsel__);
  process_return_convert1940(result, retsel__) = c___B__process__return__(func, result, retsel__);
};
mul2 ( add ) = add * 2 ; 

process = c___A ( mul2 ) , c___A ( * ( 2 ) ) , c___B ( _ ) ; 
                             
