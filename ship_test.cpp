#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
#include <sstream>
#include <iterator>
#include <fstream>
#include <map>
#include <cassert>

#include <unistd.h>

namespace ship_test {
  namespace cmdline {
    void setup(int, char**);
    std::string prog;
    std::string vc;
    bool build_gen;
  } // end of namespace cmdline
  namespace config   { void action(); }
  std::string workdir;
  namespace archive {
    std::string bin;
    std::string gen;
  } // end of namespace archive
  namespace download { void action(); }
  namespace expand   { void action(); }
  namespace verif    { void action(); }
} // end of namespace ship_test

int main(int argc, char** argv)
{
  using namespace std;
  using namespace ship_test;
  cmdline::setup(argc,argv);
  config::action();
  download::action();
  expand::action();
  verif::action();
  return 0;
}

namespace ship_test { namespace cmdline {
  struct table_t : std::map<std::string, int (*)(char**)> {
    table_t();
  } table;
} } // end of namespace cmdline and ship_test

void ship_test::cmdline::setup(int argc, char** argv)
{
  using namespace std;
  prog = *argv;
  while ( *++argv ){
    if ( **argv != '-' ){
      cerr << "usage % " << prog << "[--option] ... [--option]\n";
      exit(1);
    }
    table_t::const_iterator p = table.find(*argv);
    if ( p == table.end() ){
      cerr << prog << " : unknown option `" << *argv << "'\n";
      exit(1);
    }
    argv += (p->second)(argv);
  }
}

namespace ship_test { namespace cmdline {
  int vc_option(char**);
  int build_gen_option(char**);
} } // end of namespace cmdline and ship_test

ship_test::cmdline::table_t::table_t()
{
  (*this)["--vc"] = vc_option;
  (*this)["--build-gen"] = build_gen_option;
}

int ship_test::cmdline::vc_option(char** argv)
{
  using namespace std;
  if ( !*++argv || **argv == '-' ){
    cerr << prog << " : --vc option requires argument\n";
    exit(1);
  }
  vc = "VC";
  vc += *argv;
  return 1;
}

int ship_test::cmdline::build_gen_option(char**)
{
  build_gen = true;
  return 0;
}

namespace ship_test { namespace config {
  struct discard_t : std::vector<std::string> {
    discard_t();
    static void action(std::string);
  } discard;
} } // end of namespace config and ship_test

void ship_test::config::action()
{
  using namespace std;
  workdir = "/tmp";
  if ( chdir(workdir.c_str()) != 0 ){
    cerr << cmdline::prog << " : chdir(" << workdir << ") failed.\n";
    exit(1);
  }
  for_each(discard.begin(),discard.end(),discard_t::action);
  archive::bin = "bin.tar.gz";
  archive::gen = "intel.tar.gz";
}

ship_test::config::discard_t::discard_t()
{
  push_back("20_hcc1");
  push_back("30_intel");
  push_back("bin");
  push_back("hcpp.cpp");
}

void ship_test::config::discard_t::action(std::string file)
{
  using namespace std;
  string cmd = "rm -r -f " + file;
  int status = system(cmd.c_str());
  if ( status != 0 ){
    cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
    exit(1);
  }
}

namespace ship_test { namespace download {
  std::string server_bindir();
  std::string server_gendir();
  std::string server_cppdir();
} } // end of namespace download and ship_test

void ship_test::download::action()
{
  using namespace std;
  {
    string file = server_bindir() + archive::bin;
    string cmd = "wget -q " + file + " -O " + archive::bin;
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
  if ( cmdline::build_gen ){
    string file = server_gendir() + archive::gen;
    string cmd = "wget -q " + file + " -O " + archive::gen;
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
  {
    string file = server_cppdir() + "hcpp.cpp";
    string cmd = "wget -q " + file + " -O " + "hcpp.cpp";
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
}

namespace ship_test { namespace download {
  struct table_t : std::map<std::string,std::string> {
    table_t();
  } table;
} } // end of namespace download and ship_test

std::string ship_test::download::server_bindir()
{
  using namespace std;
  string dir = "http://www.lang-hasegawa.co.jp/00_FREE/bin/";
  dir += "v10/";
  if ( !cmdline::vc.empty() )
    dir += "Windows/" + cmdline::vc + '/';
  else {
    string log = "/tmp/platohome.log";
    string cmd = "plathome.exe > " +  log;
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
    ifstream ifs(log.c_str());
    assert(!(!ifs));
    string s;
    ifs >> s;
    table_t::const_iterator p = table.find(s);
    assert(p != table.end());
    dir += p->second;
  }
  return dir;
}

std::string ship_test::download::server_gendir()
{
  return "http://www.lang-hasegawa.co.jp/00_FREE/intel/v10/";
}

std::string ship_test::download::server_cppdir()
{
  return "http://www.lang-hasegawa.co.jp/";
}

ship_test::download::table_t::table_t()
{
  (*this)["cygwin"] = "Windows/gxx/";
  (*this)["darwin"] = "MacOSX/";
  (*this)["debian"] = "Linux/Debian4/";
  (*this)["redhat"] = "Linux/RedHat9/";
  (*this)["vine"]   = "Linux/Vine4.1/";
  (*this)["cent5"]  = "Linux/CentOS5/";
  (*this)["fedora"] = "Linux/Fedora_Core6/";
  (*this)["cent4"]  = "Linux/CentOS4.5/";
  (*this)["turbo"]  = "Linux/Turbo8/";
}

void ship_test::expand::action()
{
  using namespace std;
  {
    string cmd = "gunzip -c " + archive::bin + "| tar xf -";
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
  if ( cmdline::build_gen ){
    string cmd = "gunzip -c " + archive::gen + "| tar xf -";
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
}

void ship_test::verif::action()
{
  using namespace std;
  const char* home = getenv("HOME");
  string lang = home;
  lang += "/lang";
  {
    string s = lang;
    s += "/bin/hcc1.exe";
    unlink(s.c_str());
  }
  {
    string s = lang;
    s += "/bin/intel.dll";
    unlink(s.c_str());
  }
  {
    string s = lang;
    s += "/bin/hcpp.exe";
    unlink(s.c_str());
  }
  {
    string cmd = "g++ hcpp.cpp -o bin/hcpp.exe";
    int status = system(cmd.c_str());
    if ( status != 0 ){
      cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
      exit(1);
    }
  }
  {
    string s = workdir + "/bin";
    s += ':';
    s += getenv("PATH");
    setenv("PATH",s.c_str(),1);
  }
  {
    string s = workdir + "/bin/intel.dll";
    if ( cmdline::build_gen ){
      unlink(s.c_str());
      if ( !cmdline::vc.empty() ){
	cerr << cmdline::prog << " : invoke VC++ and build manually.\n";
	exit(1);
      }
      s = workdir + "/30_intel/src";
      if ( chdir(s.c_str()) != 0 ){
	cerr << cmdline::prog << " : chdir(" << s << ") failed.\n";
	exit(1);
      }
      string cmd = "make";
      int status = system(cmd.c_str());
      if ( status != 0 ){
	cerr << cmdline::prog << " : system(" << cmd << ") failed.\n";
	exit(1);
      }
      s += "/intel.dll";
      setenv("CC1GENERATOR",s.c_str(),1);
    }
    else
      setenv("CC1GENERATOR",s.c_str(),1);
  }
  {
    setenv("DOG_ALARM","120",1);
  }
  {
    string s = lang;
    s += "/41_ISO_IEC_9899/6_Language";
    if ( chdir(s.c_str()) != 0 ){
      cerr << cmdline::prog << " : chdir(" << s << ") failed.\n";
      exit(1);
    }
    s = "verif.hcc1.";
    s += !cmdline::vc.emtyp() ? "vc" : "gxx";
    s += ">& /tmp/41_ISO_IEC_9899.log";
    system(s.c_str());
    s = "perl " + lang;
    s += "/bin/dog.pl /tmp/41_ISO_IEC_9899.log > /tmp/41_ISO_IEC_9899.dog";
    system(s.c_str());
  }
  {
    string s = lang + "/42_C2nd";
    if ( chdir(s.c_str()) != 0 ){
      cerr << cmdline::prog << " : chdir(" << s << ") failed.\n";
      exit(1);
    }
    s = "verif.hcc1.";
    s += !cmdline::vc.empty() ? "vc" : "gxx";
    s += ">& /tmp/42_C2nd.log";
    system(s.c_str());
    s = "perl " + lang;
    s += "/bin/dog.pl /tmp/42_C2nd.log > /tmp/42_C2nd.dog";
    system(s.c_str());
  }
}
