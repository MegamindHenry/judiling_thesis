using JudiLing
using CSV

data = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "demo.csv")))

cue_obj = JudiLing.make_cue_matrix(
  data,
  grams=3,
  target_col=:Word,
  tokenized=false,
  keep_sep=false
  )

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

G = JudiLing.make_transform_matrix(S, cue_obj.C)
F = JudiLing.make_transform_matrix(cue_obj.C, S)

Shat = round.(cue_obj.C*F, digits=4)
Chat = round.(S*G, digits=4)