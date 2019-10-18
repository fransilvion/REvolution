# Game of Evolution

In the classic [Conway's Game of Life](https://en.wikipedia.org/wiki/Game_of_Life), a simple set or rules give rise to meta-stable entities termed Cellular Automata (CA). Fundamentally, CA are a form of intelligently designed  complexity, in contrast to natural life which is the product of  evolution. We are creating a "Game of Evolution", in which randomly  generated CA will compete and evolve [via genetic algorithms](https://www.youtube.com/watch?v=qv6UVOQ0F44) to accomplish survival tasks within this universe, with the ultimate  goal of evolving a self-replicating system, or Artificial Life.

![Alt Text](https://matthewdharriscom.files.wordpress.com/2016/02/gol1b.gif)

## Rules of the Game of Life

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.

2. Any live cell with two or three live neighbours lives on to the next iteration.

3. Any live cell with more than three live neighbours dies, as if by over-population.

4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

   
## Rules of the Game of Evolution

1. The universe is Conway's Game of Life (see above).

2. All initial states ('organisms') of the system must be randomly set.

3. The objective is to design an environment which elicites a response from the set of all possible organisms.

4. Individual organisms may be stochiastically mutated.

5. The game is won when an organism is evolved that can recapitulate the internal logic of the Game of Evolution.

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

![Imgur](https://github.com/fransilvion/REvolution/Game_of_evolution.png)

## An example environment

![Alt Text](https://i.imgur.com/qVyIWmK.gif)

The objective of this project is to create a meta-framework in which the Game of Evolution may be played.

For example, we initiate 10,000 each of an organism defined as a 1,000 unit-cell circle (that is 10^301 possible states). Each organism will run for a million iterations of the Game of Life.

After a million iterations, organisms fitness is evaluted by far (up and to the right) and how quickly the organism reached within the environment the organism reached.

**Fitness function:** x/t + y/t

The 1,000 most fit organisms from the current generation will be selected, allowed to grow via the mutation function and form the next generation.

**Mutation function** Mu(organism_N) = {organism_N1,organism_N2,...,organism_N10}

New organisms will arise, and the process restarts. Each iteration brining the evolved organisms closer and closer to 'solving' the environment.

## Required software 

* [Golly](http://golly.sourceforge.net/)

* R (and RStudio)

* Python (and an IDE for it)

* gcc (or any C compiler)

* Amazon AWS CLI



