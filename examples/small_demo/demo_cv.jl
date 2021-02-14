using LinearAlgebra
using Statistics

# walk, walked past, walked part
# talks, talked past, talked part

# #wa wal alk lk# lks ks# lke ked ed# #ta tal

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
 2.15  -0.77  0.91  0.59  0.81  1.53 # talk
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

# C_train = C[[1,3,4,6,7,8],:]
# C_val = C[[2,5],:]

# S_train = S[[1,3,4,6,7,8],:]
# S_val = S[[2,5],:]

C_train = C[[2,3,4,7,8],:]
C_val = C[[6,5],:]

S_train = S[[2,3,4,7,8],:]
S_val = S[[6,5],:]

F_train = pinv(C_train)*S_train
G_train = pinv(S_train)*C_train

Chat_train = S_train*G_train
Shat_train = C_train*F_train
Chat_val = S_val*G_train
Shat_val = C_val*F_train

a = round.(cor(Shat_val, S_val, dims=2), digits=2)

b = round.(Chat_val, digits=2)

C_1 = [
1 1 1 1 0 0 0 0 0 0 0 # walk
1 1 1 0 1 1 0 0 0 0 0 # walks
1 1 1 0 0 0 1 1 1 0 0 # walked
0 0 1 1 0 0 0 0 0 1 1 # talk
0 0 1 0 1 1 0 0 0 1 1 # talks
]

S_1 = C_1*F_train

c = round.(cor(S_1, S_val, dims=2), digits=2)

 #  walk   talk
 # 0.94  0.21
 # 0.92  0.28
 # 0.89  0.35
 # 0.22  0.91
 # 0.23  0.86

