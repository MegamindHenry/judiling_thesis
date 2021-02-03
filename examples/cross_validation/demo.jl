using LinearAlgebra
using Statistics
# walks walked walked_3rd walk talks talked talked_3rd talk
# #wa wal alk lks ks# lke ked ed# lk# #ta tal
C = [
1 1 1 1 1 0 0 0 0 0 0
1 1 1 0 0 1 1 1 0 0 0
1 1 1 0 0 1 1 1 0 0 0
1 1 1 0 0 0 0 0 1 0 0
0 0 1 1 1 0 0 0 0 1 1
0 0 1 0 0 1 1 1 0 1 1
0 0 1 0 0 1 1 1 0 1 1
0 0 1 0 0 0 0 0 1 1 1
]

L = [
 -1.523  -0.69    0.056  -0.315   1.604   0.239
 -0.921  -0.867   1.309   0.011   0.225  -0.588
 -0.693   0.987   2.941  -0.066   1.104   2.109
 -0.019   0.697  -0.261  -0.565  -0.89   -1.098
 -1.253   0.878   0.955  -0.339  -0.409   0.833
]

# walks walked walked_3rd walk talks talked talked_3rd talk
S1 = L[1:1,:] + L[3:3,:] + L[4:4,:]
S2 = L[1:1,:] + L[2:2,:]
S3 = L[1:1,:] + L[2:2,:] + L[4:4,:]
S4 = L[1:1,:] + L[3:3,:]
S5 = L[5:5,:] + L[3:3,:] + L[4:4,:]
S6 = L[5:5,:] + L[2:2,:]
S7 = L[5:5,:] + L[2:2,:] + L[4:4,:]
S8 = L[5:5,:] + L[3:3,:]

S = vcat(S1, S2, S3, S4, S5, S6, S7, S8)

# cross_validation
C_train = C[[1,2,3,6,7,8],:]
C_val = C[[4,5],:]
S_train = S[[1,2,3,6,7,8],:]
S_val = S[[4,5],:]

F_train = pinv(C_train)*S_train
G_train = pinv(S_train)*C_train

Chat_train = S_train*G_train
Shat_train = C_train*F_train
Chat_val = S_val*G_train
Shat_val = C_val*F_train

rC_train = cor(Chat_train, C_train, dims=2)
rS_train = cor(Shat_train, S_train, dims=2)
rC_val = cor(Chat_val, C_val, dims=2)
rS_val = cor(Shat_val, S_val, dims=2)

amrC_train = argmax(rC_train, dims=2)
amrS_train = argmax(rS_train, dims=2)
amrC_val = argmax(rC_val, dims=2)
amrS_val = argmax(rS_val, dims=2)

"""
C_val = [
1 1 1 0 0 0 0 0 1 0 0
0 0 1 1 1 0 0 0 0 1 1
]
"""

C1_train = [
1 0 0 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 0 1 0
]

M1_train = pinv(C_train)*C1_train
C1hat_val = round.(Chat_val*M1_train, digits=3)

C2_train = [
0 1 0 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0 1
]

M2_train = pinv(C_train)*C2_train
C2hat_val = round.(Chat_val*M2_train, digits=3)

C3_train = [
0 0 1 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0
]

M3_train = pinv(C_train)*C3_train
C3hat_val = round.(Chat_val*M3_train, digits=3)

C4_train = [
0 0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0
]

M4_train = pinv(C_train)*C4_train
C4hat_val = round.(Chat_val*M4_train, digits=3)

C5_train = [
0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0
]

M5_train = pinv(C_train)*C5_train
C5hat_val = round.(Chat_val*M5_train, digits=3)

C6_train = [
0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 0 0 0
]

M6_train = pinv(C_train)*C6_train
C6hat_val = round.(Chat_val*M6_train, digits=3)

Chat_can = [
1 1 1 1 1 0 0 0 0 0 0
1 1 1 0 0 0 0 0 1 0 0
0 0 1 1 1 0 0 0 0 1 1
0 0 1 0 0 0 0 0 1 1 1
]

Shat_can = Chat_can * F_train

rS1_can = cor(Shat_can[1:2,:], S_val[1,:], dims=2)
rS2_can = cor(Shat_can[3:4,:], S_val[2,:], dims=2)
;