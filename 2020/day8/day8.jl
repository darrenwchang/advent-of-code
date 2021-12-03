using DelimitedFiles, DataFrames
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day8")

data = readdlm("input.txt")

df = DataFrame(data)

df.count = repeat([0], size(df, 1))

df.x2 = Float64.(df.x2)
df.x1 = string.(df.x1)
df.count = repeat([0], size(df, 1))

function find_acc(df, i)
    acc = 0
    if df[i, :count] == 1
        return acc
    elseif df[i, :x1] == "acc"
        acc += df[i, :x2]
        df[i, :count] += 1
        i += 1
    elseif df[i, :x1] == "jmp"
        df[i, :count] += 1
        i = i + df[i, :x2]
    else
        df[i, :count] += 1
        i += 1
    end

    return find_acc(df, Int64(i))
end

function find_acc_wrap(df, i)
    find_acc(df, i)
    acc = 0
    for i in 1:size(df, 1)
        if (df[i, :x1] == "acc") && (df[i, :count] == 1)
            acc += df[i, :x2]
            # sum(df[i, :x2])
        end
    end
    return acc
end

find_acc_wrap(df, 1) #1548

df.count = repeat([0], size(df, 1))

for i = 1:size(df, 1)
    if df[i, :x1] == "jmp"
        df[i, :x1] = "nop"
        find_acc(df, 1)
        if df[647, :count] == 1
            println(i)
        else
            df.count = repeat([0], size(df, 1))
            df[i, :x1] = "jmp"
        end
    end
end
find_acc_wrap(df, 1) #1375

df.count = repeat([0], size(df, 1))

for i = 1:size(df, 1)
    if df[i, :x1] == "nop"
        df[i, :x1] = "jmp"
        find_acc(df, 1)
        if df[647, :count] == 1
            println(i)
            # find_acc_wrap(df, 1)
        else
            df.count = repeat([0], size(df, 1))
            df[i, :x1] = "nop"
        end
    end
end