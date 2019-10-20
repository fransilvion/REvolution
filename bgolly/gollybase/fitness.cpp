#include "fitness.h"
#include <iostream>
#include <string>
#include <map>
#include <functional>
#include "lifealgo.h"

using namespace std;

typedef function<void(lifealgo&, ostream&)> Fitness;

void demo(lifealgo& imp, ostream& out) {
  out << "A demo!" << endl;
}

map<string,Fitness> ffMap = {
  {"demo", demo}
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
