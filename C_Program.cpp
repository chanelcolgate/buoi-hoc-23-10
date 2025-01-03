#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

extern "C" void sv_write(int, int);
extern "C" void sv_read(int, int *);

extern "C" void C_Program(void)
{
    int * RDATA;

    cout << "######################################################" << endl;
    cout << " C++ task in C_Program() was called from UVM/SV side! " << endl;
    cout << "######################################################" << endl;
    sv_write(1024, 294905615);
    sv_write(1028, 305419896);
    sv_write(1032, 882400018);
    sv_write(1036, 536579909);

    return;
}
