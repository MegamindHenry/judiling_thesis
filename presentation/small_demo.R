start.time <- Sys.time()
F = ginv(S) %*% C1
end.time <- Sys.time()
time.taken <- end.time - start.time
print(time.taken)