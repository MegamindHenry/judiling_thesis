using Statistics
using JudiLing

# cat1 = [1.5 1.5
# 1.5 1.5
# 1.5 1.5
# 1.5 1.5
# 1.5 1.5]

# cathat = [1.5 1.0
# 1.5 1.0
# 1.5 1.0
# 1.5 1.0
# 1.5 1.0]
# C = randn(Float64, (5,200))
# S = randn(Float64, (5,200))
# display(C)
# display(S)
# cor(C, S, dims=2)
using Distances
using LinearAlgebra
# x = [1.5, 1.5]
# x = [-2.5, 2]
# x = [-2, -1]
# x = [-2, -0.5]
# x = [3, -0.5]
x = [3,2]
y = [1.5, 1]
# @show r = evaluate(dist, [1.5,1.5], [1,1.5])
@show dot(x, y)/(norm(x) * norm(y))
# @show asd = dist([1.5,1.5], [1,1.5])
# a = JudiLing.eval_SC(C,S)
  # rSC = Statistics.cor(convert(Matrix{Float64}, S), convert(Matrix{Float64}, C), dims=2)
  # display(rSC)
  # v = [(i[1]==i[2] || rSC[i[1],i[1]]==rSC[i]) ? 1 : 0 for i in argmax(rSC, dims=2)]
  # sum(v)/length(v)

# cor([1.5,2], [(-2.3),-1.7])