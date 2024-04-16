model_2 = "
  data {

    // Metadata
    int<lower=1> Ntrials ; // number of trials
    int<lower=1> Nsubs; // number of subjects
    int newSub[Ntrials]; // indicator vector for new subject
    int<lower=1, upper=2> group[Ntrials]; // Group variable (1 for MDD, 2 for HC)
    
    // Data
    int choices[Ntrials] ;  // choice vector of size Ntrials
    int outcomes[Ntrials] ; // outcome vector of size Ntrials
    int conditions[Ntrials] ; // condition vector of size Ntrials

  }

  parameters {
  
    // Group-level hyperparameters

    real<lower=0,upper=1> eta_p_m_pos_MDD; // mean of group level + learning rate
    real<lower=0,upper=1> eta_p_s_pos_MDD; // sd of group level + learning rate

    real<lower=0,upper=1> eta_p_m_neg_MDD; // mean of group level - learning rate
    real<lower=0,upper=1> eta_p_s_neg_MDD; // sd of group level - learning rate

    real<lower=0,upper=1> eta_p_m_pos_HC; // mean of group level + learning rate
    real<lower=0,upper=1> eta_p_s_pos_HC; // sd of group level + learning rate

    real<lower=0,upper=1> eta_p_m_neg_HC; // mean of group level - learning rate
    real<lower=0,upper=1> eta_p_s_neg_HC; // sd of group level - learning rate

    real<lower=0> beta_p_m_MDD; // mean of group level inverse temperature distribution
    real<lower=0> beta_p_s_MDD; // sd of group level inverse temperature distribution

    real<lower=0> beta_p_m_HC; // mean of group level inverse temperature distribution
    real<lower=0> beta_p_s_HC; // sd of group level inverse temperature distribution

    // Subject level parameters 
    
    real<lower=0,upper=1> eta_s_pos_HC[Nsubs]; // + learning rates
    real<lower=0,upper=1> eta_s_neg_HC[Nsubs]; // - learning rates

    real<lower=0,upper=1> eta_s_pos_MDD[Nsubs]; // + learning rates
    real<lower=0,upper=1> eta_s_neg_MDD[Nsubs]; // - learning rates

    real<lower=0> beta_s_MDD[Nsubs];        // inverse temperatures
    real<lower=0> beta_s_HC[Nsubs];        // inverse temperatures

  }

  model {
    
    real eta_pos_HC;
    real eta_pos_MDD;
    real eta_neg_HC;
    real eta_neg_MDD;
    real beta_HC;
    real beta_MDD;
    vector[2] qvals;
    int sub_counter; sub_counter <- 0;

    // sample population level parameters
    eta_p_m_pos_HC ~ cauchy(0,2);
    eta_p_s_pos_HC ~ cauchy(0,2);
    
    eta_p_m_pos_MDD ~ cauchy(0,2);
    eta_p_s_pos_MDD ~ cauchy(0,2);

    eta_p_m_neg_HC ~ cauchy(0,2);
    eta_p_s_neg_HC ~ cauchy(0,2);

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

    for (t in 1:Ntrials) {
    
      if (group[t] == 2) { 
    
        // change subject level parameters
        if (newSub[t] == 1) {
  
          sub_counter <- sub_counter + 1;
          eta_pos_HC <- eta_s_pos_HC[sub_counter];
          eta_neg_HC <- eta_s_neg_HC[sub_counter];
          beta_HC <- beta_s_HC[sub_counter];
          qvals <- rep_vector(0, 2);
  
        }
      
        if (conditions[t] == 1) {
          
          choices[t] ~ categorical_logit(beta_HC * qvals);
          qvals[choices[t]] <- qvals[choices[t]] + eta_pos_HC*(outcomes[t] - qvals[choices[t]]);
        
        } else if (conditions[t] == 2) {
          
          choices[t] ~ categorical_logit(beta_HC * qvals);
          qvals[choices[t]] <- qvals[choices[t]] + eta_neg_HC*(outcomes[t] - qvals[choices[t]]);
  
        }
      }
    
    if (group[t] == 1) {
      
      // change subject level parameters
      if (newSub[t] == 1) {
      
        sub_counter <- sub_counter + 1;
        eta_pos_MDD <- eta_s_pos_MDD[sub_counter];
        eta_neg_MDD <- eta_s_neg_MDD[sub_counter];
        beta_MDD <- beta_s_MDD[sub_counter];
        qvals <- rep_vector(0, 2);
      
      }
      
      if (conditions[t] == 1) {
        
        choices[t] ~ categorical_logit(beta_MDD * qvals);
        qvals[choices[t]] <- qvals[choices[t]] + eta_pos_MDD*(outcomes[t] - qvals[choices[t]]);
      
      } else if (conditions[t] == 2) {
        
        choices[t] ~ categorical_logit(beta_MDD * qvals);
        qvals[choices[t]] <- qvals[choices[t]] + eta_neg_MDD*(outcomes[t] - qvals[choices[t]]);
      
      }
    }
    }
}
" # close quote for M2