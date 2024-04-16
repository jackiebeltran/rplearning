##### Set-up #####

# Clear workspace
rm(list=ls())

# Import libraries
library(rstan)
library(shinystan)
library(here)
library(tictoc)
library(loo)
library(gridExtra)
library(bayesplot)
library(ggplot2)

tic()

# Specify number of samples to take, length of warm-up period, and number of chains
n_samples <- 5000
n_warmup <- 2500
n_chains <- 4

# Specify model to sample
model_to_sample = 'model_2'

# Specify paths
model_dir = '/Users/angelaradulescu/Dropbox/Radulescu Lab/People/Jackie Beltran/RP_Learning/1_scripts/model_fitting_stan/'
model_file = paste(model_to_sample, '.stan', sep="")
model_path = paste(model_dir, model_file, sep="")
samples_path = paste(model_dir, 'samples/', model_to_sample, '.Rdata', sep="")

##### Format data for Stan #####

# Load data
data_file = '/Users/angelaradulescu/Dropbox/Radulescu Lab/People/Jackie Beltran/RP_Learning/0_data/stan/data_N75.csv'
data = read.csv(data_file, header = TRUE) 

# Initialize variables
sub = data$sub_ID; 
Nsubs = length(unique(sub));
Ntrials = length(data$actions);
choices = data$actions;
outcomes = data$rewards;
condition = data$condition;
group = data$group;
newSub <- c(1,diff(data$sub_ID)); newSub[newSub!=0] = 1;

# Put into a list
stan_data = list(
  Ntrials = Ntrials,
  Nsubs = Nsubs,
  newSub = newSub,
  sub = sub,
  choices = choices,
  outcomes = outcomes,
  conditions = condition,
  group = group
)

##### Sample with Stan #####

# Set parallel options
rstan_options(auto_write = TRUE)
options(mc.cores=min(n_chains, parallel::detectCores()), buildtools.check = function(action) TRUE )

# Draw samples and save them to disk
samples <- stan(file = model_path,
            data = stan_data,
            save_warmup=F,
            # init = initVals,
            # pars=model_to_sample$parameters,
            iter=n_samples,
            chains=n_chains,
            thin=1,
            # control = list(max_treedepth = 10),
            warmup = n_warmup  # Default = iter/2
            # seed = 123  # Setting seed; Default is random seed
)

model_samples <- extract(samples) # this gets a matrix of samples by datapoints
save("model_samples", file=samples_path)
