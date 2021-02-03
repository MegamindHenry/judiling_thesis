using JudiLing
using CSV
using Statistics
# using JLD2
# using FileIO
# using DataFrames
# using Random
# using Distributions

latin = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "data", "latin.csv")))

cue_obj = JudiLing.make_cue_matrix(
  latin,
  grams=3,
  target_col=:Word
  )

n_features = size(cue_obj.C, 2)

S = JudiLing.make_S_matrix(
  latin,
  ["Lexeme"],
  ["Person","Number","Tense","Voice","Mood"],
  add_noise=true
  )

F = JudiLing.make_transform_matrix(cue_obj.C, S)
Shat = cue_obj.C * F
@show JudiLing.eval_SC(Shat, S)

G = JudiLing.make_transform_matrix(S, cue_obj.C)
Chat = S * G
@show JudiLing.eval_SC(Chat, cue_obj.C)

# show errors
rC = cor(Shat, S, dims=2)
gold = []
pred = []
for i in argmax(rC, dims=2)
  if i[1] == i[2]
    continue
  end
  append!(gold, i[1])
  append!(pred, i[2])
end

for (i,j) in zip(gold, pred)
  println("="^66)
  println()
  println()
  println()
  println("pred: $(latin[j,:])")
  println("gold: $(latin[i,:])")
end

error()

;

