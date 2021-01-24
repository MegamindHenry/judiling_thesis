using Plots

# # matrix multiplications
# x = [i*1000 for i in 1:8]
# j = [0.013408, 0.080052, 0.254958, 0.597726,
# 1.149242, 1.864824, 2.953758, 4.291345]
# r = [0.4992139, 4.99483, 17.01885, 40.38068,
# 1.308422*60, 2.255312*60, 3.595911*60, 5.512381*60]
# j2 = [0.001760, 0.010796, 0.037371, 0.093216,
# 0.176863, 0.300503, 0.447354, 0.605548]
# plot(
#   x,
#   [r,j,j2],
#   yscale=:log10,
#   label=["R" "Julia dense" "Julia sparse"],
#   lw=3,
#   legend=:topleft)

# ylabel!("processing time in log10 (seconds)")
# xlabel!("matrix size (n*n)")
# savefig("matrice_multi.pdf")

# # matrix inversion
# x = [i*1000 for i in 1:8]
# r = [3.060998, 27.407, 1.618517*60, 3.7708*60,
# 7.33105*60, 12.64612*60, 19.74229*60, 29.15476*60]
# j = [0.615498, 3.037425, 10.350937, 24.132630,
# 46.474709, 78.326040, 122.501134, 180.632080]
# c = [0.052646, 0.293304, 0.914362, 1.943002,
# 3.697071, 6.094698, 9.296644, 13.640147]
# plot(
#   x,
#   [r,j,c],
#   yscale=:log10,
#   label=["R (ginv)" "Julia (pinv)" "Julia (Cholesky Decomposition)"],
#   lw=3,
#   legend=:bottomright)

# ylabel!("processing time in log10 (seconds)")
# xlabel!("matrix size (n*n)")
# savefig(joinpath(@__DIR__, "matrice_inverse.pdf"))

# # # matrix inversion
# x = [i*1000 for i in 1:8]
# a01 = [0.38, 2.60, 10.11, 23.99,
# 46.63, 73.68, 120.99, 176.39]
# b01 = [0.31, 3.66, 14.99, 32.76,
# 62.43, 108.04, 149.88, 259.60]
# c01 = b01-a01

# a10 = [0.46, 3.23, 10.46, 23.78,
# 45.77, 87.78, 126.90, 186.95]
# b10 = [0.33, 3.69, 13.42, 32.32,
# 64.54, 104.75, 171.33, 248.88]
# c10 = b10-a10

# a25 = [0.57, 4.16, 14.39, 29.29,
# 54.69, 94.47, 171.62, 232.76]
# b25 = [0.36, 3.9, 12.93, 32.38,
# 63.49, 106.59, 168.70, 245.47]
# c25 = b25-a25

# plot(
#   x,
#   [c01, c10, c25],
#   # yscale=:log10,
#   label=["density: 0.01" "density: 0.10" "density: 0.25"],
#   lw=3,
#   legend=:topleft)

# ylabel!("saving time in seconds")
# xlabel!("matrix size (n*n)")
# savefig(joinpath(@__DIR__, "matrice_inverse_sparse.pdf"))

# cor
x = [i*1000 for i in 1:8]
r = [0.608001, 5.044001, 17.084, 40.63448,
1.333917*60, 2.320588*60, 3.680166*60, 5.494335*60]
j = [0.028953, 0.142271, 0.424581, 0.744895,
1.414849, 2.389524, 3.543785, 5.332756]
plot(
  x,
  [r,j],
  yscale=:log10,
  label=["R" "Julia"],
  lw=3,
  legend=:topleft)

ylabel!("processing time in log10 (seconds)")
xlabel!("dataset size (number of words)")
savefig(joinpath(@__DIR__, "cor.pdf"))

# # path finding
# x = [i for i in 1:16]
# g = [13.87286, 1.175378*60, 3.735496*60, 8.988846*60,
# 15.72438*60, 27.34516*60, 37.83735*60, 57.18072*60,
# NaN,NaN,NaN,NaN,
# NaN,NaN,NaN,NaN]
# l = [0.704841, 2.650155, 8.291816, 21.826310,
# 37.295039, 62.437208, 85.206812, 124.819151,
# 204.151468, 286.889057, 368.259476, 124.819151,
# 37.295039, 62.437208, 85.206812, 124.819151]
# b = [0.136252, 1.007345, 4.823662, 13.217590,
# 25.074029, 42.594684, 60.429467, 90.157625,
# 165.963092, 233.723209, 240.060786, 124.819151,
# 37.295039, 62.437208, 85.206812, 124.819151]
# plot(
#   x,
#   [g,l,b],
#   yscale=:log10,
#   label=["graph based algorithm in WpmWithLdl" "learn_paths in Julia" "build_paths in Julia"],
#   lw=3,
#   legend=:bottomright)

# ylabel!("processing time in log10 (seconds)")
# xlabel!("number of words")
# savefig(joinpath(@__DIR__, "path_finding.pdf"))