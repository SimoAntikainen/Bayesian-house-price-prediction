data {
  int<lower=1> N;
  int<lower=1> N_pred;
  int<lower=1> N_groups;
  int<lower=1> K;
  vector[N] y;
  matrix[N, K] X;
  matrix[N, K] X_second;
  matrix[N, K] X_third;
  matrix[N_pred, K] X_pred;
  matrix[N_pred, K] X_pred_second;
  matrix[N_pred, K] X_pred_third;
  int<lower=1> groups[N];
  int<lower=1> groups_pred[N_pred];
}
parameters {
  vector[N_groups] alpha;
  vector[K] beta;
  vector[K] beta_second;
  vector[K] beta_third;
  real<lower=0> sigma;
}
//transformed parameters {
//  vector[N] mu;
//  vector[N_pred] mu_pred;
//  mu = alpha + X * beta;
//  mu_pred = alpha + X_pred * beta;
//}
model {
  real nu = 3;
  alpha ~ student_t(nu,0,1);   
  beta ~ student_t(nu,0,1);
  beta_second ~ student_t(nu,0,1);
  sigma ~ student_t(nu,0,1);
  for (i in 1:N){
    y[i] ~ normal(alpha[groups[i]] + X[i] * beta + X_second[i] * beta_second  + X_third[i] * beta_third, sigma);
  }
}
generated quantities {
  vector[N_pred] y_pred;
  vector[N] log_lik;
  
  for (i in 1:N_pred) {
    y_pred[i] = normal_rng(alpha[groups_pred[i]] + X_pred[i] * beta+ X_pred_second[i] * beta_second + X_pred_third[i] * beta_third, sigma);
  }

  for (i in 1:N) {
    log_lik[i] = normal_lpdf(y[i] | alpha[groups[i]] + X[i] * beta + X_second[i] * beta_second + X_third[i] * beta_third, sigma);
  }
}
  

