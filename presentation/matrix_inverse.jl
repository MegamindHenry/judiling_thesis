using JudiLing
using LinearAlgebra

for i in 1:8
  A = randn(Float64, (i*1000, i*1000))
  B = randn(Float64, (i*1000, i*1000))
  @time pinv(A)*B
end

for i in 1:8
  A = randn(Float64, (i*1000, i*1000))
  B = randn(Float64, (i*1000, i*1000))
  @time JudiLing.make_transform_matrix(A, B)
end