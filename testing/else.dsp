
class A{
    int r = 0;

    process(){
        if (r > 7) {
	    r = 5;
        } else {
	    r++;
        }

        if (r > 7) {
	    r = 3;
        } else if (r < 1) {
	    r+=5;
        }

        return r;
    }
}

process = A;

/*
[kjetil@localhost poing-imperatif]$ ./poing-imperatif --keep -a plot.cpp testing/else.dsp >temp.cpp && g++ temp.cpp && ./a.out
1.000000	
2.000000	
3.000000	
4.000000	
5.000000	
6.000000	
7.000000	
3.000000	
4.000000	
5.000000	
6.000000	
7.000000	
3.000000	
4.000000	
5.000000	
6.000000	
*/
