if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

c___A__process(selector_1, retsel__) = 
  func__1925(selector_1, retsel__) with{
    func__1925(selector_1, retsel__) = 
      func__1926(int(selector_1), retsel__);

    func__1926(selector_1, retsel__) = 
      if__((selector_1 ),     func__1927(selector_1, retsel__),     func__1928(selector_1, retsel__));

    func__1927(selector_1, retsel__) = 
      (selector_1, 0);

    func__1928(selector_1, retsel__) = 
      (selector_1, 1);

  };
c___A__process__return__(selector_1, retsel__) = 
      if__( (retsel__ ==0), (2 ), (3 )) with{
  
};

c___A_____initrepeat(selector_1, retsel__) = 
  func__1930(selector_1, retsel__) with{
    func__1930(selector_1, retsel__) = 
      (selector_1, retsel__);

  };

c___A_____init(selector_1, retsel__) = 
  func__1931(selector_1, retsel__) with{
    func__1931(selector_1, retsel__) = 
      (selector_1, retsel__);

  };

c___A(selector_1) = (function__1935 ~ (_,_)   )  : process_return_convert1933 with{
    function__1935(notused__1, notused__0) = c___A_____initrepeat(selector_1, 0) : process_convert1932;
  process_convert1932(selector_1, retsel__) = c___A__process(selector_1, retsel__);
  process_return_convert1933(selector_1, retsel__) = c___A__process__return__(selector_1, retsel__);
};
counter = + ( 1 ) ~ _ ; 
process = counter , c___A ( counter % 2 ) ; 
                    
