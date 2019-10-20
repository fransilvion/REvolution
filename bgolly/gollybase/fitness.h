#ifndef FITNESS_H
#define FITNESS_H
#include <iostream>
#include <string>
#include "fitness.h"
#include "lifealgo.h"

using namespace std;

/* list fitness functions */
void listFitnessOptions();
bool isValidFitness(const string& name);
void evaluateFitness(const string& name, lifealgo& imp, ostream& out);

#endif /*FITNESS_H*/
