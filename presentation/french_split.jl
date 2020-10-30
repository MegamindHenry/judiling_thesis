using CSV
using JudiLing

french_all = CSV.DataFrame!(CSV.File(joinpath(@__DIR__, "french_all.csv")))
for i in 1:8
  french_i = french_all[1:i*1000,:]

  CSV.write("french_$(i*1000).csv", french_i, quotestrings=true)
end