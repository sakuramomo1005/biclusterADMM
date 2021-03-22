### toy example

library('biclusterADMM')

# toy parameter
nu1 = nu2 = nu3 = gamma_1 = gamma_2 = 0.1
m = 5; phi = 0.5

# data generation
set.seed(123)
X = data_gen(n = 100, p = 80)

#######################################
# run bi-ADMM algorithm
# l1 norm
#######################################
# r verison
t1 = Sys.time()
res1.l1 = biADMM(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l1', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1
# Time difference of 7.105862 secs

# python version
t3 = Sys.time()
res2.l1 = biADMM.speed(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l1', niters = 10, tol = 0.0001, output = 1)
t4 = Sys.time()
t4 - t3
# Time difference of 1.185762 secs
mean(abs(res2.l1$A - res1.l1$A))
mean(abs(res2.l1$v - res1.l1$v))
mean(abs(res2.l1$z - res1.l1$z))
mean(abs(res2.l1$lambda_1 - res1.l1$lambda_1))
mean(abs(res2.l1$lambda_2 - res1.l1$lambda_2))

#######################################
# run bi-ADMM algorithm
# l2 norm
#######################################
# r verison
t1 = Sys.time()
res1.l2 = biADMM(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l2', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1
# Time difference of 6.679817 secs

# python version
t3 = Sys.time()
res2.l2 = biADMM.speed(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l2', niters = 10, tol = 0.0001, output = 1)
t4 = Sys.time()
t4 - t3
# Time difference of 0.5570161 secs
mean(abs(res2.l2$A - res1.l2$A))
mean(abs(res2.l2$v - res1.l2$v))
mean(abs(res2.l2$z - res1.l2$z))
mean(abs(res2.l2$lambda_1 - res1.l2$lambda_1))
mean(abs(res2.l2$lambda_2 - res1.l2$lambda_2))

#######################################
# run bi-ADMM algorithm
# l infinity
#######################################
# r verison
t1 = Sys.time()
res1.lf = biADMM(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l-inf', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1
# Time difference of 7.105862 secs

# python version
t3 = Sys.time()
res2.lf = biADMM.speed(X, nu1, nu2, gamma_1, gamma_2, m, phi, prox = 'l-inf', niters = 10, tol = 0.0001, output = 1)
t4 = Sys.time()
t4 - t3
# Time difference of 1.185762 secs
mean(abs(res2.lf$A - res1.lf$A))
mean(abs(res2.lf$v - res1.lf$v))
mean(abs(res2.lf$z - res1.lf$z))
mean(abs(res2.lf$lambda_1 - res1.lf$lambda_1))
mean(abs(res2.lf$lambda_2 - res1.lf$lambda_2))


mean(abs(res2.lf$A - res2.l1$A))
mean(abs(res2.lf$A - res2.l2$A))
mean(abs(res2.l1$A - res1.l2$A))

#######################################
# run biC-ADMM algorithm
# l1 norm
#######################################
# r verison
t1 = Sys.time()
Cres1.l1 = biC.ADMM(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l1', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1

# python version
t3 = Sys.time()
phi = 0.5
Cres2.l1 = biC.ADMM.speed(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l1', niters = 10, tol = 0.0001, output = 1)
t4 = Sys.time()
t4 - t3

mean(abs(Cres2.l1$A - Cres1.l1$A))
mean(abs(Cres2.l1$v - Cres1.l1$v))
mean(abs(Cres2.l1$z - Cres1.l1$z))
mean(abs(Cres2.l1$lambda_1 - Cres1.l1$lambda_1))
mean(abs(Cres2.l1$lambda_2 - Cres1.l1$lambda_2))


#######################################
# run biC-ADMM algorithm
# l2 norm
#######################################
# r verison
t1 = Sys.time()
Cres1.l2 = biC.ADMM(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l2', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1

# python version
t3 = Sys.time()
phi = 0.5
Cres2.l2 = biC.ADMM.speed(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l2', niters = 10, tol =0.0001, output = 1)
t4 = Sys.time()
t4 - t3

mean(abs(Cres2.l2$A - Cres1.l2$A))
mean(abs(Cres2.l2$v - Cres1.l2$v))
mean(abs(Cres2.l2$z - Cres1.l2$z))
mean(abs(Cres2.l2$lambda_1 - Cres1.l2$lambda_1))
mean(abs(Cres2.l2$lambda_2 - Cres1.l2$lambda_2))


#######################################
# run biC-ADMM algorithm
# l inf norm
#######################################
# r verison
t1 = Sys.time()
Cres1.lf = biC.ADMM(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l-inf', niters = 10, tol = 0.0001, output = 1)
t2 = Sys.time()
t2 - t1

# python version
t3 = Sys.time()
phi = 0.5
Cres2.lf = biC.ADMM.speed(X, nu1, nu2, nu3, gamma_1, gamma_2, m, phi, prox = 'l-inf', niters = 10, tol = 0.0001, output = 1)
t4 = Sys.time()
t4 - t3

mean(abs(Cres2.lf$A - Cres1.lf$A))
mean(abs(Cres2.lf$v - Cres1.lf$v))
mean(abs(Cres2.lf$z - Cres1.lf$z))
mean(abs(Cres2.lf$lambda_1 - Cres1.lf$lambda_1))
mean(abs(Cres2.lf$lambda_2 - Cres1.lf$lambda_2))




