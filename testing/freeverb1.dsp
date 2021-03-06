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
    int   bufidx;
    float buffer[bufsize];
    process(input){
        float bufout = buffer[bufidx];
        float output = -input + bufout;
        buffer[bufidx] = input + (bufout*feedback);
        if(++bufidx>=bufsize)
            bufidx = 0;
        return output;
    }
}



class Comb(int bufsize, float feedback, float damp){
    float filterstore;
    int   bufidx;
    float buffer[bufsize];
    process(input){
        filterstore    = (buffer[bufidx]*(1.0-damp)) + (filterstore*damp);
        float output   = input + (filterstore*feedback);
        buffer[bufidx] = output;
        if(++bufidx>=bufsize)
            bufidx = 0;
        return output;
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


 /*
["fixedgain" "=" "0.015" ";" "scalewet" "=" "3.0" ";" "scaledry" "="
 "2.0" ";" "scaledamp" "=" "0.4" ";" "scaleroom" "=" "0.28" ";"
 "offsetroom" "=" "0.7" ";" "initialroom" "=" "0.5" ";" "initialdamp"
 "=" "0.5" ";" "initialwet" "=" "1.0" "/" "scalewet" ";" "initialdry"
 "=" "0" ";" "initialwidth" "=" "1.0" ";" "initialmode" "=" "0.0" ";"
 "freezemode" "=" "0.5" ";" "stereospread" "=" "23" ";" "allpassfeed"
 "=" "0.5" ";" "combtuningL1" "=" "1116" ";" "combtuningL2" "=" "1188"
 ";" "combtuningL3" "=" "1277" ";" "combtuningL4" "=" "1356" ";"
 "combtuningL5" "=" "1422" ";" "combtuningL6" "=" "1491" ";"
 "combtuningL7" "=" "1557" ";" "combtuningL8" "=" "1617" ";"
 "allpasstuningL1" "=" "556" ";" "allpasstuningL2" "=" "441" ";"
 "allpasstuningL3" "=" "341" ";" "allpasstuningL4" "=" "225" ";"
 "dampSlider" "=" "hslider" "(" "\"Damp\"" "," "0.99" "," "0" "," "1"
 "," "0.025" ")" "*" "scaledamp" ";" "roomsizeSlider" "=" "hslider" "("
 "\"RoomSize\"" "," "0.99" "," "0" "," "1" "," "0.025" ")" "*"
 "scaleroom" "+" "offsetroom" ";" "wetSlider" "=" "hslider" "("
 "\"Wet\"" "," "0.99" "," "0" "," "1" "," "0.025" ")" ";" "drySlider"
 "=" "hslider" "(" "\"Dry\"" "," "0" "," "0" "," "1" "," "0.025" ")"
 ";" "combfeed" "=" "roomsizeSlider" ";"
 [class c___Allpass [[int bufsize] [float feedback]]
  [[p-object-decl int bufidx []]
   [array float buffer [p-expr "bufsize"] 0.0]
   [method process [[unknown input]]
    [block
     [float [bufout] [p-expr [p-array-ref buffer [p-expr "bufidx"]]]]
     [float [output] [p-expr "-" "input" "+" "bufout"]]
     [array-set! buffer [p-expr "bufidx"]
      [p-expr "input" "+" "(" "bufout" "*" "feedback" ")"]]
     [if [p-expr [pre-++ bufidx] ">=" "bufsize"]
      [set! bufidx [p-expr "0"]]]
     [return [p-expr "output"]]]]]]
 [class c___Comb [[int bufsize] [float feedback] [float damp]]
  [[p-object-decl float filterstore []] [p-object-decl int bufidx []]
   [array float buffer [p-expr "bufsize"] 0.0]
   [method process [[unknown input]]
    [block
     [set! filterstore
      [p-expr "(" [p-array-ref buffer [p-expr "bufidx"]] "*" "(" "1.0"
       "-" "damp" ")" ")" "+" "(" "filterstore" "*" "damp" ")"]]
     [float [output]
      [p-expr "input" "+" "(" "filterstore" "*" "feedback" ")"]]
     [array-set! buffer [p-expr "bufidx"] [p-expr "output"]]
     [if [p-expr [pre-++ bufidx] ">=" "bufsize"]
      [set! bufidx [p-expr "0"]]]
     [return [p-expr "output"]]]]]]
 [class c___MonoReverb
  [[float fb1] [float fb2] [float damp] [float spread]]
  [[p-object-decl c___Allpass allpass1
    [p-expr "allpasstuningL1" "+" "spread" "," "fb2"]]
   [p-object-decl c___Allpass allpass2
    [p-expr "allpasstuningL2" "+" "spread" "," "fb2"]]
   [p-object-decl c___Allpass allpass3
    [p-expr "allpasstuningL3" "+" "spread" "," "fb2"]]
   [p-object-decl c___Allpass allpass4
    [p-expr "allpasstuningL4" "+" "spread" "," "fb2"]]
   [p-object-decl c___Comb comb1
    [p-expr "combtuningL1" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb2
    [p-expr "combtuningL2" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb3
    [p-expr "combtuningL3" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb4
    [p-expr "combtuningL4" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb5
    [p-expr "combtuningL5" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb6
    [p-expr "combtuningL6" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb7
    [p-expr "combtuningL7" "+" "spread" "," "fb1" "," "damp"]]
   [p-object-decl c___Comb comb8
    [p-expr "combtuningL8" "+" "spread" "," "fb1" "," "damp"]]
   [method process [[unknown input]]
    [block
     [return
      [p-expr
       [p-method-call allpass1 process
        [p-expr
         [p-method-call allpass2 process
          [p-expr
           [p-method-call allpass3 process
            [p-expr
             [p-method-call allpass4 process
              [p-expr [p-method-call comb1 process [p-expr "input"]]
               "+" [p-method-call comb2 process [p-expr "input"]] "+"
               [p-method-call comb3 process [p-expr "input"]] "+"
               [p-method-call comb4 process [p-expr "input"]] "+"
               [p-method-call comb5 process [p-expr "input"]] "+"
               [p-method-call comb6 process [p-expr "input"]] "+"
               [p-method-call comb7 process [p-expr "input"]] "+"
               [p-method-call comb8 process
                [p-expr "input"]]]]]]]]]]]]]]]]
 [class c___StereoReverb
  [[float fb1] [float fb2] [float damp] [int spread]]
  [[p-object-decl c___MonoReverb rev0
    [p-expr "fb1" "," "fb2" "," "damp" "," "0"]]
   [p-object-decl c___MonoReverb rev1
    [p-expr "fb1" "," "fb2" "," "damp" "," "spread"]]
   [method process [[float left] [float right]]
    [block
     [return
     [p-expr [p-method-call rev0 process [p-expr "left" "+" "right"]]
             ","
             [p-method-call rev1 process [p-expr "left" "+" "right"]]]]]]]]
 [class c___FxCtrl [[float gain] [float wet] [unknown c___Fx]]
  [[method process [[float left] [float right]]
    [block
     [float [fx_left fx_right]
      [p-expr "c___Fx" "(" "left" "*" "gain" "," "right" "*" "gain"
       ")"]]
     [return
      [p-expr "left" "*" "(" "1" "-" "wet" ")" "+" "fx_left" "*" "wet"
       "," "right" "*" "(" "1" "-" "wet" ")" "+" "fx_right" "*"
       "wet"]]]]]]
 "process" "=" "c___FxCtrl" "(" "fixedgain" "," "wetSlider" ","
 "c___StereoReverb" "(" "combfeed" "," "allpassfeed" "," "dampSlider"
 "," "stereospread" ")" ")" ";"]
*/
     

 /*
    After parsing:

[[class c___Allpass [[int bufsize] [float feedback]]
        [[int bufidx []]
         [array float buffer [p-expr "bufsize"] 0.0]
         [method process [[unknown input]]
                 [block
                  [float [bufout]
                                 [p-expr [p-array-ref buffer [p-expr "bufidx"]]]]
                  [float [output] [p-expr "-" "input" "+" "bufout"]]
                  [array-set! buffer [p-expr "bufidx"]
                              [p-expr "input" "+" [p-expr "bufout" "*" "feedback"]]]
                  [if [p-expr [pre-++ bufidx] ">=" "bufsize"]
                      [set! bufidx [p-expr "0"]]]
                  [return [p-expr "output"]]]]]]
 [class c___Comb [[int bufsize] [float feedback] [float damp]]
        [[float filterstore []] 
         [int bufidx []]
         [array float buffer [p-expr "bufsize"] 0.0]
         [method process [[unknown input]]
                 [block
                  [set! filterstore
                        [p-expr
                         [p-expr [p-array-ref buffer [p-expr "bufidx"]] "*"
                                 [p-expr "1.0" "-" "damp"]]
                         "+" [p-expr "filterstore" "*" "damp"]]]
                  [float [output]
                                 [p-expr "input" "+" [p-expr "filterstore" "*" "feedback"]]]
                  [array-set! buffer [p-expr "bufidx"] [p-expr "output"]]
                  [if [p-expr [pre-++ bufidx] ">=" "bufsize"]
                      [set! bufidx [p-expr "0"]]]
                  [return [p-expr "output"]]]]]]
 [class c___MonoReverb [[float fb1] [float fb2] [float damp] [float spread]]
        [[p-object-decl c___Allpass allpass1
                   [p-expr "allpasstuningL1" "+" "spread" "," "fb2"]]
         [p-object-decl c___Allpass allpass2
                   [p-expr "allpasstuningL2" "+" "spread" "," "fb2"]]
         [p-object-decl c___Allpass allpass3
                   [p-expr "allpasstuningL3" "+" "spread" "," "fb2"]]
         [p-object-decl c___Allpass allpass4
                   [p-expr "allpasstuningL4" "+" "spread" "," "fb2"]]
         [p-object-decl c___Comb comb1
                   [p-expr "combtuningL1" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb2
                   [p-expr "combtuningL2" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb3
                   [p-expr "combtuningL3" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb4
                   [p-expr "combtuningL4" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb5
                   [p-expr "combtuningL5" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb6
                   [p-expr "combtuningL6" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb7
                   [p-expr "combtuningL7" "+" "spread" "," "fb1" "," "damp"]]
         [p-object-decl c___Comb comb8
                   [p-expr "combtuningL8" "+" "spread" "," "fb1" "," "damp"]]
         [method process [[unknown input]]
                 [block [return [p-expr
                                   [p-method-call allpass1 process
                                    [p-expr
                                     [p-method-call allpass2 process
                                      [p-expr
                                       [p-method-call allpass3 process
                                        [p-expr
                                         [p-method-call allpass4 process
                                          [p-expr [p-method-call comb1 process [p-expr "input"]]
                                           "+" [p-method-call comb2 process [p-expr "input"]] "+"
                                           [p-method-call comb3 process [p-expr "input"]] "+"
                                           [p-method-call comb4 process [p-expr "input"]] "+"
                                           [p-method-call comb5 process [p-expr "input"]] "+"
                                           [p-method-call comb6 process [p-expr "input"]] "+"
                                           [p-method-call comb7 process [p-expr "input"]] "+"
                                           [p-method-call comb8 process
                                            [p-expr "input"]]]]]]]]]]]]]]]]
 [class c___StereoReverb
        [[float fb1] [float fb2] [float damp] [int spread]]
        [[p-object-decl c___MonoReverb rev0 [p-expr "fb1" "," "fb2" "," "damp" "," "0"]]
         [p-object-decl c___MonoReverb rev1 [p-expr "fb1" "," "fb2" "," "damp" "," "spread"]]
         [method process [[float left] [float right]]
                 [block [return [p-expr [p-method-call rev0 process [p-expr "left" "+" "right"]]
                                   ","]]]]]]
 [class c___FxCtrl [[float gain] [float wet] [unknown c___Fx]]
        [[method process [[float left] [float right]]
                 [block
                  [float [fx_left fx_right] [p-expr "c___Fx"
                                                    [p-expr "left" "*" "gain" "," "right" "*" "gain"]]]
                  [return [p-expr "left" "*" [p-expr "1" "-" "wet"] "+" "fx_left" "*" "wet"
                           "," "right" "*" [p-expr "1" "-" "wet"] "+" "fx_right" "*"
                           "wet"]]]]]]]

*/

