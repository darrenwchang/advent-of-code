using DelimitedFiles, DataFrames
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day16")

data = readdlm("input.txt")

nearby = data[24:end, 1]

# nb_split = Any[]
# for a in nearby
#     append!(nb_split, split(a, ','))
# end
# nb_split

rules = data[1:20, :]

df = DataFrame(split.(nearby, ","))

# part 1
rule_num = []
for i in 1:20
    if i < 11
        append!(rule_num, split.(rules[i, :], "-")[3])
        append!(rule_num, split.(rules[i, :], "-")[5])
    else
        append!(rule_num, split.(rules[i, :], "-")[2])
        append!(rule_num, split.(rules[i, :], "-")[4])
    end
end
rule_num;

range_num = []
for i in 1:79
    if isodd(i)
        append!(range_num, parse(Int64, rule_num[i]):parse(Int64, rule_num[i+1]))
    end
end
range_num # = unique(range_num)

df_col = []
    for i in 1:size(df, 2)
    append!(df_col, vec(df[:, i]))
end
df_col

err_rate = 0
for i in 1:size(df_col, 1)
    if parse(Int64, df_col[i]) ∉ range_num
        err_rate += parse(Int64, df_col[i])
    end
end
err_rate #23044

# part 2
df_2 = parse.(Int64, Array(df))

df_2 = df[:, ]

all(df_2 ∈ range_num)

for i in df_2
    println(i)
end

delete = []
for i in 1:size(df_2, 2)
    for j in df_2[:, i]
        if j ∉ range_num
            append!(delete, i)
        end
    end
end
delete

rule_num_2 = parse.(Int64, reshape(vec(rule_num), (4, 20)))

rule_num_3 = []
for i = 1:size(rule_num_2, 2)
    push!(rule_num_3, union(rule_num_2[1, i]:rule_num_2[2, i], rule_num_2[3, i]:rule_num_2[4,i]))
end
rule_num_3

rule_match = []
for i = 1:size(df_2, 1) 
    for j = 1:size(rule_num_3, 1)
        for k in df_2[i, :]
            if k ∉ rule_num_3[j]
                append!(rule_match, 0)
            else
                append!(rule_match, 1)
            end
        end
    end
end
A = reshape(vec(rule_match), (190, 20, 20))

for i=1:20
    println(sum(A[:, :, i], dims = 1))
end

A[:, :, 20]
