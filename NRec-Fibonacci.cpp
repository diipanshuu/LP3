#include<iostream>
using namespace std;
int main()
{
    int n;
    cout<<"Enter a number to show the fibonacci series!";
    cin>>n;

    if(n==1)
    {
        cout<<"0 ";
    }
    else if(n==2)
    {
        cout<<"0 1 ";
    }
    else
    {
        int fibo, a=0, b=1, i=3;
        cout<<a<<" "<<b<<" ";
        while(i<=n)
        {
            fibo=a+b;
            cout<<fibo<<" ";
            a=b;
            b=fibo;
            i++;
        }
    }
    return 0;
}
