library(rstan)
library(shinystan)
library(here)
library(tictoc)
library(gridExtra)
library(bayesplot)
library(ggplot2)

rm(list=ls())

### 8 schools demo 
# https://cran.r-project.org/web/packages/rstan/vignettes/rstan.html

schools_data <- list(
  J = 8,
  y = c(28,  8, -3,  7, -1,  1, 18, 12),
  sigma = c(15, 10, 16, 11,  9, 11, 10, 18)
)

fit1 <- stan(
  file = "schools.stan",  # Stan program
  data = schools_data,    # named list of data
  chains = 4,             # number of Markov chains
  warmup = 1000,          # number of warmup iterations per chain
  iter = 2000,            # total number of iterations per chain
  cores = 1,              # number of cores (could use one per chain)
  refresh = 0             # no progress shown
  )

print(fit1, pars=c("theta", "mu", "tau", "lp__"), probs=c(.1,.5,.9))