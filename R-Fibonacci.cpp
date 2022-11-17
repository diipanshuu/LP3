#include<iostream>
using namespace std;
int fib(int n)
{
    if(n <= 1)
      return n;
    return fib(n-1)+fib(n-2);
}
int main()
{
    int input;
    cout<<"Enter nth number!"<<endl;
    cin>>input;

    cout<<fib(input)<<endl;
    return 0;
}