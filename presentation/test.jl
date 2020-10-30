using Random
using LinearAlgebra

sizes = [i*1000 for i in 1:10]

for i in sizes
  A = randn(Float64, (i,i))
  B = randn(Float64, (i,i))
  @time A*B
end