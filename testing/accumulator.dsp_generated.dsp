if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);







c___Accumulator__process(sum_, inc_1, retsel__) = 
  func__1925(sum_, inc_1, retsel__) with{
    func__1925(sum_, inc_1, retsel__) = 
      func__1926(sum_, int(inc_1), retsel__);

    func__1926(sum_, inc_1, retsel__) = 
      func__1927(sum_ + ((inc_1 )), inc_1, retsel__);

    func__1927(sum_, inc_1, retsel__) = 
      (sum_, inc_1, 0);

  };
c___Accumulator__process__return__(sum_, inc_1, retsel__) = 
      (sum_ ) with{
  
};

c___Accumulator_____initrepeat(sum_, inc_1, retsel__) = 
  func__1928(sum_, inc_1, retsel__) with{
    func__1928(sum_, inc_1, retsel__) = 
      (sum_, inc_1, retsel__);

  };

c___Accumulator_____init(sum_, inc_1, retsel__) = 
  func__1929(sum_, inc_1, retsel__) with{
    func__1929(sum_, inc_1, retsel__) = 
      (sum_, inc_1, retsel__);

  };

c___Accumulator(inc_1) = (function__1933 ~ (_,_,_)   )  : process_return_convert1931 with{
    function__1933(sum_, notused__1, notused__0) = c___Accumulator_____initrepeat(sum_, inc_1, 0) : process_convert1930;
  process_convert1930(sum_, inc_1, retsel__) = c___Accumulator__process(sum_, inc_1, retsel__);
  process_return_convert1931(sum_, inc_1, retsel__) = c___Accumulator__process__return__(sum_, inc_1, retsel__);
};
counter = + ( 1 ) ~ _ ; 
process = counter , c___Accumulator ( counter ) ; 
                  
