
DELAY_SIZE = 8192;
M_PI = 3.1415926535897932384626433832795028841;


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

f_round(f) = rint(f);

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

class PitchShift(float pitch, int size){

    float delay[DELAY_SIZE];

    int   wptr       = 0;
    int   last_size  = -1;
    int   delay_mask = 0xff;
    int   delay_ofs  = 0x80;
    int   last_gain  = 0.5;
    int   count      = 0;
    float last_inc   = 0.0;

    Fixp16 rptr;
    Fixp16 om;

    process(input){
	float gain = last_gain;
        float gain_inc = last_inc;
	int i;

        //////////////////////////////////
        /* Statements working per block */
        //////////////////////////////////
	om.set_all(f_round(pitch * 65536.0));

	if (size != last_size) {
	  int size_tmp = f_round(size);

	  if (size_tmp > 7) {
	    size_tmp = 5;
	  } else if (size_tmp < 1) {
	    size_tmp = 1;
	  }
	  last_size = size;

	  /* Calculate the ringbuf parameters, the magick constants will need
	   * to be changed if you change DELAY_SIZE */
	  delay_mask = (1 << (size_tmp + 6)) - 1;
	  delay_ofs = 1 << (size_tmp + 5);
	}


        //////////////////////////////////
        /* Statements working per frame */
        //////////////////////////////////
        float out = 0.0;

        if (++count > 14) {
	    float tmp;
	    count = 0;
            tmp = (rptr.in - wptr + int(delay_ofs/2)) & delay_mask;
	    tmp = 0.5 * tmp / float(delay_ofs);
	    tmp = sin(M_PI * 2.0 * tmp) * 0.5 + 0.5;
	    gain_inc = (tmp - gain) / 15.0;
        }
        gain += gain_inc;

        delay[wptr] = input;

        /* Add contributions from the two readpointers, scaled by thier
         * distance from the write pointer */

        i = rptr.in;
        /*
        out += cube_interp(float(rptr.fr) * 0.0000152587,
                           delay[(i - 1) & delay_mask], delay[i],
                           delay[(i + 1) & delay_mask],
                           delay[(i + 2) & delay_mask]) * (1.0 - gain);
        i += delay_ofs;
        out += cube_interp(float(rptr.fr) * 0.0000152587,
                           delay[(i - 1) & delay_mask], delay[i & delay_mask],
                           delay[(i + 1) & delay_mask],
                           delay[(i + 2) & delay_mask]) * gain;
        */
        /* Increment ringbuffer pointers */
        wptr = (wptr + 1) & delay_mask;
        rptr.inc_all(om.all);
        rptr.in = rptr.in & delay_mask;

        //return delay[rptr.in];
        //return delay[5];
        return out;
    }
}


process = PitchShift(1.0,4);

/*
./poing-imperatif --faustexe /usr/bin/faust --keep -a sndfile.cpp testing/am_pitchshift.dsp >temp.cpp && g++ -O2 temp.cpp -lsndfil&& ./a.out /usr/share/sounds/alsa/Side_Left.wav hepp.wav && mplayer hepp.wav
 */
