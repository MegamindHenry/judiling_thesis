using Random
# using LinearAlgebra
using Statistics

sizes = [i*1000 for i in 1:8]

for i in sizes
  A = randn(Float64, (i,i))
  B = randn(Float64, (i,i))
  @time cor(A, B, dims=2)
end