if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

c___Fixp16__set_all(all, in, fr, all_1, inc_2, val_3, retsel__) = 
  func__1925(all, in, fr, all_1, inc_2, val_3, retsel__) with{
    func__1925(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1926(all, in, fr, int(all_1), inc_2, val_3, retsel__);

    func__1926(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1927((all_1 ), in, fr, all_1, inc_2, val_3, retsel__);

    func__1927(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1928(all, (all_1 >> 16 ), fr, all_1, inc_2, val_3, retsel__);

    func__1928(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1929(all, in, (all_1 &  65535 ), all_1, inc_2, val_3, retsel__);

    func__1929(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (all, in, fr, all_1, inc_2, val_3, retsel__);

  };

c___Fixp16__inc_all(all, in, fr, all_1, inc_2, val_3, retsel__) = 
  func__1930(all, in, fr, all_1, inc_2, val_3, retsel__) with{
    func__1930(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1931(all, in, fr, all_1, int(inc_2), val_3, retsel__);

    func__1931(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1932(all, in, fr, ((all + inc_2 )):_, inc_2, val_3, retsel__);

    func__1932(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      helper1940(c___Fixp16__set_all(all, in, fr, all_1, inc_2, val_3, retsel__)) with{
           helper1940((all, in, fr, all_1, inc_2, val_3, retsel__)) = 
              func__1933(all, in, fr, all_1, inc_2, val_3, retsel__);};

    func__1933(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (all, in, fr, all_1, inc_2, val_3, retsel__);

  };

c___Fixp16__process(all, in, fr, all_1, inc_2, val_3, retsel__) = 
  func__1934(all, in, fr, all_1, inc_2, val_3, retsel__) with{
    func__1934(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1935(all, in, fr, all_1, inc_2, ((2 << 18 )+ 1000 ), retsel__);

    func__1935(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      func__1936(all, in, fr, ((val_3 )):_, inc_2, val_3, retsel__);

    func__1936(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      helper1941(c___Fixp16__set_all(all, in, fr, all_1, inc_2, val_3, retsel__)) with{
           helper1941((all, in, fr, all_1, inc_2, val_3, retsel__)) = 
              func__1937(all, in, fr, all_1, inc_2, val_3, retsel__);};

    func__1937(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (all, in, fr, all_1, inc_2, val_3, 0);

  };
c___Fixp16__process__return__(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (val_3 , all , in , fr ) with{
  
};

c___Fixp16_____initrepeat(all, in, fr, all_1, inc_2, val_3, retsel__) = 
  func__1938(all, in, fr, all_1, inc_2, val_3, retsel__) with{
    func__1938(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (all, in, fr, all_1, inc_2, val_3, retsel__);

  };

c___Fixp16_____init(all, in, fr, all_1, inc_2, val_3, retsel__) = 
  func__1939(all, in, fr, all_1, inc_2, val_3, retsel__) with{
    func__1939(all, in, fr, all_1, inc_2, val_3, retsel__) = 
      (all, in, fr, all_1, inc_2, val_3, retsel__);

  };

c___Fixp16 = (function__1945 ~ (_,_,_,_,_,_,_)   )  : process_return_convert1943 with{
    function__1945(all, in, fr, notused__3, inc_2, val_3, notused__0) = c___Fixp16_____initrepeat(all, in, fr, 0, inc_2, val_3, 0) : process_convert1942;
  process_convert1942(all, in, fr, all_1, inc_2, val_3, retsel__) = c___Fixp16__process(all, in, fr, all_1, inc_2, val_3, retsel__);
  process_return_convert1943(all, in, fr, all_1, inc_2, val_3, retsel__) = c___Fixp16__process__return__(all, in, fr, all_1, inc_2, val_3, retsel__);
};
all = ( 2 << 18 ) + 1000 ; 
in = all >> 16 ; 
fr = all & 65535 ; 

process = c___Fixp16 , all , in , fr ; 
                                
