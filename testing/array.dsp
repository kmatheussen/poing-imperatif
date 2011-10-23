size=2;

class Array{
    float buf[size]=1.0;
    process(int i){
        float a = buf[i%size];
        buf[i%size] = a+1.0;
        return a,i%size;
    }
}

//counter = +(1) ~ _ : mem;
counter = +(1) ~ _ ;
process = counter,Array(counter);

/*
 */
