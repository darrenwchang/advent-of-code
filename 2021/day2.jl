using DelimitedFiles

input_path = joinpath(dirname(dirname(pwd())), "aoc_input")
data = readdlm(joinpath(input_path, "2021/day2.txt"))

# part 1
x = z = 0

for i in 1:size(data,1)
    a = data[i,2]
    if data[i] == "forward"
        x += a
    else z += ifelse(data[i] == "up",-a,a)
    end 
end
x*z # 2091984

# part 2
x = y = z = 0

for i in 1:size(data,1)
    a = data[i,2]
    if data[i] == "forward"
        x += a
        z += a*y
    else y += ifelse(data[i] == "up",-a,a)
    end 
end
x*z # 2086261056
