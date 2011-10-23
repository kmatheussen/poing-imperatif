class A{
    process(int selector){
        if(selector)
            return 2;
        else
            return 3;
    }
}

counter = +(1) ~ _;
process = counter,A(counter%2);

/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/return.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000	2.000000	
2.000000	3.000000	
3.000000	2.000000	
4.000000	3.000000	
5.000000	2.000000	
6.000000	3.000000	
7.000000	2.000000	
8.000000	3.000000	
9.000000	2.000000	
10.000000	3.000000	
11.000000	2.000000	
12.000000	3.000000	
13.000000	2.000000	
14.000000	3.000000	
15.000000	2.000000	
16.000000	3.000000	
*/
