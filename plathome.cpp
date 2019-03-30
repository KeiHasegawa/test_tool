#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <functional>
#include <algorithm>
#include <cassert>

#include <sys/stat.h>

class PlatHome {
public:
  virtual std::string name() const = 0;
  virtual bool match() const = 0;
  static std::vector<PlatHome*> all;
  virtual ~PlatHome(){}
};

std::vector<PlatHome*> PlatHome::all;

int main()
{
  using namespace std;
  const vector<PlatHome*>& v = PlatHome::all;
  vector<PlatHome*>::const_iterator p =
    find_if(v.begin(),v.end(),mem_fun(&PlatHome::match));
  if ( p == v.end() ){
    cerr << "unknown\n";
    return 1;
  }
  cout << (*p)->name() << '\n';
  return 0;
}

struct Cygwin : PlatHome {
  Cygwin(){ all.push_back(this); }
  std::string name() const { return "cygwin"; }
  bool match() const;
  static Cygwin obj;
};

Cygwin Cygwin::obj;

bool Cygwin::match() const
{
  return system("uname -a | grep -q Cygwin") == 0;
}

struct Darwin : PlatHome {
  Darwin(){ all.push_back(this); }
  std::string name() const { return "darwin"; }
  bool match() const;
  static Darwin obj;
};

Darwin Darwin::obj;

bool Darwin::match() const
{
  return system("uname -a | grep -q Darwin") == 0;
}

struct Fedora : PlatHome {
  Fedora(){ all.push_back(this); }
  std::string name() const { return "fedora"; }
  bool match() const;
  static Fedora obj;
};

Fedora Fedora::obj;

bool Fedora::match() const
{
  using namespace std;
  ifstream ifs("/etc/redhat-release");
  if ( !ifs )
    return false;
  string s;
  ifs >> s;
  return s == "Fedora";
}

struct CentOS : PlatHome {
  CentOS(){ all.push_back(this); }
  std::string name() const;
  bool match() const;
  static CentOS obj;
};

CentOS CentOS::obj;

bool CentOS::match() const
{
  using namespace std;
  ifstream ifs("/etc/redhat-release");
  if ( !ifs )
    return false;
  string s;
  ifs >> s;
  return s == "CentOS";
}

std::string CentOS::name() const
{
  using namespace std;
  ifstream ifs("/etc/redhat-release");
  assert(!!ifs);
  string s;
  ifs >> s;
  assert(s == "CentOS");
  ifs >> s;
  assert(s == "release");
  ifs >> s;
  return "cent" + s.substr(0,1);
}

struct Debian : PlatHome {
  Debian(){ all.push_back(this); }
  std::string name() const { return "debian"; }
  bool match() const;
  static Debian obj;
};

Debian Debian::obj;

bool Debian::match() const
{
  struct stat buff;
  return stat("/etc/debian_version",&buff) == 0;
}

struct RedHat : PlatHome {
  RedHat(){ all.push_back(this); }
  std::string name() const { return "redhat"; }
  bool match() const;
  static RedHat obj;
};

RedHat RedHat::obj;

bool RedHat::match() const
{
  using namespace std;
  ifstream ifs("/etc/redhat-release");
  if ( !ifs )
    return false;
  string s;
  ifs >> s;
  return s == "Red";
}

struct Vine : PlatHome {
  Vine(){ all.push_back(this); }
  std::string name() const { return "vine"; }
  bool match() const;
  static Vine obj;
};

Vine Vine::obj;

bool Vine::match() const
{
  struct stat buff;
  return stat("/etc/vine-release",&buff) == 0;
}

struct Turbo : PlatHome {
  Turbo(){ all.push_back(this); }
  std::string name() const { return "turbo"; }
  bool match() const;
  static Turbo obj;
};

Turbo Turbo::obj;

bool Turbo::match() const
{
  struct stat buff;
  return stat("/etc/turbolinux-release",&buff) == 0;
}


