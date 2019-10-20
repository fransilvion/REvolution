#include "fitness.h"
#include <iostream>
#include <string>
#include <map>
#include <functional>
#include "lifealgo.h"
#include "bigint.h"
#include <cstdlib>

using namespace std;

typedef function<void(lifealgo&, ostream&)> Fitness;

void demo(lifealgo& imp, ostream& out) {
  out << "A demo!" << endl;
}

void rightFitness(lifealgo& imp, ostream& out) {
  bigint t, l, b, r;
  imp.findedges(&t, &l, &b, &r);
  string cmd = "python -c \"print(";
  cmd.append(r.tostring('\0')).append(" - max(abs(").append(t.tostring('\0')).append("), abs(").append(b.tostring('\0')).append("))**2)\"");
  system(cmd.c_str());
}

void population(lifealgo& imp, ostream& out) {
  out << imp.getPopulation().tostring('\0') << endl;
}

map<string,Fitness> ffMap = {
  {"demo", demo},
  {"right", rightFitness},
  {"pop", population}
};

void listFitnessOptions() {
  cerr << "Fitness functions:\n";
  for (auto e : ffMap) {
    cerr << e.first << '\n';
  }
  cerr << flush;
}

bool isValidFitness(const string& name) {
  return ffMap.count(name);
}

void evaluateFitness(const string& name, lifealgo& imp, ostream& out) {
  if (!isValidFitness(name)) {
    cerr << name << " is not a valid fitness function!!!" << endl;
    listFitnessOptions();
    return;
  }
  (ffMap[name])(imp, out);
}
