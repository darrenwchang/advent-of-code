using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020")
data = readdlm("input.txt")

# part 1
for i in data
    for j in data
        if (i+j) == 2020
            println(i*j)
        end
    end
end

# part 2
for i in data
    for j in data
        for k in data
            if (i+j+k) == 2020
                println(i*j*k)
                @show(i)
                @show(j)
                @show(k)
            end
        end
    end
end