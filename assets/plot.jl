using JosephusProblem  # julia> ]dev ../
using Plots


function main()
    theme(:solarized)
    n = 10_000
    xs, ys = 1:n, Int[josephus_perm(i) for i in 1:n]
    plt = scatter(xs, ys, xlabel = "n", ylabel = "Survivor", label = false)
    savefig(plt, "plot.pdf")
end


main()
