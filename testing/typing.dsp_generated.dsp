if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___Untyped__process(a, b, c, d_1, e_2, retsel__) = 
  func__1925(a, b, c, d_1, e_2, retsel__) with{
    func__1925(a, b, c, d_1, e_2, retsel__) = 
      func__1926(a, b, c, d_1, (6 ), retsel__);

    func__1926(a, b, c, d_1, e_2, retsel__) = 
      func__1927(a, (2 ), c, d_1, e_2, retsel__);

    func__1927(a, b, c, d_1, e_2, retsel__) = 
      (a, b, c, d_1, e_2, 0);

  };
c___Untyped__process__return__(a, b, c, d_1, e_2, retsel__) = 
      (a + b + c + d_1 + e_2 ) with{
  
};

c___Untyped_____initrepeat(a, b, c, d_1, e_2, retsel__) = 
  func__1928(a, b, c, d_1, e_2, retsel__) with{
    func__1928(a, b, c, d_1, e_2, retsel__) = 
      (a, b, c, d_1, e_2, retsel__);

  };

c___Untyped_____init(a, b, c, d_1, e_2, retsel__) = 
  func__1929(a, b, c, d_1, e_2, retsel__) with{
    func__1929(a, b, c, d_1, e_2, retsel__) = 
      func__1930(a, b, (5 ), d_1, e_2, retsel__);

    func__1930(a, b, c, d_1, e_2, retsel__) = 
      (a, b, c, d_1, e_2, retsel__);

  };

c___Untyped(a, d_1) = (function__1934 ~ (_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, !) : process_return_convert1932 with{
    function__1934(notused__5, b, c, notused__2, notused__1, notused__0, notfirst__1933) = (if__(notfirst__1933,
          function_process__1936(a, b, c, d_1, 0, 0),
          function_init__1935(a, b, c, d_1, 0, 0)
    )),1;
  function_init__1935(a, b, c, d_1, e_2, retsel__) = process_convert1931(c___Untyped_____init(a, b, c, d_1, e_2, retsel__));
  function_process__1936(a, b, c, d_1, e_2, retsel__) = process_convert1931(c___Untyped_____initrepeat(a, b, c, d_1, e_2, retsel__));
  process_convert1931((a, b, c, d_1, e_2, retsel__)) = c___Untyped__process(a, b, c, d_1, e_2, retsel__);
  process_return_convert1932(a, b, c, d_1, e_2, retsel__) = c___Untyped__process__return__(a, b, c, d_1, e_2, retsel__);
};
c___Typed__process(a, b, c, d_3, e_4, retsel__) = 
  func__1937(a, b, c, d_3, e_4, retsel__) with{
    func__1937(a, b, c, d_3, e_4, retsel__) = 
      func__1938(a, b, c, int(d_3), e_4, retsel__);

    func__1938(a, b, c, d_3, e_4, retsel__) = 
      func__1939(a, b, c, d_3, (6 ), retsel__);

    func__1939(a, b, c, d_3, e_4, retsel__) = 
      func__1940(a, (2 ), c, d_3, e_4, retsel__);

    func__1940(a, b, c, d_3, e_4, retsel__) = 
      (a, b, c, d_3, e_4, 0);

  };
c___Typed__process__return__(a, b, c, d_3, e_4, retsel__) = 
      (a + b + c + d_3 + e_4 ) with{
  
};

c___Typed_____initrepeat(a, b, c, d_3, e_4, retsel__) = 
  func__1941(a, b, c, d_3, e_4, retsel__) with{
    func__1941(a, b, c, d_3, e_4, retsel__) = 
      func__1942(int(a), b, c, d_3, e_4, retsel__);

    func__1942(a, b, c, d_3, e_4, retsel__) = 
      (a, b, c, d_3, e_4, retsel__);

  };

c___Typed_____init(a, b, c, d_3, e_4, retsel__) = 
  func__1943(a, b, c, d_3, e_4, retsel__) with{
    func__1943(a, b, c, d_3, e_4, retsel__) = 
      func__1944(int(a), b, c, d_3, e_4, retsel__);

    func__1944(a, b, c, d_3, e_4, retsel__) = 
      func__1945(a, b, (5 ), d_3, e_4, retsel__);

    func__1945(a, b, c, d_3, e_4, retsel__) = 
      (a, b, c, d_3, e_4, retsel__);

  };

c___Typed(a, d_3) = (function__1949 ~ (_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, !) : process_return_convert1947 with{
    function__1949(notused__5, b, c, notused__2, notused__1, notused__0, notfirst__1948) = (if__(notfirst__1948,
          function_process__1951(a, b, c, d_3, 0, 0),
          function_init__1950(a, b, c, d_3, 0, 0)
    )),1;
  function_init__1950(a, b, c, d_3, e_4, retsel__) = process_convert1946(c___Typed_____init(a, b, c, d_3, e_4, retsel__));
  function_process__1951(a, b, c, d_3, e_4, retsel__) = process_convert1946(c___Typed_____initrepeat(a, b, c, d_3, e_4, retsel__));
  process_convert1946((a, b, c, d_3, e_4, retsel__)) = c___Typed__process(a, b, c, d_3, e_4, retsel__);
  process_return_convert1947(a, b, c, d_3, e_4, retsel__) = c___Typed__process__return__(a, b, c, d_3, e_4, retsel__);
};
counter = + ( 1 ) ~ _ ; 
process = counter , c___Untyped ( 10 , counter ) , c___Typed ( 10 , counter ) ; 
                           
