using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day6")

data = []
open("input.txt") do file
    for line in eachline(file)
        push!(data, line)
    end
end

data_2 = split.(split(replace(join(data, " "), r"[ ]{2,}"=>';'), ';'), ' ');

function find_intersect(data)
    u = [split.(i, "") for i in data]
    r = intersect(u...)
    return length(r)
end

function find_result(data)
    result_any = 0
    result_all = 0
    for i = 1:size(data, 1)
        a = string.(data[i])
        b = []
        for j = 1:length(a)
            c = split.(a[j], "")
            append!(b, c)
        end
        d = length(unique(b))
        r = find_intersect(a)
        result_any += d
        result_all += r
    end
    println("anyone yes: $result")
    println("all yes: $result_2")
end

find_result(data_2)