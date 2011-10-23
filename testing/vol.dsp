
class Vol(float volume){
    process(float input){
        return input*volume;
    }
}

half_volume = Vol(0.5);
counter = +(1) ~ _;
process = counter,half_volume(counter);


/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/vol.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000	0.500000	
2.000000	1.000000	
3.000000	1.500000	
4.000000	2.000000	
5.000000	2.500000	
6.000000	3.000000	
7.000000	3.500000	
8.000000	4.000000	
9.000000	4.500000	
10.000000	5.000000	
11.000000	5.500000	
12.000000	6.000000	
13.000000	6.500000	
14.000000	7.000000	
15.000000	7.500000	
16.000000	8.000000	
 */

