class Oscillator(float frequency){
  float phase;
  increase_phase(float how_much){
    phase += how_much;
  }
  float process(){
    this.increase_phase(frequency*3.14*2/44100);
    return sin(phase);
  }
}

freq = hslider("freq",400.0,10,3000,1);

process = Oscillator(freq);

