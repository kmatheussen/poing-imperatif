
class A{
    process(){
        return float(50) + int(9);
    }
}

process = A;

/*
[kjetil@localhost poing-imperatif]$ ./poing-imperatif --keep -a plot.cpp testing/reserved.dsp >temp.cpp && g++ temp.cpp && ./a.out
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
59.000000	
*/

