using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day9")

data = readdlm("input.txt")

for i in 1:(size(data, 1)-25)
    a = data[i:i+24]
    b = []
    for j in a
        append!(b, j.+ a)
    end
    if data[i+25] in b
        i += 1
    else
        return i+25, data[i+25]
    end
end
# 15353384

data_2 = data[1:502];

for i = 1:length(data_2)
    for j in 1:(length(data_2)-i+1)
        if sum(data[i:(i+j)]) == 15353384 && length(data[i:(i+j)]) > 1
            return minimum(data[i:(i+j)]) + maximum(data[i:(i+j)])
        end
    end
end
# 2466556