class A{
    ret(){return 2,3;}
}

class B{
    A a;
    process(){return a.ret();}
}

process = B;
