using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day11")

data = vec(readdlm("input.txt"))

function occupied_seats(data)
    for i in 1:size(data, 1)
        for j in 1:length(data[i])
            seat_j = 0
            if string(data[i][j+1]) == "L"
                    seat_j += 1
            # end
            end
            # if string(data[i][j+1]) == "L"
            #     seat_j += 1
            # elseif string(data[i][j-1]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i+1][j]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i+1][j+1]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i+1][j-1]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i-1][j]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i-1][j+1]) == "L"
            #     seat_j =+ 1
            # elseif string(data[i-1][j-1]) == "L"
            #     seat_j =+ 1
            # end
            # if string(data[i][j]) == "L" && seat_j == 0
            #     data[i][j] = '#'
            # elseif string(data[i][j]) == "#" && seat_j >= 4
            #     data[i][j] = 'L'
            # end
        end
    end
    return seat_j
    # return sum([count(i->(i=='#'), s) for s in data])
end

occupied_seats(data)

sum([count(i->(i=='L'), s) for s in data])