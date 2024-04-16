data {

  // Metadata
  int<lower=1> Ntrials ; // number of trials
  int<lower=1> Nsubs_HC; // number of HC subjects
  int<lower=1> Nsubs_MDD; // number of MDD subjects
  int newSub[Ntrials]; // indicator vector for new subject
  int<lower=1, upper=2> group[Ntrials]; // Group variable (1 for MDD, 2 for HC)
    
  // Data
  int choices[Ntrials] ;  // choice vector of size Ntrials
  int outcomes[Ntrials] ; // outcome vector of size Ntrials
  int conditions[Ntrials] ; // condition vector of size Ntrials

}

parameters {
  // Group-level hyperparameters

  real<lower=0,upper=1> eta_p_m_pos_HC; // mean of group level + learning rate
  real<lower=0,upper=1> eta_p_s_pos_HC; // sd of group level + learning rate

  real<lower=0,upper=1> eta_p_m_neg_HC; // mean of group level - learning rate
  real<lower=0,upper=1> eta_p_s_neg_HC; // sd of group level - learning rate
  
  real<lower=0,upper=1> eta_p_m_pos_MDD; // mean of group level + learning rate
  real<lower=0,upper=1> eta_p_s_pos_MDD; // sd of group level + learning rate
  
  real<lower=0,upper=1> eta_p_m_neg_MDD; // mean of group level - learning rate
  real<lower=0,upper=1> eta_p_s_neg_MDD; // sd of group level - learning rate
  
  real<lower=0> beta_p_m_MDD; // mean of group level inverse temperature distribution
  real<lower=0> beta_p_s_MDD; // sd of group level inverse temperature distribution
  
  real<lower=0> beta_p_m_HC; // mean of group level inverse temperature distribution
  real<lower=0> beta_p_s_HC; // sd of group level inverse temperature distribution
  
  // Subject level parameters 
  
  real<lower=0,upper=1> eta_s_pos_HC[Nsubs_HC]; // + learning rates
  real<lower=0,upper=1> eta_s_neg_HC[Nsubs_HC]; // - learning rates
  
  real<lower=0,upper=1> eta_s_pos_MDD[Nsubs_MDD]; // + learning rates
  real<lower=0,upper=1> eta_s_neg_MDD[Nsubs_MDD]; // - learning rates
  
  real<lower=0> beta_s_HC[Nsubs_HC];        // inverse temperatures
  real<lower=0> beta_s_MDD[Nsubs_MDD];        // inverse temperatures

}

model {
  real eta_pos_HC;
  real eta_neg_HC;
  real eta_pos_MDD;
  real eta_neg_MDD;
  real beta_HC;
  real beta_MDD;
  vector[2] qvals_pos;
  vector[2] qvals_neg;
  int sub_counter_HC; sub_counter_HC <- 0;
  int sub_counter_MDD; sub_counter_MDD <- 0;
  
  // sample population level parameters
  eta_p_m_pos_HC ~ cauchy(0,2);
  eta_p_s_pos_HC ~ cauchy(0,2);
  
  eta_p_m_neg_HC ~ cauchy(0,2);
  eta_p_s_neg_HC ~ cauchy(0,2);
  
  eta_p_m_pos_MDD ~ cauchy(0,2);
  eta_p_s_pos_MDD ~ cauchy(0,2);
  
  eta_p_m_neg_MDD ~ cauchy(0,2);
  eta_p_s_neg_MDD ~ cauchy(0,2);
  
  beta_p_m_HC ~ normal(0,10);
  beta_p_s_HC ~ cauchy(0,2.5);
  beta_p_m_MDD ~ normal(0,10);  
  beta_p_s_MDD ~ cauchy(0,2.5);
  
  // sample subject level parameters
  eta_s_pos_HC ~ beta(eta_p_m_pos_HC,eta_p_s_pos_HC);
  eta_s_neg_HC ~ beta(eta_p_m_neg_HC,eta_p_s_neg_HC);
  
  eta_s_pos_MDD ~ beta(eta_p_m_pos_MDD,eta_p_s_pos_MDD);
  eta_s_neg_MDD ~ beta(eta_p_m_neg_MDD,eta_p_s_neg_MDD);
  
  beta_s_HC ~ normal(beta_p_m_HC,beta_p_s_HC);
  beta_s_MDD ~ normal(beta_p_m_MDD,beta_p_s_MDD);
  
  // Ntrials is the length of the actions column, such that N=76 * 90
  
  for (t in 1:Ntrials) {
    
    if (group[t] == 2) {
        
        // change subject level parameters
        if (newSub[t] == 1) {
  
          sub_counter_HC <- sub_counter_HC + 1;
          eta_pos_HC <- eta_s_pos_HC[sub_counter_HC];
          eta_neg_HC <- eta_s_neg_HC[sub_counter_HC];
          beta_HC <- beta_s_HC[sub_counter_HC];
          qvals_pos <- rep_vector(0, 2);
          qvals_neg <- rep_vector(0, 2);
  
        }
      
        if (conditions[t] == 1) {
          
          choices[t] ~ categorical_logit(beta_HC * qvals_pos);
          qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta_pos_HC*(outcomes[t] - qvals_pos[choices[t]]);
        
        } else if (conditions[t] == 2) {
          
          choices[t] ~ categorical_logit(beta_HC * qvals_neg);
          qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta_neg_HC*(outcomes[t] - qvals_neg[choices[t]]);
  
        }
      }
    
    if (group[t] == 1) {
        
        // change subject level parameters
        if (newSub[t] == 1) {
            
            sub_counter_MDD <- sub_counter_MDD + 1;
            eta_pos_MDD <- eta_s_pos_MDD[sub_counter_MDD];
            eta_neg_MDD <- eta_s_neg_MDD[sub_counter_MDD];
            beta_MDD <- beta_s_MDD[sub_counter_MDD];
            qvals_pos <- rep_vector(0, 2);
            qvals_neg <- rep_vector(0, 2);
      
        }
        
        if (conditions[t] == 1) {
            
            choices[t] ~ categorical_logit(beta_MDD * qvals_pos);
            qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta_pos_MDD*(outcomes[t] - qvals_pos[choices[t]]);
            
        } else if (conditions[t] == 2) {
            choices[t] ~ categorical_logit(beta_MDD * qvals_neg);
            qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta_neg_MDD*(outcomes[t] - qvals_neg[choices[t]]);
      
        }
      }
    }
}

generated quantities {
    
  // Initialise variables
  real eta_pos_HC;
  real eta_neg_HC;
  real eta_pos_MDD;
  real eta_neg_MDD;
  real beta_HC;
  real beta_MDD;
  vector[2] qvals_pos;
  vector[2] qvals_neg;
  vector[2] qvals_neu;
  int sub_counter_HC; sub_counter_HC <- 0;
  int sub_counter_MDD; sub_counter_MDD <- 0;
  
  // Initialise quantities to be monitored
  real choice_log_lik[Ntrials];
  real choice_pred[Ntrials];
  real RPE[Ntrials];

  for (t in 1:Ntrials) {
    
    if (group[t] == 2) {
        
        // change subject level parameters
        if (newSub[t] == 1) {
            sub_counter_HC <- sub_counter_HC + 1;
            eta_pos_HC <- eta_s_pos_HC[sub_counter_HC];
            eta_neg_HC <- eta_s_neg_HC[sub_counter_HC];
            beta_HC <- beta_s_HC[sub_counter_HC];
            qvals_pos <- rep_vector(0, 2);
            qvals_neg <- rep_vector(0, 2);
            qvals_neu <- rep_vector(0.5, 2);
        }
      
        if (conditions[t] == 1) {

            // Record likelihood 
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_HC * qvals_pos);
            
            // Predict choice given current model 
            choice_pred[t] = categorical_logit_rng (beta_HC * qvals_pos);

            // Update values
            RPE[t] = outcomes[t] - qvals_pos[choices[t]];     
            qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta_pos_HC*(outcomes[t] - qvals_pos[choices[t]]);
        
        } else if (conditions[t] == 2) {

            // Record likelihood
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_HC * qvals_neg);

            // Predict choice given current model
            choice_pred[t] = categorical_logit_rng (beta_HC * qvals_neg);

            // Update values 
            RPE[t] = outcomes[t] - qvals_neg[choices[t]];     
            qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta_neg_HC*(outcomes[t] - qvals_neg[choices[t]]);

        } else if (conditions[t] == 3) {
            
            // Record likelihood
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_HC * qvals_neu);
            
            // Predict choice given current model
            choice_pred[t] = categorical_logit_rng (beta_HC * qvals_neu);
            
            // Record RPE
            RPE[t] = 0;

        }
 
      }
    
    if (group[t] == 1) {
        
        // change subject level parameters
        if (newSub[t] == 1) {
            
            sub_counter_MDD <- sub_counter_MDD + 1;
            eta_pos_MDD <- eta_s_pos_MDD[sub_counter_MDD];
            eta_neg_MDD <- eta_s_neg_MDD[sub_counter_MDD];
            beta_MDD <- beta_s_MDD[sub_counter_MDD];
            qvals_pos <- rep_vector(0, 2);
            qvals_neg <- rep_vector(0, 2);
            qvals_neu <- rep_vector(0.5, 2);
      
        }
        
        if (conditions[t] == 1) {

            // Record likelihood 
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_MDD * qvals_pos);
            
            // Predict choice given current model 
            choice_pred[t] = categorical_logit_rng (beta_MDD * qvals_pos);

            // Update values
            RPE[t] = outcomes[t] - qvals_pos[choices[t]];     
            qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta_pos_MDD*(outcomes[t] - qvals_pos[choices[t]]);
        
        } else if (conditions[t] == 2) {

            // Record likelihood
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_MDD * qvals_neg);

            // Predict choice given current model
            choice_pred[t] = categorical_logit_rng (beta_MDD * qvals_neg);

            // Update values 
            RPE[t] = outcomes[t] - qvals_neg[choices[t]];     
            qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta_neg_MDD*(outcomes[t] - qvals_neg[choices[t]]);

        } else if (conditions[t] == 3) {
            
            // Record likelihood
            choice_log_lik[t] = categorical_logit_lpmf(choices[t] | beta_MDD * qvals_neu);
            
            // Predict choice given current model
            choice_pred[t] = categorical_logit_rng (beta_MDD * qvals_neu);
            
            // Record RPE
            RPE[t] = 0;

        }
 
    }
  }
}