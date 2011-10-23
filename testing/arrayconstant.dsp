class Array(int size){
    float buf[size];
    process(){
        size += 1;
        return size;
    }
}
process = Array(5);

// The output below is correct!!

/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/arrayconstant.dsp >temp.cpp && g++ temp.cpp && ./a.out 
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	
6.000000	

 */
