using Pkg
#Pkg.add("LsqFit")
#Pkg.add("Images")
#Pkg.add("ImageIO")
#Pkg.add("LaTeXStrings")
#Pkg.add("LinearAlgebra")
using Plots
using LsqFit
using LaTeXStrings
using LinearAlgebra


file = "/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Data/ManualGeneratedData/DataHallSensor.dat"
Row = readlines(file)

data= Row[2:end]

data = [split(row) for row in data]

data = [parse.(Float64, row) for row in data]

data = hcat(data...)'

current = data[1:end, 1]
magneticField = data[1:end, 2]

scatter(current, magneticField, xlabel="current I [A]", ylabel="magnetic field strength B [T]", title="", grid=false, legend=false, color=:blue, markerszie=5)
