
class A{
    int var_a;
    a_get(){
        return 3;
    }
}

class B{
    A a;
    float var_b;
    get(arg){
        return arg+4;
    }
    process(){
        return a.a_get() + this.get(5);
    }
}

process = B;

