

class Allpass(int bufsize,float feedback){
    float buffer[bufsize];
    int bufidx;
    process(float input){
        float bufout   = buffer[bufidx];
        float output   = -input + bufout;
        buffer[bufidx] = input + (bufout*feedback);
        if(++bufidx>=bufsize)
            bufidx = 0;
        return output;
    }
}

class UseAllpass(int bufsize,float feedback){
    Allpass allpass(bufsize,feedback);
    process(){
        return 5;
    }
}

class Allpass3(int bufsize, float feedback){
    float bufout;
    process(float input){
        float output = -input + bufout;
        bufout = input + (bufout*feedback) : @(bufsize);
        //bufout = input + (bufout*feedback) : Delay(bufsize);
        return output;
    }
}

feedback = 0.2;
bufsize = 3;

allpass(dt,fb) = (_,_ <: (*(fb),_:+:@(dt)), -) ~ _ : (!,_);
counter = +(1) ~ _;
input = counter;

class Delay(int bufsize){
    float buffer[bufsize];
    int bufidx;
    process(float input){
        float output   = buffer[bufidx];
        buffer[bufidx] = input;
        if(++bufidx>=bufsize)
            bufidx = 0;
        return output;
    }    
}

process = counter, 
    Allpass(bufsize+1,feedback,input), 
    Allpass3(bufsize,feedback,input),
    allpass(bufsize,feedback,input),
    (counter : @(1)),
    (counter : @(2)),
    (counter : @(3)),
    Delay(1,counter),
    Delay(2,counter),
    Delay(3,counter);

