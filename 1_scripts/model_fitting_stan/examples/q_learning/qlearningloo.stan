data {
	int NT;
	int NS;

	int r[NS,NT];
	int c[NS,NT];

	int rloo[NT];
	int cloo[NT];
}

parameters {
	real betam;
	real alpham;

	real<lower=0> betasd;
	real<lower=0> alphasd;

	real betas[NS];
	real alphas[NS];
}

model {
	betam ~ normal(0,2);
	alpham ~ normal(0,2);
	betas ~ normal(0,2);
	alphas ~ normal(0,2);

	for (s in 1:NS) {
		real alpha;
		real q[2];

		betas[s] ~ normal(betam, betasd);
		alphas[s] ~ normal(alpham, alphasd);
		alpha <- Phi_approx(alphas[s]);

		for (i in 1:2) {
			q[i] <- 0; 
		}

		for (t in 1:NT) {
			c[s,t] ~ bernoulli_logit(betas[s]  * (q[2] - q[1]));

			q[c[s,t]+1] <- (1-alpha) * q[c[s,t]+1] + r[s,t];
		}
	}
}



generated quantities {
	real loo_lik;

	{	
		real q[2];
		real alphaloo;
		real betaloo;

		// draw a set of parameters according to the currently sampled prior

		alphaloo <- Phi_approx(normal_rng(alpham,alphasd));
		betaloo <- normal_rng(betam, betasd);

		// compute log likelihood for left out subject's choices

		for (i in 1:2) {
			q[i] <- 0; 
		}
		loo_lik <- 0;

		for (t in 1:NT) {
			loo_lik <- loo_lik + bernoulli_logit_log(cloo[t], betaloo  * (q[2] - q[1]));

			q[cloo[t]+1] <- (1-alphaloo) * q[cloo[t]+1] + rloo[t];
		}
	}
}

