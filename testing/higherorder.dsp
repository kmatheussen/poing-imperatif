
class A(func){
    float result;
    process(){
        result += func(0.5);
        return result;
    }
}

class B(func){
    float result;
    process(){
        result += func(0.5);
        return result;
    }
}

mul2(add) = add*2;

process = A(mul2), A(*(2)), B(_);

/*
[kjetil@localhost poing-imperatif]$  ./poing-imperatif  --keep -a plot.cpp testing/higherorder.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000	1.000000	0.500000	
2.000000	2.000000	1.000000	
3.000000	3.000000	1.500000	
4.000000	4.000000	2.000000	
5.000000	5.000000	2.500000	
6.000000	6.000000	3.000000	
7.000000	7.000000	3.500000	
8.000000	8.000000	4.000000	
9.000000	9.000000	4.500000	
10.000000	10.000000	5.000000	
11.000000	11.000000	5.500000	
12.000000	12.000000	6.000000	
13.000000	13.000000	6.500000	
14.000000	14.000000	7.000000	
15.000000	15.000000	7.500000	
16.000000	16.000000	8.000000	
 */
