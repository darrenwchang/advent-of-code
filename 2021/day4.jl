input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
f = split(strip(read(joinpath(input_path, "2021/day4.txt"), String), '\n'), "\n\n")
n = parse.(Int, split(f[1], ","))
boards = map(inputs[2:end]) do board
    parse.(Int, mapreduce(split, hcat, split(board, "\n")))
end

p = fill(-1,5)
win(m) = any(==(p), eachrow(m)) || any(==(p), eachcol(m))

done = Set{Int}()
res = Int[]
for k in n, (i, b) in enumerate(boards)
    replace!(b, k => -1)
    if i∉done && win(b)
        push!(done, i)
        push!(res, k * sum(filter(>(0), b)))
    end
end

res[[begin, end]]
