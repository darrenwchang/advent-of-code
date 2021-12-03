using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day5")
data = readdlm("input.txt")

function id(data)
    rows = []
    for i = 1:size(data, 1)
        r = 128
        for j = 1:7
            if data[i][j] == 'F'
                r = r-2^(7-j)
            end
        end
        push!(rows, r-1)
    end

    cols = []
    for i = 1:size(data, 1)
        c = 8
        for j = 8:10
            if data[i][j] == 'L'
                c = c-2^(10-j)
            end
        end
        push!(cols, c-1)
    end

    println("max id: $(maximum(rows.*8 .+ cols))") #989

    full = []
    for i = 11:123
        for j = 0:7
            push!(full, string.(i).*".".*string.(j))
            # push!(full, [i, j])
        end
    end
    full

    a = sort(parse.(Float64, unique(string.(rows).*".".*string.(cols))))
    b = sort(parse.(Float64, unique(full[2:(end-2)])))
    result = parse.(Int64, string.(split(string(setdiff(b,a)[1]), '.')))
    println("my id: $(result[1]*8+result[2])")
end
id(data)