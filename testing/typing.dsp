
class Untyped(a){
    int b;  // Must be explicitly typed
    int c=5;  // Must be explicitly typed
    process(d){
        int e=6;  // Must be explicitly typed
        b=2;
        return a+b+c+d+e;
    }
}


class Typed(int a){
    int b;  
    int c=5;
    int process(int d){
        int e=6;
        b=2;
        return a+b+c+d+e;
    }
}

counter = +(1) ~ _;
process = counter,Untyped(10,counter),Typed(10,counter);

/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/typing.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000	24.000000	24.000000	
2.000000	25.000000	25.000000	
3.000000	26.000000	26.000000	
4.000000	27.000000	27.000000	
5.000000	28.000000	28.000000	
6.000000	29.000000	29.000000	
7.000000	30.000000	30.000000	
8.000000	31.000000	31.000000	
9.000000	32.000000	32.000000	
10.000000	33.000000	33.000000	
11.000000	34.000000	34.000000	
12.000000	35.000000	35.000000	
13.000000	36.000000	36.000000	
14.000000	37.000000	37.000000	
15.000000	38.000000	38.000000	
16.000000	39.000000	39.000000	
 */

