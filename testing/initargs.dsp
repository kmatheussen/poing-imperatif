
class InitArgs(int size1, float b, int c){
    float buf[size1+2]=5.2;
    b+=20;
    get(ai){
        float ret=buf[0];
        buf[0] = 2.3;
        return ret;
        //return b+ai,4;
        //,ret;
        //return buf[0];//b;//ai,b,buf[size1-1];
    }
}

class Caller{
    InitArgs initargs(5, 12.3, 9);
    process(){
        return initargs.get(2);
    }
}

process = Caller;

