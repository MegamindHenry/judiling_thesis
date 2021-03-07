A = matrix(rexp(2*2*10000*1000, rate=.1), ncol=2*1000)
B = matrix(rexp(2*2*1000*1000, rate=.1), ncol=2*1000)
C = matrix(rexp(2*2*1000*1000, rate=.1), ncol=2*1000)

start.time <- Sys.time()
AA = A %*% B
end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)

library(MASS)
start.time <- Sys.time()
AA = ginv(A)
end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)

start.time <- Sys.time()
AA = cor(B)
end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)

