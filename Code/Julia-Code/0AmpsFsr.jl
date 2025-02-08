using Pkg
using Plots
using LsqFit

function Lorentzian(x, p)
    return p[1] ./ ((x.^2 .- p[2]^2).^2 .+ (p[3]^2 * p[2]^2))
end

file = "/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_0A/FPI_scan_data.dat"
Row = readlines(file)

data= Row[2:end]

data = [split(row) for row in data]

data = [parse.(Float64, row) for row in data]

data = hcat(data...)'

#println(data)

integer = data[2:end, 1]
value = data[2:end, 2] ./ 10000

#println(integer)


peak1 = value[1:132]
peak1Integer =  integer[1:132]
peak2 = value[133:232]
peak2Integer =  integer[133:232]
peak3 = value[233:end]
peak3Integer =  integer[233:end]

p0_1 = 4e7
p0_2 = 6400
p0_3 = 1e4

initialGuess = [p0_1, p0_2, p0_3]

fitResultPeak1 = LsqFit.curve_fit(Lorentzian, peak2Integer, peak2, initialGuess)

println(fitResultPeak1.param)

#figure = scatter(integer, value, color="#004877", legend=false, label=false, grid=false, xlabel="integer value", ylabel="intensity value", markersize=2.5)

#figure = plot!(peak2Integer, Lorentzian(peak2Integer, fitResultPeak1.param), color=:red)

figure = plot(peak2Integer, Lorentzian(peak2Integer, [8000, 250])) #[30e6, 8000, 750e10]

scatter!(integer, value, color="#004877", legend=false, label=false, grid=false, xlabel="integer value", ylabel="intensity value", markersize=2.5)

display(figure)



#savefig("/home/niccollingro/Dokumente/FoPra/FoPra-Zeeman/Output/Plots/0AmpFsr.pdf")