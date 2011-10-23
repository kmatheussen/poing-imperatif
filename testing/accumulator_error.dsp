
/*
  Note that 'sum' is a reserved keyword in Faust.
  We use 'sum_' instead.
 */

class Accumulator{
    int sum;
    process(int inc){
        sum += inc;
        return sum;
    }
}

counter = +(1) ~ _;
process = counter,Accumulator(counter);
