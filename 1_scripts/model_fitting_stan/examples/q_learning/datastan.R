## fit the q learning model using stan

data = read.csv('data.csv')

library(rstan)

subs = unique(data$sub) # 20 subjects

NS = 20 # number of subjects
NT = 200 # number of trials

c = array(0,c(NS,NT)) # (rows, columns)
r = array(0,c(NS,NT))
covariate = matrix(0,NS)

# transforming the data to a wide format
for (i in 1:NS) {
	c[i,1:NT] = subset(data,sub==subs[i])$c - 1; # subset df for ith subject's 200 trials, extract values from column 'c', subtract 1 from each value, and assign those values to the ith row of matrix c
	r[i,1:NT] = subset(data,sub==subs[i])$r;
}

# convert to a list
standata = list(NS= NS, NT=NT, c=c, r=r)

# run four chains in parallel - number of iterations includes the 'warmup'

rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
fit<- stan(file = 'qlearning.stan', data = standata, iter = 1000, warmup=250, chains = 4)


## here is the version that fits 19 subjects and computes the left-out marginal likelihood for the 20th

NS = 19 # here N=19 bc loo
NT = 200 # n of trials

loosub = 20 # full list of subjects
subs = unique(subset(data,sub != loosub)$sub) # extract subj ids not equal to full list of subj

c = array(0,c(NS,NT))
r = array(0,c(NS,NT))

# loop through each subject-19 to transform the data format 
for (i in 1:NS) {
  c[i,1:NT] = subset(data,sub==subs[i])$c - 1;
  r[i,1:NT] = subset(data,sub==subs[i])$r;
  }

 cloo = subset(data,sub==loosub)$c - 1;
 rloo = subset(data,sub==loosub)$r;

# create a list 
 standata = list(NS= NS, NT=NT, c=c, r=r, cloo=cloo, rloo=rloo)

 # run four chains in parallel

 fit <- stan(file = 'qlearningloo.stan', data = standata, iter = 1000,warmup=250, chains = 4)

 loolik <- log(mean(exp(extract(fit,pars='loo_lik')$loo_lik)))

 