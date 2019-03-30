#include <iostream>
#include <cstdio>

void f(unsigned char *uc1, unsigned char *uc2)
{
  if ( *uc1 & 0x01 ){
    *uc1 >>= 1;
    if ( *uc1 < 0x6F )
      *uc1 += 0x31;
    else
      *uc1 += 0x71;
    if ( *uc2 > 0xDF )
      *uc2 -= 0x60;
    else
      *uc2 -= 0x61;
  } else {
    *uc1 >>= 1;
    if ( *uc1 < 0x6F )
      *uc1 += 0x30;
    else
      *uc1 += 0x70;
    *uc2 -= 0x02;
  }
}

int main()
{
  using namespace std;
  int c;
  while ( (c = cin.get()) != EOF ){
    unsigned char uc1 = c;
    if ( uc1 < 0x80 ){
      cout.put(uc1);
      continue;
    }
    if ( (c = cin.get()) == EOF )
      break;
    unsigned char uc2 = c;
    if ( uc1 == 0x8E ){
      cout.put(uc2);
      continue;
    }
    f(&uc1,&uc2);
    cout.put(uc1);
    cout.put(uc2);
  }
  return 0;
}
