data {
  int<lower=1> N;
  int<lower=1> K;
  vector[N] y;
  matrix[N, K] X;
}
parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}
model {
  alpha ~ normal(0, 1000);    
  beta[1] ~ normal(2000, 1000);
  beta[2] ~ normal(3000, 1000);
  beta[3] ~ normal(4000, 1000);
  beta[4] ~ normal(4000, 1000);
  sigma ~ cauchy(0, 250);
  y ~ normal(alpha + X * beta, sigma);
}



