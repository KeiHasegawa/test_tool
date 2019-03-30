#include <iostream>
#include <vector>
#include <string>
#include <iterator>
#include <unistd.h>
#include <sys/wait.h>
#include <cstdlib>
#include <cassert>

namespace dog {
  char** cmdline(int, char**);
  std::string prog;
  bool fail_verbose;
  std::vector<std::string> argv;
  pid_t pid;
  namespace alarm {
    int value = 5;
    bool opt_spec = false;
  } // end of namespace alarm
  void alarm_handler(int);
}

int main(int argc, char** argv)
{
  using namespace std;
  argv = dog::cmdline(argc,argv);
  dog::pid = fork();
  if ( dog::pid < 0 ){
    cerr << dog::prog << " : cannot fork.\n";
    return 1;
  }
  if (!dog::pid ){
    execvp(*argv,argv);
    cerr << dog::prog << " : cannot exec ";
    copy(dog::argv.begin(),dog::argv.end(),ostream_iterator<string>(cerr," "));
    cerr << '\n';
    return 3;
  }
  signal(SIGALRM,dog::alarm_handler);
  int n = dog::alarm::value;
  if (!dog::alarm::opt_spec) {
    if ( char* p = getenv("DOG_ALARM") )
      n = atoi(p);
  }
  alarm(n);
  int status;
  wait(&status);
  if ( status && dog::fail_verbose ){
    char buf[256]; getcwd(&buf[0],sizeof buf);
    cerr << dog::prog << " : " << buf << ':';
    copy(dog::argv.begin(),dog::argv.end(),ostream_iterator<string>(cerr," "));
    cerr << '\n';
    return 4;
  }
  return status ? 1 : 0;
}

namespace dog {
  char** option_handler(char** argv, int* argc);
} // end of namespace dogc

char** dog::cmdline(int argc, char** argv)
{
  using namespace std;
  dog::prog = *argv;
  --argc, ++argv;
  while (**argv == '-')
    argv = option_handler(argv, &argc);
  copy(&argv[0],&argv[argc],back_inserter(dog::argv));
  return argv;
}

char** dog::option_handler(char** argv, int* argc)
{
  using namespace std;
  assert(**argv == '-');
  if (string("-v") == *argv) {
    fail_verbose = true;
    --*argc;
    return ++argv;
  }
  if (string("--alarm") == *argv) {
    --*argc;
    alarm::value = atoi(*++argv);
    alarm::opt_spec = true;
    --*argc;
    return ++argv;
  }
  cerr << dog::prog << " : unknown option `" << *argv << "'\n";
  --*argc;
  return ++argv;
}

void dog::alarm_handler(int)
{
  using namespace std;
  kill(pid,SIGKILL);
  char buf[256]; getcwd(&buf[0],sizeof buf);
  cerr << prog << " : " << buf << ':';
  copy(argv.begin(),argv.end(),ostream_iterator<string>(cerr," "));
  cerr << "was killed by " << prog << '\n';
  exit(5);
}
