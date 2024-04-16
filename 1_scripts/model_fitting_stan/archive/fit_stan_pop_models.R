library(rstan)
library(shinystan)
library(here)
library(tictoc)
library(gridExtra)
library(bayesplot)
library(ggplot2)

### PRELIMINARIES

# Clear workspace
rm(list=ls())

# Set working directory
setwd('/Users/jackiebeltran/Documents/stan/model_fitting_stan/')
# setwd('/Users/angelaradulescu/Dropbox/Radulescu Lab/People/Jackie Beltran/RP_Learning/1_scripts/analysis/')

# Load data
data_file = '/Users/jackiebeltran/Documents/stan/model_fitting_stan/data_N76.csv'
# data_file = '/Users/angelaradulescu/Dropbox/Radulescu Lab/People/Jackie Beltran/RP_Learning/0_data/stan/data_N76.csv'
data = read.csv(data_file, header = TRUE) 

# Load models
source('/Users/jackiebeltran/Documents/stan/model_fitting_stan/model1_pop.r') 
#source('/Users/jackiebeltran/Documents/stan/model_fitting_stan/model2_pop.r')


### FORMAT DATA

# Convert data into the format Stan likes to see
sub = data$sub_ID; 
Nsubs = length(unique(sub));
Ntrials = length(data$actions);
choices = data$actions;
outcomes = data$rewards;
condition = data$condition;
group = data$group;
newSub <- c(1,diff(data$sub_ID)); newSub[newSub!=0] = 1; # identify row where new subj data starts

# Put into a list
data_list = list(
  Ntrials = Ntrials,
  Nsubs = Nsubs,
  newSub = newSub,
  sub = sub,
  choices = choices,
  outcomes = outcomes,
  conditions = condition,
  group = as.integer(factor(group, levels = c("MDD", "HC")))
)

### FIT MODEL

# Translate model to C++
tic() # start timer 
stanDso_M1_pop <- stan_model(model_code=model_1_pop)
#stanDso_M2_pop <- stan_model(model_code=model_2_pop)
toc()

# generating posterior sample

## MODEL 1 - population level

tic()
model_fit_M1_pop <- sampling(object=stanDso_M1_pop ,
                             data = data_list ,
                             chains = 2 ,
                             iter = 5000 ,
                             warmup = 1000
)
toc()

## Visualize results with IDE
my_sso_M1_pop <- launch_shinystan(model_fit_M1_pop)

# Plot distributions for parameters of interest
posterior_M1_pop <- as.matrix(model_fit_M1_pop)

## plot
plot_title <- ggtitle("Posterior distributions",
                      "with medians and 95% intervals")
mcmc_areas(posterior_M1_pop,
           pars = c("eta_p_m_HC", "eta_p_m_MDD"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40)) + xlim(0,1.5)

mcmc_areas(posterior_M1_pop,
           pars = c("beta_p_m_HC", "beta_p_m_MDD"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40)) 


## MODEL 2 - population level

tic()
model_fit_M2_pop <- sampling(object=stanDso_M2_pop ,
                             data = data_list ,
                             chains = 2 ,
                             iter = 5000 ,
                             warmup = 1000
)
toc()

## Visualize results with IDE
my_sso_M2_pop <- launch_shinystan(model_fit_M2_pop)

## plot distributions for parameters of interest

posterior_M2_pop <- as.matrix(model_fit_M2_pop)

## plot
plot_title <- ggtitle("Posterior distributions",
                      "with medians and 95% intervals")
mcmc_areas(posterior_M2_pop,
           pars = c("eta_p_m_pos_MDD", "eta_p_m_pos_HC"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40)) + xlim(0, 0.8)

mcmc_areas(posterior_M2_pop,
           pars = c("beta_p_m_MDD", "beta_p_m_HC"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40)) 

#### LEFT HERE

## Extract log-likelihood matrix
log_likelihood <- read_cmdstan_csv(
  files=fit$output_files(),
  variables = c("choice_log_lik"),
  sampler_diagnostics = NULL,
  format = getOption("cmdstanr_draws_format", "draws_df")
)

## get WAIC for model
ll_samples <- as.matrix(log_likelihood$post_warmup_draws[, 1:log_likelihood$metadata$stan_variable_dims$choice_log_lik,])
model_WAIC <- loo::waic(ll_samples)

