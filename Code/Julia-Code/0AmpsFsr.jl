using Pkg
using Plots
using LsqFit

function Lorentzian(x, p0)
    return p0[1] ./ ((x.^2 .- p0[2]^2).^2 .+ p0[3])
end

file = "/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_0A/FPI_scan_data.dat"
Row = readlines(file)

data= Row[2:end]

data = [split(row) for row in data]

data = [parse.(Float64, row) for row in data]

data = hcat(data...)'

#println(data)

integer = data[2:end, 1]
value = data[2:end, 2]

#println(integer)


peak1 = value[1:132]
peak1Integer =  integer[1:132]
peak2 = value[133:232]
peak2Integer =  integer[133:232]
peak3 = value[233:end]
peak3Integer =  integer[233:end]

initialGuess = [1e-13, 1111, 1]

fitResultPeak1 = LsqFit.curve_fit(Lorentzian, peak1Integer, peak1, initialGuess)

println(fitResultPeak1.param)

figure = scatter(integer, value, color="#004877", label=false, grid=false, xlabel="integer", ylabel="value", markersize=2)

plot!(peak1Integer, Lorentzian(peak1, fitResultPeak1.param), color=:red)

display(figure)



#savefig("/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Output/Plots/0AmpFsr.pdf")