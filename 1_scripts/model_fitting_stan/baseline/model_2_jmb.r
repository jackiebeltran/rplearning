model_2 = "
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

    real<lower=0,upper=1> eta_p_m_pos; // mean of group level + learning rate
    real<lower=0,upper=1> eta_p_s_pos; // sd of group level + learning rate

    real<lower=0,upper=1> eta_p_m_neg; // mean of group level - learning rate
    real<lower=0,upper=1> eta_p_s_neg; // sd of group level - learning rate

    real<lower=0> beta_p_m; // mean of group level inverse temperature distribution
    real<lower=0> beta_p_s; // sd of group level inverse temperature distribution

    // Subject level parameters 

    real<lower=0,upper=1> eta_s_pos[Nsubs]; // + learning rates
    real<lower=0,upper=1> eta_s_neg[Nsubs]; // - learning rates
    real<lower=0> beta_s[Nsubs];        // inverse temperatures

  }

  model {
    
    real eta_pos;
    real eta_neg;
    real beta;
    vector[2] qvals_pos;
    vector[2] qvals_neg;
    int sub_counter; sub_counter <- 0;

    // sample population level parameters
    eta_p_m_pos ~ cauchy(0,2);
    eta_p_s_pos ~ cauchy(0,2);

    eta_p_m_neg ~ cauchy(0,2);
    eta_p_s_neg ~ cauchy(0,2);

    beta_p_m ~ normal(0,10);  
    beta_p_s ~ cauchy(0,2.5);
    
    // sample subject level parameters
    eta_s_pos ~ beta(eta_p_m_pos,eta_p_s_pos);
    eta_s_neg ~ beta(eta_p_m_neg,eta_p_s_neg);
    beta_s ~ normal(beta_p_m,beta_p_s);

    for (t in 1:Ntrials) {
    
    
      // change subject level parameters
      if (newSub[t] == 1) {

        sub_counter <- sub_counter + 1;
        eta_pos <- eta_s_pos[sub_counter];
        eta_neg <- eta_s_neg[sub_counter];
        beta <- beta_s[sub_counter];
        qvals_pos <- rep_vector(0, 2);
        qvals_neg <- rep_vector(0, 2);

      }
    
      if (conditions[t] == 1) {
        
        choices[t] ~ categorical_logit(beta * qvals_pos);
        qvals_pos[choices[t]] <- qvals_pos[choices[t]] + eta_pos*(outcomes[t] - qvals_pos[choices[t]]);
      
      } else if (conditions[t] == 2) {
        
        choices[t] ~ categorical_logit(beta * qvals_neg);
        qvals_neg[choices[t]] <- qvals_neg[choices[t]] + eta_neg*(outcomes[t] - qvals_neg[choices[t]]);

      }
    }
}
" # close quote for M2