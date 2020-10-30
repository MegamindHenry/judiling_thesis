install.packages("MASS")
library(MASS)

for(i in 1:8) {
  A = matrix(rexp(i*i*1000*1000, rate=.1), ncol=i*1000)
  start.time <- Sys.time()
  ginv(A)
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
}

for(i in 1:8) {
  A = matrix(rexp(i*i*1000*1000, rate=.1), ncol=i*1000)
  start.time <- Sys.time()
  cor(A)
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
}
