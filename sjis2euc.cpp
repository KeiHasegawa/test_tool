#include <iostream>
#include <cstdio>

void f(unsigned char *uc1, unsigned char *uc2)
{
  *uc1 <<= 1;
  if (*uc2 < 0x9F) {
    if (*uc1 < 0x3F)
      *uc1 -= 0x61;
    else
      *uc1 += 0x1F;
    if (*uc2 > 0x7E)
      *uc2 += 0x60;
    else
      *uc2 += 0x61;
  } else {
    if (*uc1 < 0x3F)
      *uc1 -= 0x60;
    else
      *uc1 += 0x20;
    *uc2 += 0x02;
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
    if ( 0xA1 <= uc1 && uc1 <= 0xDF ){
      cout.put(0x8E);
      cout.put(uc1);
      continue;
    }
    if ( (c = cin.get()) == EOF )
      break;
    unsigned char uc2 = c;
    f(&uc1,&uc2);
    cout.put(uc1);
    cout.put(uc2);
  }
  return 0;
}
