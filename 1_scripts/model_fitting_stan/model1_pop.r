model_1_pop = "
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
  
    // Group-level (population-level) hyperparameters 
    
    real<lower=0> eta_p_m_HC; // mean of HC learning rate
    real<lower=0> eta_p_m_MDD; // mean of MDD learning rate
    
    real<lower=0> eta_p_s_HC; // sd of HC learning rate
    real<lower=0> eta_p_s_MDD; // sd of MDD learning rate
    
    real<lower=0> beta_p_m_HC; // mean of HC inverse temperature distribution
    real<lower=0> beta_p_m_MDD; // mean of MDD inverse temperature distribution
    
    real<lower=0> beta_p_s_HC; // sd of HC inverse temperature distribution
    real<lower=0> beta_p_s_MDD; // sd of MDD inverse temperature distribution
    
    // Subject level parameters 
    
    real<lower=0,upper=1> eta_s_HC[Nsubs]; // HC learning rates
    real<lower=0,upper=1> eta_s_MDD[Nsubs]; // MDD learning rates
    
    real<lower=0> beta_s_HC[Nsubs];        // HC inverse temperatures
    real<lower=0> beta_s_MDD[Nsubs];        // MDD inverse temperatures

  }
  
  model {
  
    // Initialize variables

    real eta_HC;   // convenience container for sample HC LR
    real eta_MDD; //  convenience container for sample MDD LR
    
    real beta_HC;  // convenience container for sample HC inverse temperature
    real beta_MDD;  // convenience container for sample MDD inverse temperature
    
    vector[2] qvals; // q-values
    int sub_counter; sub_counter <- 0; // subject counter

    // sample population level parameters (defining the distributions from which to draw mean and std)
    eta_p_m_HC ~ cauchy(0,2);  
    eta_p_m_MDD ~ cauchy(0,2); 
    eta_p_s_HC ~ cauchy(0,2);
    eta_p_s_MDD ~ cauchy(0,2);

    beta_p_m_HC ~ normal(0,10);  
    beta_p_m_MDD ~ normal(0,10);  
    beta_p_s_HC ~ cauchy(0,2.5);
    beta_p_s_MDD ~ cauchy(0,2.5);
    
    // sample subject level parameters from the population mean and std defined above
    eta_s_HC ~ beta(eta_p_m_HC,eta_p_s_HC);
    eta_s_MDD ~ beta(eta_p_m_MDD,eta_p_s_MDD);
    beta_s_HC ~ normal(beta_p_m_HC,beta_p_s_HC);
    beta_s_MDD ~ normal(beta_p_m_MDD,beta_p_s_MDD);

  for (t in 1:Ntrials) {
      
      if (group[t] == 2) { 
      
      // change subject level parameters
      if (newSub[t] == 1) {
      
        sub_counter <- sub_counter + 1;
        eta_HC <- eta_s_HC[sub_counter];
        beta_HC <- beta_s_HC[sub_counter];
        qvals <- rep_vector(0, 2);

      }
      
      if (conditions[t] == 1) {
        
        choices[t] ~ categorical_logit(beta_HC * qvals);
        qvals[choices[t]] <- qvals[choices[t]] + eta_HC*(outcomes[t] - qvals[choices[t]]);
    
      } else if (conditions[t] == 2) {
        
        choices[t] ~ categorical_logit(beta_HC * qvals);
        qvals[choices[t]] <- qvals[choices[t]] + eta_HC*(outcomes[t] - qvals[choices[t]]);

    }

  }
  
  if (group[t] == 1) {
  
    // change subject level parameters
    if (newSub[t] == 1) {
      sub_counter <- sub_counter + 1;
      eta_MDD <- eta_s_MDD[sub_counter];
      beta_MDD <- beta_s_MDD[sub_counter];
      qvals <- rep_vector(0, 2);

    }
    
    if (conditions[t] == 1) {
      
      choices[t] ~ categorical_logit(beta_MDD * qvals);
      qvals[choices[t]] <- qvals[choices[t]] + eta_MDD*(outcomes[t] - qvals[choices[t]]);
  
    } else if (conditions[t] == 2) {
      
      choices[t] ~ categorical_logit(beta_MDD * qvals);
      qvals[choices[t]] <- qvals[choices[t]] + eta_MDD*(outcomes[t] - qvals[choices[t]]);
      
  }

  }
  
  }
  
  }
  
" # close quote for M1