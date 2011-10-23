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

    process(){
        int val =(2<<18) + 1000;
        this.set_all(val);
        return val,all,in,fr;
    }   
}


all = (2<<18) + 1000;
in = all>>16;
fr = all & 65535;

process = Fixp16, all,in,fr;
//process = all,in,fr, (c___Fixp16__set_all(all,0,0,all,0,0,0,0) : c___Fixp16__process__return__);

