using LinearAlgebra
using Statistics
## walks walk walked talks talk talked

## #wa wal alk lks ks# lk# lke ked ed# #ta tal
C = [
 1  1  1  1  1  0  0  0  0  0  0
 1  1  1  0  0  1  0  0  0  0  0
 1  1  1  0  0  0  1  1  1  0  0
 1  1  1  0  0  0  1  1  1  0  0
 0  0  1  1  1  0  0  0  0  1  1
 0  0  1  0  0  1  0  0  0  1  1
 0  0  1  0  0  0  1  1  1  1  1
 0  0  1  0  0  0  1  1  1  1  1
]

"""

\begin{align*}
C = \kbordermatrix{\mbox{}&\#wa&wal&alk&lks&ks\#&lk\#&lke&ked&ed\#&\#ta&tal\\
walks&1&1&1&1&1&0&0&0&0&0&0\\
walk&1&1&1&0&0&1&0&0&0&0&0\\
walked_{sg}&1&1&1&0&0&0&1&1&1&0&0\\
walked_{pl}&1&1&1&0&0&0&1&1&1&0&0\\
talks&0&0&1&1&1&0&0&0&0&1&1\\
talk&0&0&1&0&0&1&0&0&0&1&1\\
talked_{sg}&0&0&1&0&0&0&1&1&1&1&1\\
talked_{pl}&0&0&1&0&0&0&1&1&1&1&1
}
\end{align*}

"""

## WALK TALK sg pl past present
S = [
1 0 1 0 0 1 # walks
1 0 0 1 0 1 # walk
1 0 1 0 1 0 # walked_sg
1 0 0 1 1 0 # walked_pl
0 1 1 0 0 1 # talks
0 1 0 1 0 1 # talk
0 1 1 0 1 0 # talked_sg
0 1 0 1 1 0 # talked_pl
]

"""

\begin{align*}
S = \kbordermatrix{\mbox{}&WALK&TALK&sg&pl&past&present\\
walks&1&0&1&0&0&1\\
walk&1&0&0&1&0&1\\
walked_{sg}&1&0&1&0&1&0\\
walked_{pl}&1&0&0&1&1&0\\
talks&0&1&1&0&0&1\\
talk&0&1&0&1&0&1\\
talked_{sg}&0&1&1&0&1&0\\
talked_{pl}&0&1&0&1&1&0
}
\end{align*}

"""

F = pinv(C)*S
G = pinv(S)*C

"""
8×6 Array{Float64,2}:
  1.0  -0.0   1.0  -0.0  -0.0   1.0
  1.0  -0.0  -0.0   1.0  -0.0   1.0
  1.0   0.0   0.5   0.5   1.0   0.0
  1.0   0.0   0.5   0.5   1.0   0.0
  0.0   1.0   1.0  -0.0  -0.0   1.0
  0.0   1.0  -0.0   1.0  -0.0   1.0
 -0.0   1.0   0.5   0.5   1.0  -0.0
 -0.0   1.0   0.5   0.5   1.0  -0.0

1 0 1 0 0 1 # walks
1 0 0 1 0 1 # walk
1 0 1 0 1 0 # walked_sg
1 0 0 1 1 0 # walked_pl
0 1 1 0 0 1 # talks
0 1 0 1 0 1 # talk
0 1 1 0 1 0 # talked_sg
0 1 0 1 1 0 # talked_pl

#wa wal alk lks ks# lk# lke ked ed# #ta tal

8×11 Array{Float64,2}:
  1.0   1.0  1.0   0.75   0.75   0.25  0.0  0.0  -0.0  -0.0  -0.0
  1.0   1.0  1.0   0.25   0.25   0.75  0.0  0.0  -0.0  -0.0  -0.0
  1.0   1.0  1.0   0.25   0.25  -0.25  0.0  0.0   1.0   1.0   1.0
  1.0   1.0  1.0  -0.25  -0.25   0.25  0.0  0.0   1.0   1.0   1.0
 -0.0  -0.0  1.0   0.75   0.75   0.25  1.0  1.0  -0.0  -0.0  -0.0
 -0.0  -0.0  1.0   0.25   0.25   0.75  1.0  1.0  -0.0  -0.0  -0.0
  0.0   0.0  1.0   0.25   0.25  -0.25  1.0  1.0   1.0   1.0   1.0
  0.0   0.0  1.0  -0.25  -0.25   0.25  1.0  1.0   1.0   1.0   1.0

1 1 1 1 1 0 0 0 0 0 0 # walks
1 1 1 0 0 1 0 0 0 0 0 # walk
1 1 1 0 0 0 0 0 1 1 1 # walked_sg
1 1 1 0 0 0 0 0 1 1 1 # walked_pl
0 0 1 1 1 0 1 1 0 0 0 # talks
0 0 1 0 0 1 1 1 0 0 0 # talk
0 0 1 0 0 0 1 1 1 1 1 # talked_sg
0 0 1 0 0 0 1 1 1 1 1 # talked_pl

"""

C_val = C[7:8,:]

S_val = S[7:8,:]


Shat_val = round.(C_val*F, digits=4)
Chat_val = round.(S_val*G, digits=4)

# #wa wal alk lks ks# lk# lke ked ed# #ta tal
# alk lk# lke ked ed# #ta tal

"""
#wa wal alk lks ks# lk# lke ked ed# #ta tal
C = [
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
]
"""

C1 = [
 1  0  0  0  0  0  0  0  0  0  0
 1  0  0  0  0  0  0  0  0  0  0
 1  0  0  0  0  0  0  0  0  0  0
 1  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  1  0
 0  0  0  0  0  0  0  0  0  1  0
 0  0  0  0  0  0  0  0  0  1  0
 0  0  0  0  0  0  0  0  0  1  0
]

M1 = pinv(C)*C1
C1hat_val = round.(Chat_val*M1, digits=4)

#ta


C2 = [
 0  1  0  0  0  0  0  0  0  0  0
 0  1  0  0  0  0  0  0  0  0  0
 0  1  0  0  0  0  0  0  0  0  0
 0  1  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  1
 0  0  0  0  0  0  0  0  0  0  1
 0  0  0  0  0  0  0  0  0  0  1
 0  0  0  0  0  0  0  0  0  0  1
]

M2 = pinv(C)*C2
C2hat_val = round.(Chat_val*M2, digits=4)

#tal

C3 = [
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0
]

M3 = pinv(C)*C3
C3hat_val = round.(Chat_val*M3, digits=4)


# alk

#wa wal alk lks ks# lk# lke ked ed# #ta tal

C4 = [
 0  0  0  1  0  0  0  0  0  0  0
 0  0  0  0  0  1  0  0  0  0  0
 0  0  0  0  0  0  1  0  0  0  0
 0  0  0  0  0  0  1  0  0  0  0
 0  0  0  1  0  0  0  0  0  0  0
 0  0  0  0  0  1  0  0  0  0  0
 0  0  0  0  0  0  1  0  0  0  0
 0  0  0  0  0  0  1  0  0  0  0
]

M4 = pinv(C)*C4
C4hat_val = round.(Chat_val*M4, digits=4)


# lke lks
# lke lk#

C5 = [
 0  0  0  0  1  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  1  0  0  0
 0  0  0  0  0  0  0  1  0  0  0
 0  0  0  0  1  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  1  0  0  0
 0  0  0  0  0  0  0  1  0  0  0
]

M5 = pinv(C)*C5
C5hat_val = round.(Chat_val*M5, digits=4)

# ked ks#
# ked

C6 = [
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  1  0  0
 0  0  0  0  0  0  0  0  1  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0  1  0  0
 0  0  0  0  0  0  0  0  1  0  0
]

M6 = pinv(C)*C6
C6hat_val = round.(Chat_val*M6, digits=4)

# ed#


;