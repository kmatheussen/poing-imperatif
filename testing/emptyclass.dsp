
class A{
}

class B{
  A a;
}

class C{
  B b;
  get50(){
    return 50;
  }
}

class D{
 C c;
 process(){
   return c.get50();
 }
}
process = 50,D;

/*
[kjetil@localhost poing-imperatif]$  ./poing-imperatif --keep -a plot.cpp testing/emptyclass.dsp >temp.cpp && g++ temp.cpp && ./a.out 
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
50.000000	50.000000	
*/
