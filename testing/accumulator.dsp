
/*
  Note that 'sum' is a reserved keyword in Faust.
  We use 'sum_' instead.
 */

class Accumulator{
    int sum_;
    process(int inc){
        sum_ += inc;
        return sum_;
    }
}

counter = +(1) ~ _;
process = counter,Accumulator(counter);
