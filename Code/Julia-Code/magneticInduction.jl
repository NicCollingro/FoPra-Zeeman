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

function LinFit(x,p)
    return p[1]*x .+ p[2]
end


file = "/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Data/ManualGeneratedData/DataHallSensor.dat"
Row = readlines(file)

data= Row[2:end]

data = [split(row) for row in data]

data = [parse.(Float64, row) for row in data]

data = hcat(data...)'

current = data[1:end, 1]
magneticField = data[1:end, 2]

currentError = fill(0.25, length(current))
magneticFieldError = fill(0.1, length(magneticField))

p0 = [0.1 , 0]

currentLinear = current[1:7]
magneticFieldLinear = magneticField[1:7]

currentErrorLinear = fill(0.25, length(currentLinear))
magneticFieldErrorLinear = fill(0.1, length(magneticFieldLinear))

weights = 1 ./ magneticFieldErrorLinear
fitResult = LsqFit.curve_fit(LinFit, currentLinear, magneticFieldLinear, weights, p0)
#cov_matrix = LsqFit.covariance_matrix(fitResult)
#param_errors = sqrt.(diag(cov_matrix))
standardError = estimate_errors(fitResult, 0.1)


println("Fit Result : ", fitResult.param)
println("Fit Errors: ", standardError)

scatter(current, magneticField, xerr = currentError, yerr = magneticFieldError, xlabel="current I [A]", ylabel="magnetic field B [T]", title="", grid=false, legend=false, color=:blue, markerszie=5)

x_values = range(0, maximum(current), 150)
y_values = LinFit(x_values, fitResult.param)

plot!(x_values, y_values, color=:red)