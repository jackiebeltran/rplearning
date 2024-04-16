model_1 = "
  data {

    // Metadata
    int<lower=1> Ntrials ; // number of trials
    int<lower=1> Nsubs; // number of subjects
    int newSub[Ntrials]; // indicator vector for new subject
    
    // Data
    int choices[Ntrials] ;  // choice vector of size Ntrials
    int outcomes[Ntrials] ; // outcome vector of size Ntrials
    int conditions[Ntrials] ; // condition vector of size Ntrials

  }
  
  parameters {
  
    // Group-level hyperparameters

    real<lower=0> eta_p_m; // mean of group level learning rate
    real<lower=0> eta_p_s; // sd of group level learning rate

    real<lower=0> beta_p_m; // mean of group level inverse temperature distribution
    real<lower=0> beta_p_s; // sd of group level inverse temperature distribution

    // Subject level parameters 

    real<lower=0,upper=1> eta_s[Nsubs]; // learning rates
    real<lower=0> beta_s[Nsubs];        // inverse temperatures

  }
  
  model {  
  
    real eta;   // convenience container for LR
    real beta;  // convenience container for inverse temperature
    vector[2] qvals_pos; // positive q-values
    vector[2] qvals_neg; // negative q-values
    int sub_counter; sub_counter <- 0; // subject counter

    // sample population level parameters 
    eta_p_m ~ cauchy(0,2);  
    eta_p_s ~ cauchy(0,2);

    beta_p_m ~ normal(0,10);  
    beta_p_s ~ cauchy(0,2.5);
    
    // sample subject level parameters 
    eta_s ~ beta(eta_p_m,eta_p_s);    
    beta_s ~ normal(beta_p_m,beta_p_s);
    
    for (t in 1:Ntrials) {
    
      // change subject level parameters
      if (newSub[t] == 1) {
        sub_counter <- sub_counter + 1;
        eta <- eta_s[sub_counter];
        beta <- beta_s[sub_counter];
        qvals_pos <- rep_vector(0, 2);
        qvals_neg <- rep_vector(0, 2);
      }
      
      if (conditions[t] == 1) {
        choices[t] ~ categorical_logit(beta * qvals_pos);
        qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta*(outcomes[t] - qvals_pos[choices[t]]);
        
      } else if (conditions[t] == 2) {
        choices[t] ~ categorical_logit(beta * qvals_neg);
        qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta*(outcomes[t] - qvals_neg[choices[t]]);
        
      }
      
    }
    
}
" # close quote for M1