using LinearAlgebra
using Statistics
# walks walked walked_3rd walk
# #wa wal alk lks ks# lke ked ed# lk#
C = [
1 1 1 1 1 0 0 0 0
1 1 1 0 0 1 1 1 0
1 1 1 0 0 1 1 1 0
1 1 1 0 0 0 0 0 1
]

# L = [
# 1.03826 -0.879297 -1.06946 # walk
# -0.405029 -1.55027 1.04651 # past
# 0.420329 -0.415322 -0.0281744 # present
# 0.126298 -1.53464 -0.580212 # # person3
# ]

L = [
 -1.523  -0.69    0.056  -0.315   1.604   0.239
 -0.921  -0.867   1.309   0.011   0.225  -0.588
 -0.693   0.987   2.941  -0.066   1.104   2.109
 -0.019   0.697  -0.261  -0.565  -0.89   -1.098
]

S1 = L[1:1,:] + L[3:3,:] + L[4:4,:]
S2 = L[1:1,:] + L[2:2,:]
S3 = L[1:1,:] + L[2:2,:] + L[4:4,:]
S4 = L[1:1,:] + L[3:3,:]

"""
  1.58489   0.633231   1.45859
 -2.82926  -2.42957   -1.29462
 -1.67785  -0.02295   -1.09763
"""
S = vcat(S1, S2, S3, S4)

F = pinv(C)*S
G = pinv(S)*C

C_val = C[4:4,:]
S_val = S[4:4,:]

Chat = S*G
Shat = C*F
Chat_val = S_val*G
Shat_val = C_val*F

rC = cor(C, Chat, dims=2)
rS = cor(S, Shat, dims=2)

rCval = cor(C_val, Chat, dims=2)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C1 = [
1 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0
]
M1 = pinv(C)*C1
C1hat_val = round.(Chat_val*M1, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C2 = [
0 1 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0
]

M2 = pinv(C)*C2
C2hat_val = round.(Chat_val*M2, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C3 = [
0 0 1 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0
]
M3 = pinv(C)*C3
C3hat_val = round.(Chat_val*M3, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C4 = [
0 0 0 1 0 0 0 0 0
0 0 0 0 0 1 0 0 0
0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 1
]
M4 = pinv(C)*C4
C4hat_val = round.(Chat_val*M4, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C5 = [
0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0
]
M5 = pinv(C)*C5
C5hat_val = round.(Chat_val*M5, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C6 = [
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 0
]
M6 = pinv(C)*C6
C6hat_val = round.(Chat_val*M6, digits=4)

;