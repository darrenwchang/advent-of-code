using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day10")

data = vec(readdlm("input.txt"))

data_2 = sort(data)
a = []
for i in 2:length(data_2)
    append!(a, data_2[i] - data_2[i-1])
end 
append!(a, 3.0)
append!(a, 1.0)

sum(a .== 3, dims =1)[1]*sum(a .==1, dims = 1)[1] #2100

# ladders = Any[]

push!(data_2, 0.0)
push!(data_2, 160.0)

data_2 = sort(data_2)

function make_ladder_init(i, df)
    ladders = Any[]
    a = maximum(i)
    if a < 161
        add = [a+1, a+2, a+3]
        for j in add
            if j in df
                c = copy(i)
                push!(ladders, append!(c, j))
            end
        end
    end
    return ladders
end

a = make_ladder_init([1], data_2)

function make_ladder(i, df)
    ladders = Any[]
    for k in i
        a = maximum(k)
        if a < 161
            add = [a+1, a+2, a+3]
            for j in add
                if j in df
                    c = copy(k)
                    push!(ladders, append!(c, j))
                end
            end
        end
    end
    #return ladders
    println(length(ladders))
    return make_ladder(ladders, df)
    # return make_ladder(ladders, df)
end

make_ladder(a, data_2)


# make_ladder([[1, 1], 2], data_2)


# b = make_ladder(a, data_2)

# c = make_ladder(b, data_2)

# make_ladder(c, data_2)
# make_ladd



# make_ladder(data_2[1:15], data_2)

# for i in a
#     println(maximum(i))
# end

# a = make_ladder([1, 2], data_2)

# maximum.(a)

# x = maximum([1])
# add = [x+1, x+2, x+3]

# for j in add
#     if j in data_2
#         push!(ladders, append!([1], j))
#     end
# end

# b = [1]
# a = Any[]
# add = [2, 3, 4]
# for j in add
#     if j in data_2
#         push!(a, append!(b, j))
#     end
# end
# a

# make_ladder([1], data_2)

# a = Any[]
# push!(a, [5, 6])

# a = [1, 2, 3, 4]
# x = Vector{Vector{Int}}()
# for i in 1:10
#     push!(x, [i])
# end
# x
# push!(a, 1:3)

#     result = []
#     while i <= 160
#         add = [i+1 i+2 i+3]
#         for j in add
#             if j in data_2
