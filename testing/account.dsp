
class Account(int euros){
    euros += 50; // Constructor!

    debit(int amount){
        euros -= amount;
    }
    deposit(int amount){
        euros += amount;
    }
    get(){
        return euros;
    }
}

class UseAccount(int euros){
    Account account(euros);
    process(input){
        account.debit(input-5);
        account.deposit(input*2);
        return account.euros;
        //return account.get();//euros;
    }
}


account = UseAccount(4);
counter = +(1) ~ _;
process = counter,account(counter);



/*
[kjetil@localhost impfaust]$ ./faust-imp --keep -a plot.cpp testing/account.dsp >temp.cpp && g++ temp.cpp && ./a.out 
1.000000        60.000000
2.000000        67.000000
3.000000        75.000000
4.000000        84.000000
5.000000        94.000000
6.000000        105.000000
7.000000        117.000000
8.000000        130.000000
9.000000        144.000000
10.000000       159.000000
11.000000       175.000000
12.000000       192.000000
13.000000       210.000000
14.000000       229.000000
15.000000       249.000000
16.000000       270.000000
*/

