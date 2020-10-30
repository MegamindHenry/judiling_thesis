## HIDE
## navigate to a folder that has the dataset in a subfolder called data
##
## cd("/home/harald/research/projects/NDL/morphology/package/Julia/LDLjuliaGithub#/julia_learn/examples/french")
## starting up julia and loading modules that we need

## HIDE
println("Loading modules...")
using CSV
using Statistics
using Pkg
# Pkg.add(PackageSpec(url="https://github.com/MegamindHenry/JudiLing.jl.git"))
using JudiLing

# Load the dataset

french = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "french_all.csv")))
@show size(french)
french = french[1:8000, :]

## AND SHOW CONTENTS

# Build C matrix:

cue_obj = JudiLing.make_cue_matrix(french,
                                         grams=2,
                                         target_col="Syllables",
                                         tokenized=true,
                                         sep_token="-",
                                         keep_sep=true);
# 1.2 seconds

# Build S matrix:

S = JudiLing.make_S_matrix(french,
                                 ["Lexeme"],
                                 ["Person", "Number", "Gender", "Tense", "Aspect", "Class", "Mood"],
                                 ncol = size(cue_obj.C,2),
                                 add_noise = true);
# 45 seconds

# Build mapping F from form to meaning 

F = JudiLing.make_transform_matrix(cue_obj.C, S)
# 14.1 seconds

# Calculate predicted semantic vectors Shat

Shat = convert(Matrix{Float64}, cue_obj.C) * F
# 4.2 seconds

# Correlations of predicted and observed semantic vectors

Rs = cor(Shat, S, dims=2)
# 108.2 seconds

# Assess accuracy on training data, accepting the meanings of homophones as correct. 
## THIS CAN NOW BE DONE WITH THE NEW ACCURACY FUNCTION

v = [french[i[1],"Syllables"] == french[i[2],"Syllables"] ? 1 : 0 for i in argmax(Rs, dims=2)]
sum(v)/length(v)
# 0.997


# The mapping G from meaning to form

G = JudiLing.make_transform_matrix(S, cue_obj.C)
# 47.0 seconds

# Calculate predicted form vectors Chat

Chat = S * G
# 45.5 seconds


# Correlations of predicted and observed form vectors (make C dense!)

Rc = cor(Chat, Array(cue_obj.C), dims=2)
# 19.5 seconds

# assess how often the diagonal elements are the maxima of rows (or columns)

v = [i[1] == i[2] ? 1 : 0 for i in argmax(Rc, dims=2)]
sum(v)/length(v)
# 0.93


# Calculate paths and incremental path support using the learning algorithm

# Determine maximum number of timesteps (syllables)

max_t = JudiLing.cal_max_timestep(french, french, "Syllables", sep_token="-", tokenized=true)

# Learn syllable by syllable, return paths and their semantic support vectors


@time res_shuo = JudiLing.learn_paths(
  french,
  french,
  cue_obj.C,
  S,
  F,
  Chat,
  cue_obj.A,  
  cue_obj.i2f,
  max_t=max_t,
  max_can=10,
  threshold=0.1,
  grams=2,
  tokenized=true,
  sep_token="-",
  keep_sep=true,
  target_col="Syllables",
  check_gold_path=false,
  sparse_ratio=0.05,
  verbose=true
  );

@time res_hua = JudiLing.build_paths(
  french,
  cue_obj.C,
  S,
  F,
  Chat,
  cue_obj.A,
  cue_obj.i2f,
  cue_obj.gold_ind,
  max_t=max_t,
  rC = Rc,
  n_neighbors=2,
  verbose=true
  )

;