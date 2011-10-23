if__(a,(k1,k2),(k3,k4)) = if__(a,k1,k3),if__(a,k2,k4);
if__(a,k,k)             = k;
if__(a,k1,k2)           = select2(a,k2,k1);


c___Account__debit(euros, amount_1, amount_2, retsel__) = 
  func__1925(euros, amount_1, amount_2, retsel__) with{
    func__1925(euros, amount_1, amount_2, retsel__) = 
      func__1926(euros, int(amount_1), amount_2, retsel__);

    func__1926(euros, amount_1, amount_2, retsel__) = 
      func__1927(euros - ((amount_1 )), amount_1, amount_2, retsel__);

    func__1927(euros, amount_1, amount_2, retsel__) = 
      (euros, amount_1, amount_2, retsel__);

  };

c___Account__deposit(euros, amount_1, amount_2, retsel__) = 
  func__1928(euros, amount_1, amount_2, retsel__) with{
    func__1928(euros, amount_1, amount_2, retsel__) = 
      func__1929(euros, amount_1, int(amount_2), retsel__);

    func__1929(euros, amount_1, amount_2, retsel__) = 
      func__1930(euros + ((amount_2 )), amount_1, amount_2, retsel__);

    func__1930(euros, amount_1, amount_2, retsel__) = 
      (euros, amount_1, amount_2, retsel__);

  };

c___Account__get(euros, amount_1, amount_2, retsel__) = 
  func__1931(euros, amount_1, amount_2, retsel__) with{
    func__1931(euros, amount_1, amount_2, retsel__) = 
      (euros, amount_1, amount_2, 0);

  };
c___Account__get__return__(euros, amount_1, amount_2, retsel__) = 
      (euros ) with{
  
};

c___Account_____initrepeat(euros, amount_1, amount_2, retsel__) = 
  func__1932(euros, amount_1, amount_2, retsel__) with{
    func__1932(euros, amount_1, amount_2, retsel__) = 
      func__1933(int(euros), amount_1, amount_2, retsel__);

    func__1933(euros, amount_1, amount_2, retsel__) = 
      (euros, amount_1, amount_2, retsel__);

  };

c___Account_____init(euros, amount_1, amount_2, retsel__) = 
  func__1934(euros, amount_1, amount_2, retsel__) with{
    func__1934(euros, amount_1, amount_2, retsel__) = 
      func__1935(int(euros), amount_1, amount_2, retsel__);

    func__1935(euros, amount_1, amount_2, retsel__) = 
      func__1936(euros + ((50 )), amount_1, amount_2, retsel__);

    func__1936(euros, amount_1, amount_2, retsel__) = 
      (euros, amount_1, amount_2, retsel__);

  };

c___UseAccount__process(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
  func__1938(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) with{
    func__1938(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1939(euros, account___euros, ((input_3 - 5 )):_, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

    func__1939(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      helper1950(euros, c___Account__debit(account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) with{
           helper1950(euros, (account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) = 
              func__1940(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);};

    func__1940(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1941(euros, account___euros, account___amount_1, ((input_3 * 2 )):_, account___retsel__, input_3, account_get_res1937, retsel__);

    func__1941(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      helper1951(euros, c___Account__deposit(account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) with{
           helper1951(euros, (account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) = 
              func__1942(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);};

    func__1942(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1943(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account___euros, retsel__);

    func__1943(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      (euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, 0);

  };
c___UseAccount__process__return__(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      (account_get_res1937 ) with{
  
};

c___UseAccount_____initrepeat(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
  func__1944(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) with{
    func__1944(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1945(int(euros), account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

    func__1945(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      (euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

  };

c___UseAccount_____init(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
  func__1946(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) with{
    func__1946(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1947(int(euros), account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

    func__1947(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      func__1948(euros, ((euros )):_, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

    func__1948(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      helper1952(euros, c___Account_____init(account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) with{
           helper1952(euros, (account___euros, account___amount_1, account___amount_2, account___retsel__), input_3, account_get_res1937, retsel__) = 
              func__1949(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);};

    func__1949(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = 
      (euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);

  };

c___UseAccount(euros, input_3) = (function__1956 ~ (_,_,_,_,_,_,_,_,_)   ) : (_, _, _, _, _, _, _, _, !) : process_return_convert1954 with{
    function__1956(notused__7, account___euros, account___amount_1, account___amount_2, account___retsel__, notused__2, account_get_res1937, notused__0, notfirst__1955) = (if__(notfirst__1955,
          function_process__1958(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, 0),
          function_init__1957(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, 0)
    )),1;
  function_init__1957(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = process_convert1953(c___UseAccount_____init(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__));
  function_process__1958(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = process_convert1953(c___UseAccount_____initrepeat(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__));
  process_convert1953((euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__)) = c___UseAccount__process(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);
  process_return_convert1954(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__) = c___UseAccount__process__return__(euros, account___euros, account___amount_1, account___amount_2, account___retsel__, input_3, account_get_res1937, retsel__);
};
account = c___UseAccount ( 4 ) ; 
counter = + ( 1 ) ~ _ ; 
process = counter , account ( counter ) ; 
                         
