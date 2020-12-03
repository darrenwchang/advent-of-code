using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day3")
data = readdlm("input.txt")

data_2 = data.^321;

function trees(r, d)
    count = 0
    # i = 1
    j = 1
    if d > 1
        for i in 1:size(data_2, 1)
            if (i*d-(d-1) <= size(data_2, 1))
                if (string(data_2[i*d-(d-1)][j]) == "#")
                    count += 1
                end
            end
            j += r
        end
    else
        for i in 1:size(data_2, 1)
            if (string(data_2[i][j]) == "#")
                count += 1
            end
            j += r
        end
    end
    return count
end

trees(3,1) # 211

trees(1,1)*trees(3,1)*trees(5,1)*trees(7,1)*trees(1,2) # 3584591857