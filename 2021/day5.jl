input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
f = split.(readlines(joinpath(input_path, "2021/day5.txt")), r",| -> ")
A = B = zeros(Int, 1000, 1000)

map(f) do i
    c = parse.(Int, i)
    if c[1] == c[3]
        d = sort([c[2], c[4]])
        A[c[1], d[1]:d[2]] .+= 1
    elseif c[2] == c[4]
        d = sort([c[1], c[3]])
        A[d[1]:d[2], c[2]] .+= 1
    end
end

sum(A .≥ 2) # 6710

map(f) do i
    c = parse.(Int, i)
    if c[1] == c[3]
        d = sort([c[2], c[4]])
        B[c[1], d[1]:d[2]] .+= 1
    elseif c[2] == c[4]
        d = sort([c[1], c[3]])
        B[d[1]:d[2], c[2]] .+= 1
    elseif c[1] < c[3] & c[2] < c[4]
        [B[j, k] += 1 for (j, k) in zip(c[1]:c[3], c[2]:c[4])]
    elseif c[1] < c[3] & c[2] > c[4]
        [B[j, k] += 1 for (j, k) in zip(c[1]:c[3], c[4]:c[2])]
    elseif c[1] > c[3] & c[2] < c[4]
        [B[j, k] += 1 for (j, k) in zip(c[3]:c[1], c[2]:c[4])]
    elseif c[1] > c[3] & c[2] > c[4]
        [B[j, k] += 1 for (j, k) in zip(c[3]:c[1], c[4]:c[2])]
    end
end

sum(B .≥ 2) # 20121 # 14721, which isn't quite correct

# still working for part 2
# using LinearAlgebra
# CI = CartesianIndex
# _sign(x1,x2) = x1>=x2 ? -1 : 1

# lines = split.(readlines(joinpath(input_path, "2021/day5.txt")), r",| -> ")
# coords = map(lines) do line
#     c = parse.(Int, line)
#     step = CI(_sign(c[1], c[3]), _sign(c[2], c[4]))
#     CI(c[1], c[2]):step:CI(c[3], c[4])
# end

# # part 1
# M = zeros(Int, 1000, 1000)
# for c in coords
#     any(==(1), size(c)) || (M[diag(c)] .+= 1)
# end
# println("P2: ", sum(>=(2), M))