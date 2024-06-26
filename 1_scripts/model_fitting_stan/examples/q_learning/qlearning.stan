data {
	int NT;
	int NS;

	int r[NS,NT];
	int c[NS,NT];

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
	betam ~ normal(0,10);
	alpham ~ normal(0,1);
	betas ~ cauchy(0,10);
	alphas ~ normal(0,1);

	for (s in 1:NS) {
		real alpha;
		real q[2];

		betas[s] ~ normal(betam, betasd);
		alphas[s] ~ normal(alpham,alphasd);
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
