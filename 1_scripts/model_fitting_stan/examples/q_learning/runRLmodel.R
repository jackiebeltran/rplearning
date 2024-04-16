# RStan script for a simple reinforcement learning model of choice data 
# from a two-armed bandit with binary rewards
# AR, 8/11/2015
# 
# To-do: 
# Work out population learning rate parametrization
# Compute marginal likelhood of heldout data 

# Preliminaries
rm(list = ls()) # clear workspace
setwd('/Users/angelaradulescu/Dropbox/Radulescu Lab/People/Jackie Beltran/RP_Learning/1_scripts/analysis/q_learning_stan')

# Load dependencies 
library(rstan)
library(ggplot2)
library(reshape2)
library(tictoc)

# Data
dat = read.csv('data.csv', header = TRUE) 

# Which subjects are we training on
subs = c(1:19)

# Make training dataset 
datTrain <- dat[dat$sub %in% subs, ]

# Convert data into the format Stan likes to see 
sub = datTrain$sub; 
Nsubs = length(unique(sub));
Ntrials = length(datTrain$c);
choices = datTrain$c;
outcomes = datTrain$r;
newSub <- c(1,diff(datTrain$sub)); newSub[newSub!=0] = 1;

dataList = list(
  Ntrials = Ntrials ,
  Nsubs = Nsubs ,
  newSub = newSub ,
  sub = sub ,
  choices = choices-1 ,
  outcomes = outcomes
) # put into a list

tic()
# Specify model
modelString = "
  data {
    int<lower=1> Ntrials ; // number of trials
    int<lower=1> Nsubs; // number of subjects
    int newSub[Ntrials]; // indicator vector for new subject
    int choices[Ntrials] ; // choice vector of size Ntrials
    int outcomes[Ntrials] ; // outcome vector of size Ntrials
  }

  parameters {
  
    // population temperatures
    real<lower=0> beta_p_m;
    real<lower=0> beta_p_s;

    // subject learning rates
    real<lower=0,upper=1> eta_s[Nsubs];
  
    // subject temperatures
    real<lower=0> beta_s[Nsubs];

  }

  model {

    real eta;
    real beta;
    real qvals[2];
    int sub_counter; sub_counter <- 0;

    // sample population level parameters
    beta_p_m ~ normal(0,10);  
    beta_p_s ~ cauchy(0,2.5);

    // sample subject level parameters
    eta_s ~ beta(1,1);
    beta_s ~ normal(beta_p_m,beta_p_s);

    for (t in 1:Ntrials) {
    
      // change subject level parameters
      if (newSub[t] == 1) {
        sub_counter <- sub_counter + 1;
        eta <- eta_s[sub_counter];
        beta <- beta_s[sub_counter];
        for (i in 1:2) {qvals[i] <- 0;}
      }
    
      choices[t] ~ bernoulli_logit(beta * (qvals[2] - qvals[1]));
      qvals[choices[t]+1] <- qvals[choices[t]+1]*(1-eta) + outcomes[t];

    }

  }
" # close quote for modelString

# Translate model to C++ 
stanDso <- stan_model( model_code=modelString ) 
toc()

tic()
# Generate posterior sample:
stanFit <- sampling( object=stanDso , 
                     data = dataList , 
                     chains = 2 ,
                     iter = 2000 ,
                     warmup = 1000
                    )
toc()

# Plot chains
traceplot(stanFit, pars = c("beta_p_m", "beta_p_s"), inc_warmup = TRUE)

# Plot posteriors
beta_p_m <- extract(stanFit, 'beta_p_m')
beta_p_m <- unlist(beta_p_m, use.names=FALSE)
x<-data.frame(beta_p_m)
ggplot(x, aes(beta_p_m)) +
  geom_density()

beta_p_s <- extract(stanFit, 'beta_p_s')
beta_p_s <- unlist(beta_p_s, use.names=FALSE)
x<-data.frame(beta_p_s)
ggplot(x, aes(beta_p_s)) +
  geom_density()



