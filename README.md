![](https://github.com/fransilvion/REvolution/blob/master/img/logo.gif)

In Game of Evolution, the basic unit of life is an "organism"(a randomly generated instance of the classic [Conway's Game of Life](https://en.wikipedia.org/wiki/Game_of_Life)). The "organisms" will compete and evolve [via genetic algorithms](https://www.youtube.com/watch?v=qv6UVOQ0F44) to accomplish survival tasks within this universe, with the ultimate  goal of evolving a self-replicating system, or Artificial Life.

## What is Game of Life?
In Game of Life, a simple set of rules give rise to meta-stable entities termed [Cellular Automata](https://en.wikipedia.org/wiki/Cellular_automaton) (CA). Our "organism" is made up of many cells that follow these rules: 

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.

2. Any live cell with two or three live neighbours lives on to the next iteration.

3. Any live cell with more than three live neighbours dies, as if by over-population.

4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

#### Simple Demonstration: 
<img src="https://github.com/fransilvion/REvolution/blob/master/img/simple.gif" alt="Simple example of Game of Life" width="400"/>
   
They could be very complex: 
   
<img src="https://github.com/fransilvion/REvolution/blob/master/img/pattern_complex.gif" width="500"/>

And even create interesting patterns: 

<img src="https://github.com/fransilvion/REvolution/blob/master/img/complex.gif" height="250"/>
   
## Rules of the Game of Evolution

1. The universe is Conway's Game of Life (see above).

2. We begin with N "organisms", each with a randomly generated initial state. 

3. The objective is to design an environment which elicites a response from the set of all possible organisms.

4. Individual "organisms" may be stochastically mutated.

5. The game is won when we evolve an organism that can recapitulate the internal logic of the Game of Evolution.

The evolution process is achieved through N generations. Each generation is created by applying __genetic algorithm__(see below) to the previous generation.   

## Genetic algorithm

Taken from [this overview](https://medium.com/sigmoid/https-medium-com-rishabh-anand-on-the-origin-of-genetic-algorithms-fc927d2e11e0)

Evolution is a natural algorithm that arises from three fundamental properties. Any system with these three properties can be said to be evolving.

- Heritability
- Variability
- Selection

Genetic Algorithms (GA) work on the basic principles of evolution and some subprocesses that results from it. This involves incorporating the 4 fundamental steps of evolution:

- Fitness
- Selection
- Crosover
- Mutation

Together, these 4 processes, when performed on a population of organisms yield the fittest organism for the task being performed.

### Fitness

Fitness (also called loss function) is designed to measure how well organisms in the population complete the given task. This function can vary from application to application but it has to be a good differentiator, so it can be used to separate good agents from the bad ones.

### Selection

At this step we allow only the most fit organisms to remain in a population. By culling the weak, we provide a space for new organisms to arise from the fit organisms going into the next generation.

### Crossover/Sex

The idea behind this step is that two strong organisms reproduce to have a better offspring. In formal way, we can take certain or random parts from each of the two agents, and combine them to produce a "progeny". 

### Mutation

Mutations drive evolution. At the end of each generation, the fittest organisms grow to fill the space (left over from the culled organisms). As this growth occurs, a mutation function is applied to introduce variation in the daughters. 

These four steps form one "generation".

Typically, thousands (or in the case of humans billions) of generations occur to 'solve' an environment.

## An example environment

The objective of this project is to create a meta-framework in which the Game of Evolution may be played.

For example, we initiate 10,000 "organisms" defined as a 1,000 unit-cell circle (that is 10^301 possible states). Each "organism" will run for a million iterations of the Game of Life.

After a million iterations, the fitness of an "organism" is evaluted by how far right and how quickly the "organism" reached within the environment(the more to the right it moved, the higher the fitness).

<img src="https://github.com/fransilvion/REvolution/blob/master/img/moving_to_top_right.gif" height="300"/>&emsp;<img src="https://github.com/fransilvion/REvolution/blob/master/img/moving_to_right_with_fitness.gif" height="300"/>

**Fitness function:** max(x) - max(y)^2

The 1,000 most fit "organisms" from the current generation will be selected, allowed to grow via the mutation function and form the next generation.

**Mutation function** Mu(organism_N) = {organism_N1,organism_N2,...,organism_N10}

New "organisms" will arise, and the process restarts. Each iteration brining the evolved "organisms" closer and closer to winning the game.

### Here is a demonstration of the evolution process: 

![](https://github.com/fransilvion/REvolution/blob/master/img/generations_simulation.gif)

## Required software 

* [Golly](http://golly.sourceforge.net/)

* R (and RStudio)

* Python (and an IDE for it)

* gcc (or any C compiler)

* Amazon AWS CLI



