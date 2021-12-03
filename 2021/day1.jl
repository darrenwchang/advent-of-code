using DelimitedFiles

input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
data = readdlm(joinpath(input_path, "2021/day1.txt"))

# part 1
lagged = zeros(length(data))

for i in 1:(length(data)-1)
    lagged[i] = data[i+1]-data[i]
end

sum(lagged .> 0) #1301

# part 2
sums = []

for i in 1:length(data)
    if i+2 <= length(data)
        push!(sums, data[i]+data[i+1]+data[i+2])
    end
end

sums_lagged = zeros(length(sums))
for i in 1:(length(sums)-1)
    sums_lagged[i] = sums[i+1]-sums[i]
end

sum(sums_lagged .> 0) #1346
