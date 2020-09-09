#include <cstdio>

// _RTC_Shutdown_rtc$TMZ => _RTC_Shutdown.rtc$TMZ
// _RTC_InitBase_rtc$IMZ => _RTC_InitBase.rtc$IMZ
int conv(int c)
{
  static int state;
  switch (state) {
  case 0:
    if (c == '_')
      state = 1;
    break;
  case 1:
    if (c == 'R')
      state = 2;
    else
      state = 0;
    break;
  case 2:
    if (c == 'T')
      state = 3;
    else
      state = 0;
    break;
  case 3:
    if (c == 'C')
      state = 4;
    else
      state = 0;
    break;
  case 4:
    if (c == '_')
      state = 5;
    else
      state = 0;
    break;
  case 5:
    if (c == 'S')
      state = 6;
    else if (c == 'I')
      state = 14;
    else
      state = 0;
    break;
  case 6:
    if (c == 'h')
      state = 7;
    else
      state = 0;
    break;
  case 7:
    if (c == 'u')
      state = 8;
    else
      state = 0;
    break;
  case 8:
    if (c == 't')
      state = 9;
    else
      state = 0;
    break;
  case 9:
    if (c == 'd')
      state = 10;
    else
      state = 0;
    break;
  case 10:
    if (c == 'o')
      state = 11;
    else
      state = 0;
    break;
  case 11:
    if (c == 'w')
      state = 12;
    else
      state = 0;
    break;
  case 12:
    if (c == 'n')
      state = 13;
    else
      state = 0;
    break;
  case 13:
    state = 0;
    if (c == '_')
      return '.';
    break;
  case 14:
    if (c == 'n')
      state = 15;
    else
      state = 0;
    break;
  case 15:
    if (c == 'i')
      state = 16;
    else
      state = 0;
    break;
  case 16:
    if (c == 't')
      state = 17;
    else
      state = 0;
    break;
  case 17:
    if (c == 'B')
      state = 18;
    else
      state = 0;
    break;
  case 18:
    if (c == 'a')
      state = 19;
    else
      state = 0;
    break;
  case 19:
    if (c == 's')
      state = 20;
    else
      state = 0;
    break;
  case 20:
    if (c == 'e')
      state = 21;
    else
      state = 0;
    break;
  case 21:
    state = 0;
    if (c == '_')
      return '.';
    break;
  }
  return c;
}

int main()
{
  int c;
  while ((c = getc(stdin)) != EOF)
    putc(conv(c), stdout);
  return 0;
}
