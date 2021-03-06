using LinearAlgebra
using Statistics

# # walk walks walked walked
# # #wa wal alk lk# lks ks# lke ked ed#
# C = [
# 1 1 1 1 0 0 0 0 0
# 1 1 1 0 1 1 0 0 0
# 1 1 1 0 0 0 1 1 1
# 1 1 1 0 0 0 1 1 1
# ]

# L = [
#  -1.52  -0.69   0.05  -0.31   1.60   0.23 #walk
#  -0.92  -0.86   1.30   0.01   0.22  -0.58 #present
#  -0.69   0.98   2.94  -0.06   1.10   2.10 #past
#  -0.01   0.69  -0.26  -0.56  -0.89  -1.09 #singular
#  -1.37  -0.98   0.81   0.01   0.56   0.31 #participle
# ]

# S1 = L[1:1,:] + L[2:2,:]                  #walk
# S2 = L[1:1,:] + L[2:2,:] + L[4:4,:]       #walks
# S3 = L[1:1,:] + L[3:3,:]                  #walked past
# S4 = L[1:1,:] + L[3:3,:] + L[5:5,:]       #walked part

# S = vcat(S1, S2, S3, S4)

C = [
1 1 1 1 0 0 0 0 0 0 0
1 1 1 0 1 1 0 0 0 0 0
1 1 1 0 0 0 1 1 1 0 0
1 1 1 0 0 0 1 1 1 0 0
0 0 1 1 0 0 0 0 0 1 1
0 0 1 0 1 1 0 0 0 1 1
0 0 1 0 0 0 1 1 1 1 1
0 0 1 0 0 0 1 1 1 1 1
]

L = [
 -1.52 -0.69  0.05 -0.31  1.60  0.23 # walk
 -0.92 -0.86  1.30  0.01  0.22 -0.58 # present
 -0.69  0.98  2.94 -0.06  1.10  2.10 # past
 -0.01  0.69 -0.26 -0.56 -0.89 -1.09 # singular
 -1.37 -0.98  0.81  0.01  0.56  0.31 # particle
  2.15 -0.77  0.91  0.59  0.81  1.53 # talk
]

S1 = L[1:1,:] + L[2:2,:]            # walk
S2 = L[1:1,:] + L[2:2,:] + L[4:4,:] # walks
S3 = L[1:1,:] + L[3:3,:]            # walked past
S4 = L[1:1,:] + L[3:3,:] + L[5:5,:] # walked part
S5 = L[6:6,:] + L[2:2,:]            # walk
S6 = L[6:6,:] + L[2:2,:] + L[4:4,:] # walks
S7 = L[6:6,:] + L[3:3,:]            # walked past
S8 = L[6:6,:] + L[3:3,:] + L[5:5,:] # walked part

S = vcat(S1, S2, S3, S4, S5, S6, S7, S8)

# F = pinv(C)*S
# G = pinv(S)*C

function wh_learn(
  X,
  Y;
  eta=0.01::Float64,
  n_epochs=1::Int64,
  weights=nothing,
  learn_seq=nothing,
  verbose=false,
  T=nothing,
  )

  X = Array(X)
  Y = Array(Y)

  if size(X, 1) != size(Y, 1)
    throw(ArgumentError("X($(size(inputs,1))) and Y($(size(outputs,1))) length doesn't match"))
  end

  if isnothing(weights)
    W = zeros(Float64, (size(X,2), size(Y,2)))
  else
    W = weights
  end

  # construct learn_seq if nothing
  if isnothing(learn_seq)
    learn_seq = 1:size(X,1)
  end
  
  inputT = Matrix{Float64}(undef, (size(X,2), 1))
  pred = Matrix{Float64}(undef, (1, size(Y,2)))
  deltaW = Matrix{Float64}(undef, (size(X,2), size(Y,2)))

  T = Array{Float64, 3}(undef, (size(X,2), size(Y,2), n_epochs))

  verbose && begin pb = Progress(size(X,1)*n_epochs) end
  for j in 1:n_epochs # 100 epochs
    for i in learn_seq # for each events
      # pred = X[i:i, :]*W
      mul!(pred, X[i:i, :], W)
      # obsv = Y[i:i, :]-pred
      broadcast!(-, pred, Y[i:i, :], pred)
      # inputT = X[i:i, :]'
      transpose!(inputT,X[i:i, :])
      # update = inputT*obsv
      mul!(deltaW, inputT, pred)
      # deltaW = eta*update
      rmul!(deltaW, eta)
      # W += deltaW
      broadcast!(+, W, W, deltaW)
      verbose && ProgressMeter.next!(pb)
    end
    T[:,:,j] = deepcopy(W)
  end
  W, T
end

F, FT = wh_learn(C, S, eta=0.001, n_epochs=1000)
G, GT = wh_learn(S, C, eta=0.001, n_epochs=1000)

Chat = S * G
Shat = C * F

a = cor(Chat, C, dims=2)
b = cor(Shat, S, dims=2)

# a = round.(a, digits=3)
# b = round.(b, digits=3)
using Plots

# y = [FT[1,1,:], FT[2,1,:], FT[3,1,:]. FT[4,1,:], FT[5,1,:], FT[6,1,:], 
#     FT[7,1,:], FT[8,1,:], FT[9,1,:], FT[10,1,:], FT[11,1,:]]

F1 = deepcopy(FT[1,1,:])
F2 = deepcopy(FT[3,1,:])
F3 = deepcopy(FT[4,1,:])
F4 = deepcopy(FT[5,1,:])
F5 = deepcopy(FT[7,1,:])
F6 = deepcopy(FT[10,1,:])
y = [F1, F2, F3, F4, F5, F6]

# y = [FT[i,1,1:1000] for i in 1:2]
# data = [[0.0001,0.0001], [0.0002,0.0002]]

x = 1:1000

# x = 1:10
# y = rand(10, 2)

plot(
  x,
  y,
  # yscale=:log10,
  # label=["R" "Julia" "R" "Julia" "R" "Julia" "R" "Julia" "R" "Julia" "R"],
  label=[" #wa & wal" " alk" " lk#" " lks & ks#" " lke, ked & ed#" " #ta & tal"],
  # lw=3,
  grid = (:y, :olivedrab, :dot, 1, 0.9),
  legend=:bottomleft)
# 
ylabel!("activation weights for S1")
xlabel!("number of training epochs")
savefig(joinpath(@__DIR__, "wh.pdf"))