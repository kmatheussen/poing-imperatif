
class Phase{
  float phase;
  increase_phase(float how_much){
    phase += how_much;
  }
}

class Oscillator(float frequency){
  Phase phase;
  float process(){
    phase.increase_phase(frequency*3.14*2/44100);
    return sin(phase.phase);
  }
}

freq = hslider("freq",400.0,10,3000,1);

process = Oscillator(freq);

