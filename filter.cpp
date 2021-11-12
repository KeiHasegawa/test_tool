#include <iostream>
#include <fstream>
#include <set>
#include <string>
using namespace std;

inline void usage(const char* prog)
{
  cerr << "usage % " << prog << " log-file pattern-file1 pattern-file2 ...\n";
}

int main(int argc, char** argv)
{
  if (argc < 2) {
    usage(argv[0]);
    return 1;
  }

  string lfile = argv[1];
  char buf[256];
  set<string> pattern;  
  for (int i = 2 ; i != argc ; ++i) {
    string pfile = argv[i];
    ifstream pfs(pfile);
    if (!pfs) {
      cerr << "cannot open " << pfile << '\n';
      return 1;
    }

    while (!pfs.eof()) {
      pfs.getline(&buf[0], sizeof buf);
      buf[255] = '\0';
      pattern.insert(&buf[0]);
    }
  }
  
  ifstream lfs(lfile);
  if (!lfs) {
    cerr << "cannot open " << lfile << '\n';
    return 1;
  }
  while (!lfs.eof()) {
    lfs.getline(&buf[0], sizeof buf);
    buf[255] = '\0';
    if (pattern.find(&buf[0]) == end(pattern))
      cout << &buf[0] << '\n';
  }
  return 0;
}
