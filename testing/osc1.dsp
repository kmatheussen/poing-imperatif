
class Oscillator(float frequency){
    float phase;
    float process(){
        phase += frequency*3.14*2/44100;
        return sin(phase);
    }
}

freq = hslider("freq",400.0,10,3000,1);

process = Oscillator(freq);

