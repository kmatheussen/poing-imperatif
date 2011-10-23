/*
  Documentation from Steve Harris:

  AM pitchshifter
  ***************

  This plugin works by running a single write pointer (monotonic) and two read pointers (pitchscaled) over a ringbuffer.
  The output is faded between the two readpointers according to the sine of the distance from the write pointer. 
  The design is based on the mechanism of a mechanical pitchshifter I saw in the Gemeentemuseum in Den Haag,
  though I'm sure it is a common enough algorithm.


    GPL 2 license:

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/



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

        /*
        if (size != last_size) {
            int size_tmp = f_round(size);
            if (size_tmp > 7) {
                size_tmp = 5;
            } else if (size_tmp < 1) {
                size_tmp = 1;
            }
            last_size = size;
            
            // Calculate the ringbuf parameters, the magick constants will need
            // to be changed if you change DELAY_SIZE
            delay_mask = (1 << (size_tmp + 6)) - 1;
            delay_ofs = 1 << (size_tmp + 5);
        }
        */

        delay_mask = (1 << (size + 6)) - 1;
        delay_ofs = 1 << (size + 5);


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

        int skew = i - wptr;

        out += cube_interp(float(rptr.fr) * 0.0000152587,
                           delayf(-1), delayf(0),
                           delayf(1),
                           delayf(2) * (1.0 - gain)) with{
            delayf(offset) = input : @(max(0,skew+offset));
        };
        i += delay_ofs;
        out += cube_interp(float(rptr.fr) * 0.0000152587,
                           delayf(-1), delayf(0),
                           delayf(1),
                           delayf(2) * gain)  with{
            //delayf(pos) = input : @(50);
            delayf(offset) = input : @(skew+delay_ofs+offset);
        };

        /* Increment ringbuffer pointers */
        wptr = (wptr + 1) & delay_mask;
        rptr.inc_all(om.all);
        rptr.in = rptr.in & delay_mask;

        //return delay[rptr.in];
        //return delay[5];
        return out;
    }
}


process = PitchShift(pitchSlider,bufSlider) * volumeSlider;
//process = PitchShift(pitchSlider,1) * volumeSlider;

/*
./poing-imperatif --faustexe /usr/bin/faust --keep -a sndfile.cpp testing/am_pitchshift.dsp >temp.cpp && g++ -O2 temp.cpp -lsndfil&& ./a.out /usr/share/sounds/alsa/Side_Left.wav hepp.wav && mplayer hepp.wav
 */
