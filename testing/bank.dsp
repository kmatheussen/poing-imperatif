class Bank{
    int a;
    add(int how_much){
        a += how_much;
    }
}

class UseBank{
    Bank bank;
    process(input){
        bank.add(input);
        return bank.a;
    }
}

counter = +(1) ~ _;
process = counter,UseBank(counter);

/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/bank.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000	1.000000	
2.000000	3.000000	
3.000000	6.000000	
4.000000	10.000000	
5.000000	15.000000	
6.000000	21.000000	
7.000000	28.000000	
8.000000	36.000000	
9.000000	45.000000	
10.000000	55.000000	
11.000000	66.000000	
12.000000	78.000000	
13.000000	91.000000	
14.000000	105.000000	
15.000000	120.000000	
16.000000	136.000000	
*/
