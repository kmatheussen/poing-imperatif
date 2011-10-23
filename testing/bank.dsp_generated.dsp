if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);

c___Bank__add(a, how_much_1, retsel__) = 
  func__1925(a, how_much_1, retsel__) with{
    func__1925(a, how_much_1, retsel__) = 
      func__1926(a, int(how_much_1), retsel__);

    func__1926(a, how_much_1, retsel__) = 
      func__1927(a + ((how_much_1 )), how_much_1, retsel__);

    func__1927(a, how_much_1, retsel__) = 
      (a, how_much_1, retsel__);

  };

c___Bank_____initrepeat(a, how_much_1, retsel__) = 
  func__1928(a, how_much_1, retsel__) with{
    func__1928(a, how_much_1, retsel__) = 
      (a, how_much_1, retsel__);

  };

c___Bank_____init(a, how_much_1, retsel__) = 
  func__1929(a, how_much_1, retsel__) with{
    func__1929(a, how_much_1, retsel__) = 
      (a, how_much_1, retsel__);

  };

c___UseBank__process(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
  func__1931(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) with{
    func__1931(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      func__1932(bank___a, ((input_2 )):_, bank___retsel__, input_2, bank_get_res1930, retsel__);

    func__1932(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      helper1938(c___Bank__add(bank___a, bank___how_much_1, bank___retsel__), input_2, bank_get_res1930, retsel__) with{
           helper1938((bank___a, bank___how_much_1, bank___retsel__), input_2, bank_get_res1930, retsel__) = 
              func__1933(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);};

    func__1933(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      func__1934(bank___a, bank___how_much_1, bank___retsel__, input_2, bank___a, retsel__);

    func__1934(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      (bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, 0);

  };
c___UseBank__process__return__(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      (bank_get_res1930 ) with{
  
};

c___UseBank_____initrepeat(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
  func__1935(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) with{
    func__1935(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      (bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);

  };

c___UseBank_____init(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
  func__1936(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) with{
    func__1936(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      helper1939(c___Bank_____init(bank___a, bank___how_much_1, bank___retsel__), input_2, bank_get_res1930, retsel__) with{
           helper1939((bank___a, bank___how_much_1, bank___retsel__), input_2, bank_get_res1930, retsel__) = 
              func__1937(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);};

    func__1937(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = 
      (bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);

  };

c___UseBank(input_2) = (function__1943 ~ (_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, !) : process_return_convert1941 with{
    function__1943(bank___a, bank___how_much_1, bank___retsel__, notused__2, bank_get_res1930, notused__0, notfirst__1942) = (if__(notfirst__1942,
          function_process__1945(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, 0),
          function_init__1944(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, 0)
    )),1;
  function_init__1944(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = process_convert1940(c___UseBank_____init(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__));
  function_process__1945(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = process_convert1940(c___UseBank_____initrepeat(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__));
  process_convert1940((bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__)) = c___UseBank__process(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);
  process_return_convert1941(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__) = c___UseBank__process__return__(bank___a, bank___how_much_1, bank___retsel__, input_2, bank_get_res1930, retsel__);
};
counter = + ( 1 ) ~ _ ; 
process = counter , c___UseBank ( counter ) ; 
                  
