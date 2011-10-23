// Constant Parameters
//--------------------

fixedgain	= 0.015;
scalewet	= 3.0;
scaledry	= 2.0;
scaledamp	= 0.4;
scaleroom	= 0.28;
offsetroom	= 0.7;
initialroom	= 0.5;
initialdamp	= 0.5;
initialwet	= 1.0/scalewet;
initialdry	= 0;
initialwidth= 1.0;
initialmode	= 0.0;
freezemode	= 0.5;
stereospread= 23;
allpassfeed	= 0.5;


// Filter Parametres
//------------------

combtuningL1	= 1116;
combtuningL2	= 1188;
combtuningL3	= 1277;
combtuningL4	= 1356;
combtuningL5	= 1422;
combtuningL6	= 1491;
combtuningL7	= 1557;
combtuningL8	= 1617;

allpasstuningL1	= 556;
allpasstuningL2	= 441;
allpasstuningL3	= 341;
allpasstuningL4	= 225;


// Control Sliders
//--------------------
// Damp : filtrage des aigus des echos (surtout actif pour des grandes valeurs de RoomSize)
// RoomSize : taille de la piece
// Dry : signal original
// Wet : signal avec reverbration

dampSlider 		= hslider("Damp",0.99, 0, 1, 0.025)*scaledamp;
roomsizeSlider 	= hslider("RoomSize", 0.99, 0, 1, 0.025)*scaleroom + offsetroom;
wetSlider 		= hslider("Wet", 0.99, 0, 1, 0.025);
drySlider 		= hslider("Dry", 0, 0, 1, 0.025);
combfeed 		= roomsizeSlider;




class Allpass(int bufsize, float feedback){
    float bufout;
    process(float input){
        float output = -input + bufout;
        bufout       = input  + (bufout*feedback) : @(bufsize);
        return output;
    }
}
class Comb(int bufsize, float feedback, float damp){
    float filterstore;
    float bufout;
    process(float input){
        filterstore = (bufout*(1.0-damp)) + (filterstore*damp);
        bufout      = input + (filterstore*feedback) : @(bufsize);
        return bufout;
    }
}

class MonoReverb(float fb1, float fb2, float damp, float spread){
    Allpass allpass1(allpasstuningL1+spread, fb2);
    Allpass allpass2(allpasstuningL2+spread, fb2);
    Allpass allpass3(allpasstuningL3+spread, fb2);
    Allpass allpass4(allpasstuningL4+spread, fb2);
    Comb comb1(combtuningL1+spread, fb1, damp);
    Comb comb2(combtuningL2+spread, fb1, damp);
    Comb comb3(combtuningL3+spread, fb1, damp);
    Comb comb4(combtuningL4+spread, fb1, damp);
    Comb comb5(combtuningL5+spread, fb1, damp);
    Comb comb6(combtuningL6+spread, fb1, damp);
    Comb comb7(combtuningL7+spread, fb1, damp);
    Comb comb8(combtuningL8+spread, fb1, damp);
    process(input){
        return allpass1.process(
                                allpass2.process(
                                                 allpass3.process(
                                                                  allpass4.process(
                                                                                   comb1.process(input) +
                                                                                   comb2.process(input) +
                                                                                   comb3.process(input) +
                                                                                   comb4.process(input) +
                                                                                   comb5.process(input) +
                                                                                   comb6.process(input) +
                                                                                   comb7.process(input) +
                                                                                   comb8.process(input)
                                                                                   )
                                                                  )
                                                 )
                                );
    }
}
class StereoReverb(float fb1, float fb2, float damp, int spread){
    MonoReverb rev0(fb1,fb2,damp,0);
    MonoReverb rev1(fb1,fb2,damp,spread);
    process(float left, float right){
        return rev0.process(left+right),
            rev1.process(left+right);
    }
}
class FxCtrl(float gain, float wet, Fx){
    process(float left, float right){
        float fx_left, fx_right = Fx(left*gain, right*gain);
        return left *(1-wet) + fx_left *wet,
            right*(1-wet) + fx_right*wet;
    }
}

//counter = +(1) ~ _;
process = FxCtrl(fixedgain,
                 wetSlider,
                 StereoReverb(combfeed,
                              allpassfeed,
                              dampSlider,
                              stereospread
                              ));
                 
//                 counter,
//                 counter* 0.4);

/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/freeverb2.dsp >temp.cpp && g++ temp.cpp && ./a.out 
0.010000	0.004000	
0.020000	0.008000	
0.030000	0.012000	
0.040000	0.016000	
0.050000	0.020000	
0.060000	0.024000	
0.070000	0.028000	
0.080000	0.032000	
0.090000	0.036000	
0.100000	0.040000	
0.110000	0.044000	
0.120000	0.048000	
0.130000	0.052000	
0.140000	0.056000	
0.150000	0.060000	
0.160000	0.064000	

[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/freeverb1.dsp >temp.cpp && g++ temp.cpp && ./a.out 
0.176320	0.170320	
0.352640	0.340640	
0.528960	0.510960	
0.705280	0.681280	
0.881600	0.851600	
1.057920	1.021920	
1.234240	1.192240	
1.410560	1.362560	
1.586880	1.532880	
1.763200	1.703200	
1.939520	1.873520	
2.115840	2.043840	
2.292160	2.214160	
2.468480	2.384480	
2.644800	2.554800	
2.821120	2.725120	
 */
