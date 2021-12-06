using DataFrames, DelimitedFiles

input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
f = readlines(joinpath(input_path, "2021/day3.txt"))

gen_matrix(f) = permutedims(reshape([parse(Int, f[i][j]) for i=1:length(f) for j=1:length(f[1])], 
(length(f[1]), length(f))))
convert_to_dec(v) = parse(Int, join(Int.(v)), base = 2)

A = B = gen_matrix(f)

# part 1
res = sum(A, dims = 1)/size(A, 1) .>= 0.5
convert_to_dec(res)*convert_to_dec(.!res) # 775304

# part 2
find_most(B, c) = sum(B[1:end, c])/size(B)[1] >= 0.5

keep_most = function(B, d)
    if size(B,1) > 1
        return B[B[1:end,d] .== Int(find_most(B, d)), 1:end]
    else return B
    end
end

keep_least = function(B, d)
    if size(B,1) > 1
        return B[B[1:end,d] .== Int(!find_most(B, d)), 1:end]
    else return B
    end
end

for j in 1:length(f[1])
    A = keep_most(A, j)
    B = keep_least(B, j)
end

convert_to_dec(A)*convert_to_dec(B) # 1370737
