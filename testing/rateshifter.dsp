import("math.lib");

SAMPLERATE = SR;

DELAY_SIZE = 8192;
M_PI = 3.1415926535897932384626433832795028841;

pitchSlider = hslider("Pitch", 1.0, 0.25, 4.0, 0.025);
bufSlider = hslider("Buffer size", 4, 1, 7, 1);
volumeSlider = hslider("Volume", 1.0, 0.1, 6.0, 0.025);

class Fixp16{
    int all;
    int in;
    int fr;

    set_all(int all){
        this.all = all;
        this.in  = all >> 16;
        this.fr  = all & 0xffff;
    }

    inc_all(int inc){
        this.set_all(all+inc);
    }
}

class Fixp32{
    
}


f_round(f) = int(rint(f));

cube_interp(fr, inm1, in, inp1, inp2) =
    in + 
    0.5 * fr * (  inp1 - 
                  inm1 +  
                  fr * (  4.0 * inp1 + 2.0 * inm1 - 
                          5.0 * in - 
                          inp2 + 
                          fr * (  3.0 * (in - inp1) - 
                                  inm1 + 
                                  inp2)));
closest_power2(x) = pow(2,int(temp+0.5)) with{
    temp = log(x) / log(2);
};

buffer_size = closest_power2(2.7*SAMPLERATE);


class RateShifter(float rate){
 
    Fixp32 read_ptr;
    int write_ptr;

    float buffer[buffer_size];

    int buffer_mask = buffer_size -1 ;

    process(input){
        int read_inc = rate * 4294967296.0f;

        int rp = read_ptr.in;

        /* Do write pointer stuff */
        buffer[write_ptr] = input;
        write_ptr = (write_ptr + 1) & buffer_mask;
        
        /* And now read pointer */
        float out = cube_interp((float)read_ptr.fr / 4294967296.0f,
                                buffer[(rp - 1) & buffer_mask],
                                buffer[rp], 
                                buffer[(rp + 1) & buffer_mask],
                                buffer[(rp + 2) & buffer_mask]
                                );

        read_ptr.inc_all(read_inc.all);
        read_ptr.in = read_ptr.in & buffer_mask;

        return out;
    }
}

