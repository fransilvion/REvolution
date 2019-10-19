# Start with inPop
gliders_G0 <- population(organisms = list(Mutation(glider),  Mutation(glider),  Mutation(glider),  Mutation(glider),  Mutation(glider)),
                           fitness = c(NA, NA, NA, NA, NA) )

gliders_G1 <- gliders_G0 %>% popMutation(md = "constant", 0.2)

# Fitness
gliders_G1@fitness <- gliders_G1 %>% popFitness()

# Selection
gliders_G2 <- gliders_G1 %>% Selection()

# Mutation
gliders_gliders_G2 %>% popMutation()
