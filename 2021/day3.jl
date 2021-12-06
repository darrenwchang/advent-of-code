using DataFrames, DelimitedFiles

input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
f = readlines(joinpath(input_path, "2021/day3.txt"))

A = zeros(length(f), length(f[1]))
for i in 1:length(f)
    for j in 1:length(f[1])
        A[i,j] = parse(Int, f[i][j])
    end
end

# part 1
res = sum(A, dims = 1)/size(A, 1) .>= 0.5

convert_to_dec(v) = parse(Int, join(Int.(v)), base = 2)
γ = convert_to_dec(res)
ϵ = convert_to_dec(.!res)
γ*ϵ # 775304

# # part 2
# j = 1
# A[1:end, 1]


# # will figure this out later
# find_most(A, c) = Int(sum(A[1:end, c])/size(A)[1] >= 0.5)

# keep_most = function(A, c)
#     if c <= size(A,2)
#         z = find_most(A, c)
#         c += 1
#         return (A[A[1:end,c] .== z,1, 1:end], c)
#     end
# end

# keep_most(keep_most(A, 1))

# # part 2
# calc_o2 = function(f)
#     o = f
#     j = 1
#     find_idx = function(j, o)
#         a = 0
#         idx = []
#         for i in 1:length(o)
#             # for j in 1:length(f[1])
#             a += parse(Int, o[i][j])
#             if o[i][j] == string(Int(a/length(o)>=0.5))
#                 push!(idx, i)
#             end
#         end
#         j += 1
#         o = o[idx]
#         return idx
#     end
#     while length(o) > 1
#         j, o = find_idx(j, o)
#     end
#     return(o)
# end

# calc_o2(f)
