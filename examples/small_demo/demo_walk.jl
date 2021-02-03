using LinearAlgebra
using Statistics
# walks walked walked_3rd walk
# #wa wal alk lks ks# lke ked ed# lk#
C = [
1 1 1 0 0 0 0 0 1
1 1 1 1 1 0 0 0 0
1 1 1 0 0 1 1 1 0
1 1 1 0 0 1 1 1 0
]

L = [
 -1.52  -0.69   0.05  -0.31   1.60   0.23 #walk
 -0.92  -0.86   1.30   0.01   0.22  -0.58 #present
 -0.69   0.98   2.94  -0.06   1.10   2.10 #past
 -0.01   0.69  -0.26  -0.56  -0.89  -1.09 #singular
 -1.37  -0.98   0.81   0.01   0.56   0.31 #participle
]

S1 = L[1:1,:] + L[2:2,:]                  #walk
S2 = L[1:1,:] + L[2:2,:] + L[4:4,:]       #walks
S3 = L[1:1,:] + L[3:3,:]                  #walked past
S4 = L[1:1,:] + L[3:3,:] + L[5:5,:]       #walked part

S = vcat(S1, S2, S3, S4)

F = pinv(C)*S
G = pinv(S)*C

C_val = C[1:1,:]
S_val = S[1:1,:]

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
0 0 0 0 0 0 0 0 1
0 0 0 1 0 0 0 0 0
0 0 0 0 0 1 0 0 0
0 0 0 0 0 1 0 0 0
]
M4 = pinv(C)*C4
C4hat_val = round.(Chat_val*M4, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C5 = [
0 0 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 1 0 0
]
M5 = pinv(C)*C5
C5hat_val = round.(Chat_val*M5, digits=4)

# walks walked walk
# #wa wal alk lks ks# lke ked ed# lk#
C6 = [
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 1 0
]
M6 = pinv(C)*C6
C6hat_val = round.(Chat_val*M6, digits=4)

;