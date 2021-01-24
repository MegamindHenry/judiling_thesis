using JudiLing # our package
using CSV # read csv files into dataframes
# using Statistics
# using JLD2
# using FileIO
using DataFrames
# using Random
# using Distributions

# load latin file
latin = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "data", "latin.csv")))

# length
println("length of data")
display(size(latin, 1))

# unique words
println("number of unique words")
display(length(unique(latin[:,:Lexeme])))

# different forms of vocare
println("different forms of vocare")
display(latin[.&(latin[:Lexeme] .== "vocare", 
  latin[:Tense] .== "present", 
  latin[:Voice] .== "active", 
  latin[:Mood] .== "ind"),:])


# homophone
println("homophone")
latin_comb = combine(groupby(latin, [:Word]), nrow => :count)
display(latin_comb[latin_comb[:count] .> 1,:])

"""
6×2 DataFrame
│ Row │ Word   │ count │
│     │ String │ Int64 │
├─────┼────────┼───────┤
│ 1   │ carpis │ 2     │
│ 2   │ curris │ 2     │
│ 3   │ audiam │ 2     │
│ 4   │ sapiam │ 2     │
│ 5   │ audiar │ 2     │
│ 6   │ sapiar │ 2     │
"""

display(latin[latin[:Word] .== "carpis",:])