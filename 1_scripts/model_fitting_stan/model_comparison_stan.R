##### Set-up #####

# Clear workspace
rm(list=ls())

# Import libraries
library(here)                                                                                       # for specifying relative paths
library(tictoc)                                                                                     # for timing
library(rstan)
library(loo)
library(bayesplot)
library(matrixStats)
library(MASS)

# List models to compare 
models <- list(
    "model_1",
    "model_2"
)

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
    
# Set up containers
WAIC <- vector(length=length(models))
lppd <- vector(length=length(models)) # log-posterior predictive density
p <- vector(length=length(models)) # effective complexity
WAIC_p <- matrix(nrow=Nsubs, ncol=length(models))
dWAIC_p <- matrix(nrow=Nsubs, ncol=length(models))
lppd_p <- matrix(nrow=Nsubs, ncol=length(models))
p_p <- matrix(nrow=Nsubs, ncol=length(models))
WAIC_vec <- matrix(nrow=length(models),ncol=Ntrials) # This is meant to store WAIC per trial
WAIC_se <- vector(length=length(models))

##### Loop over models #####
for (m in 1:length(models)){
    
    # specify model to sample (as specified in model library)
    sampled_model <- models[[m]]
    sampled_model_fn <- paste(sampled_model, '.Rdata', sep="")
    
    # read in samples
    load(file=here("1_scripts","model_fitting_stan", "samples", sampled_model_fn))
    
    # extract likelihood per sample and choice (AR: choice = trial?), and calculate WAIC
    # model_samples$choice_log_lik - row: samples, column: per trial log likelihood
    lppd[m] <- sum( log( colMeans( exp( model_samples$choice_log_lik ) ) ) ) # average likelihood across samples
    p[m] <- sum( apply( model_samples$choice_log_lik, MARGIN=2, FUN=var ) ) # variance of log likelihood across samples
    WAIC[m] <- -2 * (lppd[m] - p[m])
    WAIC_vec[m,] <- -2 * (log( colMeans( exp( model_samples$choice_log_lik ) ) )  - apply( model_samples$choice_log_lik, MARGIN=2, FUN=var ) )    
    WAIC_se[m] <- sqrt(length(WAIC_vec[m,]) * var(WAIC_vec[m,]))

    # use loo package # potential to-do, use loo here instead of the computation by hand
    # model_WAIC <- waic(model_samples$choice_log_lik)
    # WAIC[m] <- model_WAIC$estimates["waic",1]
    
    # loop over participants to get a participant-specific WAIC
    for (i in 1:Nsubs){
        
        print(sprintf("Checking model %.0f of %.0f, participant %.0f of %.0f", m, length(models), i, Nsubs))
        
        p_ix <- which(stan_data$subj_ix == i)
        
        lppd_p[i,m] <- sum( log( colMeans( exp( model_samples$choice_log_lik[,p_ix] ) ) ) )
        p_p[i,m] <- sum( apply( model_samples$choice_log_lik[,p_ix], MARGIN=2, FUN=var ) )
        WAIC_p[i,m] <- -2 * (lppd_p[i,m] - p_p[i,m])
        
        # # use loo package
        # model_WAIC_p <- waic(model_samples$choice_log_lik[,p_ix])
        # WAIC_p[i,m] <- model_WAIC_p$estimates["waic",1]
        
        ### To summarize subject-level parameters from the posterior for individual differences, 
        # just take median of samples per participant; when plotting, show full distribution w/ median
        # hist(model_samples$beta[ ,p])
        # median(model_samples$beta[ ,1])
    }
    
}

for (i in 1:Nsubs){
    dWAIC_p[i,] <- WAIC_p[i,] - min(WAIC_p[i,])
}

which_best_WAIC <- which(WAIC == min(WAIC))
which_best_WAIC_p <- apply(WAIC_p, MARGIN=1, FUN=function(x){return(which(x == min(x)))})
dWAIC <- WAIC - WAIC[which_best_WAIC]
dWAIC_se <- apply(WAIC_vec, MARGIN=1, FUN=function(x, which_best_WAIC){return(sqrt(length(x - WAIC_vec[which_best_WAIC,]) * var(x - WAIC_vec[which_best_WAIC,])))}, which_best_WAIC)
akaike_weights <- exp(-dWAIC/2) / sum(exp(-dWAIC/2))
akaike_weights_p <- t(apply(dWAIC_p, MARGIN=1, FUN=function(x){return(exp(-(x)/2) / sum(exp(-(x)/2)))}))

model_comparison_summary <- list(
    "WAIC" = WAIC,
    "WAIC_p" = WAIC_p,
    "which_best_WAIC" = which_best_WAIC,
    "which_best_WAIC_p" = which_best_WAIC_p,
    "dWAIC" = dWAIC, # if two models are within 1-2 SEs of each other, they are statistically equivalent: posts on Stan forums 
    "dWAIC_p" = dWAIC_p,
    "WAIC_se" = WAIC_se,
    "dWAIC_se" = dWAIC_se,
    "akaike_weights" = akaike_weights,
    "akaike_weights_p" = akaike_weights_p
)

print(model_comparison_summary$which_best_WAIC)
print(model_comparison_summary$dWAIC)
print(model_comparison_summary$dWAIC_se)

# save model comparison statistics to file
save(file=here("stan", "model_comparison.Rdata"), list=c("model_comparison_summary", "model_names"))
