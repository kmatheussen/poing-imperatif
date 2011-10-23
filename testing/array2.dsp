size=4;

class Array{
    float buf[size]=1.0;
    process(int i){
        float a = buf[i%size];
        float b = buf[(i+1)%size];
        buf[i%size] = a+1.0;
        return a+b,i%size;
    }
}

//counter = +(1) ~ _ : mem;
counter = +(1) ~ _ ;
process = counter,Array(counter);

/*
 */
