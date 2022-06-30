using OptimalApplication
using Random
using CairoMakie
using DataFrames
using Colors

# solarized red
const accentcolor = (220, 50, 47) ./ 255

#   Sample random market
#   ======================

function samplerandom()
    m = 32
    mkt = VariedCostsMarket(m)

    X, v = optimalportfolio_dynamicprogram(mkt)
    X[:] = invperm(mkt.perm)[X]

    nX = setdiff(1:m, X)

    # GR plots
    # scal = 1.5
    # pl = plot(size = (500, 500), xlabel = "fⱼ", ylabel = "tⱼ", legend = :topright)
    # scatter!(pl, mkt.f[nX], mkt.t[nX], ms = scal * sqrt.(mkt.g[nX]), c = :gray25, msc = :auto, ma = 0.5, label = nothing)
    # scatter!(pl, mkt.f[X], mkt.t[X], m = :utriangle, ms = scal * sqrt.(mkt.g[X]), c = accentcolor, msc = :auto, ma = 0.85, label = "Apply when H = $(mkt.H)")
    # annotate!(pl, [(maximum(mkt.f), 0.9 * maximum(mkt.t), text("(Marker area: gⱼ)  ", 9, :right))])

    scal = 6
    fig2 = Figure(resolution=(1100, 800), backgroundcolor=:transparent)

    ax = Axis(fig2[1, 1], xlabel="admissions probability", ylabel="school utility",
    	xlabelsize=36,
    	ylabelsize=36,
    	xticklabelsize=24,
    	yticklabelsize=24,
    	backgroundcolor=:transparent)

    scatter!(mkt.f[nX], mkt.t[nX], markersize=scal * sqrt.(mkt.g[nX]), color=RGBA(0.25, 0.25, 0.25, 0.9)) #:gray25, strokealpha=0.5)
    scatter!(mkt.f[X], mkt.t[X], marker=:utriangle, markersize=1.6 * scal * sqrt.(mkt.g[X]), color=RGBA(accentcolor..., 0.9), label="optimal portfolio")

    axislegend(ax, position=:rt, labelsize=36, bgcolor=:transparent)
    text!("(marker size: application cost)", position=(maximum(mkt.f), 0.8 * maximum(mkt.t)), align=(:right, :baseline), textsize=36)

    return fig2
end

fig2 = samplerandom()
save("poster/samplerandom.svg", fig2)
