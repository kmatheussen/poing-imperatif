
class A{
    int a=1;
    float b=1.3;
}

class B{
    A a1;
    A a2;
    process(){
        a1.a++;
        a2.b++;
        return a1.a, a2.b;
    }
}
process = B;

/*
[kjetil@localhost poing-imperatif]$  ./poing-imperatif --keep -a plot.cpp testing/classvar.dsp >temp.cpp && g++ temp.cpp && ./a.out 
2.000000	2.300000	
3.000000	3.300000	
4.000000	4.300000	
5.000000	5.300000	
6.000000	6.300000	
7.000000	7.300000	
8.000000	8.300000	
9.000000	9.300000	
10.000000	10.300000	
11.000000	11.300000	
12.000000	12.300000	
13.000000	13.300000	
14.000000	14.300000	
15.000000	15.300000	
16.000000	16.299999	
17.000000	17.299999	
*/
