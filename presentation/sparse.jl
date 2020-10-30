using Random
using SparseArrays

function sparseN(N, n)
  sparse(
    rand(1:N, n),
    rand(1:N, n),
    randn(Float64, n),
    N,
    N)
end

for i in 1:8
  println("========$i")
  A = sparseN(i*1000, i*i*10000)
  B = sparseN(i*1000, i*i*10000)
  @time A*B
  A = Array(A)
  B = Array(B)
  @time A*B
end