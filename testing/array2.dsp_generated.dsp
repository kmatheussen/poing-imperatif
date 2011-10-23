if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

size = 4 ; 

c___Array__process(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
  func__1925(buf__pos, buf__val, i_1, a_2, b_3, retsel__) with{
    func__1925(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      func__1926(buf__pos, buf__val, int(i_1), a_2, b_3, retsel__);

    func__1926(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      func__1927(buf__pos, buf__val, i_1, (rwtable(buf__size, buf__init, buf__pos, buf__val, (i_1 % size ))), b_3, retsel__);

    func__1927(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      func__1928(buf__pos, buf__val, i_1, a_2, (rwtable(buf__size, buf__init, buf__pos, buf__val, ((i_1 + 1 )% size ))), retsel__);

    func__1928(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      func__1929((i_1 % size ), (a_2 + 1.0 ), i_1, a_2, b_3, retsel__);

    func__1929(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      (buf__pos, buf__val, i_1, a_2, b_3, 0);

    buf__size = (size );
    buf__init = ((1.0 )):float;
  };
c___Array__process__return__(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      (a_2 + b_3 , i_1 % size ) with{
      buf__size = (size );
    buf__init = ((1.0 )):float;

};

c___Array_____initrepeat(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
  func__1930(buf__pos, buf__val, i_1, a_2, b_3, retsel__) with{
    func__1930(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      (buf__pos, buf__val, i_1, a_2, b_3, retsel__);

    buf__size = (size );
    buf__init = ((1.0 )):float;
  };

c___Array_____init(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
  func__1931(buf__pos, buf__val, i_1, a_2, b_3, retsel__) with{
    func__1931(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      func__1932(buf__pos, (1.0 ), i_1, a_2, b_3, retsel__);

    func__1932(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = 
      (buf__pos, buf__val, i_1, a_2, b_3, retsel__);

    buf__size = (size );
    buf__init = ((1.0 )):float;
  };

c___Array(i_1) = (function__1936 ~ (_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, !) : process_return_convert1934 with{
    function__1936(buf__pos, buf__val, notused__3, notused__2, notused__1, notused__0, notfirst__1935) = (if__(notfirst__1935,
          function_process__1938(buf__pos, buf__val, i_1, 0.0, 0.0, 0),
          function_init__1937(buf__pos, buf__val, i_1, 0.0, 0.0, 0)
    )),1;
  function_init__1937(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = process_convert1933(c___Array_____init(buf__pos, buf__val, i_1, a_2, b_3, retsel__));
  function_process__1938(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = process_convert1933(c___Array_____initrepeat(buf__pos, buf__val, i_1, a_2, b_3, retsel__));
  process_convert1933((buf__pos, buf__val, i_1, a_2, b_3, retsel__)) = c___Array__process(buf__pos, buf__val, i_1, a_2, b_3, retsel__);
  process_return_convert1934(buf__pos, buf__val, i_1, a_2, b_3, retsel__) = c___Array__process__return__(buf__pos, buf__val, i_1, a_2, b_3, retsel__);
};
counter = + ( 1 ) ~ _ ; 
process = counter , c___Array ( counter ) ; 
                      
