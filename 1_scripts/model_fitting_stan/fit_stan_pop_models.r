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
#setwd('/sc/arion/projects/DAC_Murrough/K01_VTA/users/beltrj11/scripts/modeling/')

# Set output directory 
output_file = ('/Users/jackiebeltran/Documents/stan/model_fitting_stan/')

# Load data
data_file = '/Users/jackiebeltran/Documents/stan/model_fitting_stan/data_N76.csv'
#data_file = '/sc/arion/projects/DAC_Murrough/K01_VTA/users/beltrj11/scripts/modeling/data_N76.csv'
data = read.csv(data_file, header = TRUE) 

# Load model
# source('/Users/jackiebeltran/Documents/stan/model_fitting_stan/model2_pop_ncp.R')
source('/Users/jackiebeltran/Documents/stan/model_fitting_stan/ar_jmb_model2_pop.r')
#source('/sc/arion/projects/DAC_Murrough/K01_VTA/users/beltrj11/scripts/modeling/jmb_model2_pop.r')

### FORMAT DATA

# Convert data into the format Stan likes to see
sub = data$sub_ID; 
Nsubs_HC = length(unique(as.character(sub[startsWith(as.character(sub), "5")])))
Nsubs_MDD = length(unique(as.character(sub[startsWith(as.character(sub), "4")])))
Ntrials = length(data$actions);
choices = data$actions;
outcomes = data$rewards;
condition = data$condition;
group = data$group;
newSub <- c(1,diff(data$sub_ID)); newSub[newSub!=0] = 1; # identify row where new subj data starts

# Put into a list
data_list = list(
  Ntrials = Ntrials,
  Nsubs_HC = Nsubs_HC,
  Nsubs_MDD = Nsubs_MDD,
  newSub = newSub,
  sub = sub,
  choices = choices,
  outcomes = outcomes,
  conditions = condition,
  group = as.integer(factor(group, levels = c("MDD", "HC")))
)

### FIT MODEL
# i think using stan_model and sampling is a two step process in comparison to fx stan()

# Translate model to C++
tic() # start timer 
stanDso_M2_pop <- stan_model(model_code=model_2_pop) # positive hier model
toc()

# Model 2 (pop)
tic()
model_fit_M2_pop <- sampling(object=stanDso_M2_pop ,
                             data = data_list ,
                             chains = 4 ,
                             iter = 5500 ,
                             warmup = 3000,
                             control = list(adapt_delta = 0.95))
toc()

# Model 2 (population level)

## plot distributions for parameters of interest

posterior_M2_pop <- as.matrix(model_fit_M2_pop)

## Visualize results with IDE
my_sso_M2_pop <- launch_shinystan(model_fit_M2_pop)

save.image(file = paste0(output_file, "model2_jmb_ar_good.RData"))

## plot
plot_title <- ggtitle("Posterior distributions",
                      "with medians and 95% intervals -- Model 2 pop")
mcmc_areas(posterior_M2_pop,
           pars = c("eta_p_m_pos_MDD", "eta_p_m_pos_HC"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40))

mcmc_areas(posterior_M2_pop,
           pars = c("eta_p_m_neg_MDD", "eta_p_m_neg_HC"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40)) + xlim(0, 0.8)


mcmc_areas(posterior_M2_pop,
           pars = c("beta_p_m_HC", "beta_p_m_MDD"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40))

mcmc_areas(posterior_M2_pop,
           pars = c("RAW_eta_p_m_pos_MDD"),
           prob = 0.95) + plot_title + theme(text = element_text(size=40))

