# Game of Evolution

In the classic [Conway's Game of Life](https://en.wikipedia.org/wiki/Game_of_Life), a simple set or rules give rise to meta-stable entities termed Cellular Automata (CA). Fundamentally, CA are a form of intelligently designed  complexity, in contrast to natural life which is the product of  evolution. We are creating a "Game of Evolution", in which randomly  generated CA will compete and evolve [via genetic algorithms](https://www.youtube.com/watch?v=qv6UVOQ0F44) to accomplish survival tasks within this universe, with the ultimate  goal of evolving a self-replicating system, or Artificial Life.

![Alt Text](https://matthewdharriscom.files.wordpress.com/2016/02/gol1b.gif)

## Rules of the game

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.

2. Any live cell with two or three live neighbours lives on to the next generation.

3. Any live cell with more than three live neighbours dies, as if by over-population.

4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

   

## Genetic algorithm

Taken from [this nice overview](https://medium.com/sigmoid/https-medium-com-rishabh-anand-on-the-origin-of-genetic-algorithms-fc927d2e11e0)

Genetic Algorithms (GA) work on the basic principles of evolution as it is a  meta heuristic to natural selection and the various subprocesses that  occur spontaneously. This involves incorporating the 4 fundamental steps of evolution:

- Fitness
- Selection
- Crossover
- Mutation

Together, these 4 processes, when performed on a population of agents yield the fittest agent for the task being performed.

### Fitness

Fitness (or loss) function is designed to measure how well agents in the population can complete the given task. This function can vary from application to application. But it has to be a good differentiator, so it can be used to separate good agents from the bad ones.

### Selection

At this step we allow just a few best-scoring agents to remain in a population. By doing this, we provide a new space for new agent instances, which hopefully will be better in the task completing than their predecessors.

### Crossover

The idea behind this step is that two strong agents reproduce to have a better offspring. In formal way, we can take certain or random parts from each of the two agents, and combine them to produce a "child", a new agent instance. 

### Mutation

Just like crossover, or sex, mutations play huge role in the evolution. Their primary goal is to make populations more variable and stochastic. Therefore, we introduce random mutations in agents, random point changes that produce a new "organism". 

All the described steps form one iteration. Typically, genetic algorithm consists of several hundred (or even more, depending on application) iterations. The algorithm stops when the terminating criterion or condition is satisfied. This condition also varies in different problems: it can be the specified number of iterations; loss function reached the plateau; performance score is higher than the specified threshold. 

The whole steps above are summarised in a figure below:

![Imgur](https://i.imgur.com/RpyBHJD.png)



## First level of the game



![Alt Text](https://i.imgur.com/qVyIWmK.gif)



Fitness function: x/t + y/t

### Required software



