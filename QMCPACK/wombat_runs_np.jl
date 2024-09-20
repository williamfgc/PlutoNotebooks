
using CairoMakie
using Makie
using ColorTypes

function plot_A100_2MPI_2GPU()

    nelectrons = ["48", "96", "192", "384", "768", "1152", "1536", "2304", "3072",
        "6144"]
    thoroughput = [14908.18279, 7534.989052, 3892.273842, 1224.789207,
        471.7572508, 216.0620981, 114.6771432, 39.5576618,
        16.69199885, 1.339620619]
    max_nwalkers_per_gpu = [65535, 65534, 32797, 2047, 2047, 1244, 719, 322, 174, 32]

    fig = barplot(thoroughput, fillto=1, color=:green,
        bar_labels=["w = $i" for i in max_nwalkers_per_gpu],
        label_offset=5,
        label_size=13,
        #flip_labels_at = 0,
        axis=(yscale=log10, ylabel="Throughput (1/s)",
            xticks=(1:10, nelectrons), xticklabelrotation=pi / 8, xlabel="Number of electrons",
        )
    )

    ylims!(0.5, 120000)
    #fig
    current_figure()

    #Makie.save("DMC_GPU_A100.pdf", fig)

end

plot_A100_2MPI_2GPU()