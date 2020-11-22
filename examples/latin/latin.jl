using JudiLing # our package
using CSV # read csv files into dataframes
# using Statistics
# using JLD2
# using FileIO
# using DataFrames
# using Random
# using Distributions

# load Latin dataset
latin = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "data", "latin.csv")))

# create C matrix
cue_obj = JudiLing.make_cue_matrix(
  latin,
  grams=3,
  target_col=:Word
  )

n_features = size(cue_obj.C, 2)

# if we don't add noise
S = JudiLing.make_S_matrix(
  latin,
  ["Lexeme"],
  ["Person","Number","Tense","Voice","Mood"],
  add_noise=true
  )

error()

G_train = JudiLing.make_transform_matrix(S_train, cue_obj_train.C)
Chat_train = S_train * G_train
@show JudiLing.eval_SC(Chat_train, cue_obj_train.C)
# 0.480

# if we add noise
S_train = JudiLing.make_S_matrix(
  latin_train,
  ["Lexeme"],
  ["Person","Number","Tense","Voice","Mood"],
  add_noise=true
  )

G_train = JudiLing.make_transform_matrix(S_train, cue_obj_train.C)
Chat_train = S_train * G_train
@show JudiLing.eval_SC(Shat_train, S_train)
# 0.976

;

