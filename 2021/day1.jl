using DelimitedFiles

input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
data = readdlm(joinpath(input_path, "2021/day1.txt"))

# part 1
sum(diff(data, dims = 1).>0) # 1301

# part 2
triples = []
for i in 1:length(data)
    if i+2 <= length(data)
        push!(triples, data[i]+data[i+1]+data[i+2])
    end
end

sum(diff(triples, dims = 1).>0) # 1346
