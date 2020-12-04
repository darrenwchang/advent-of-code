using DelimitedFiles, DataFrames
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day4")

data = []
open("input.txt") do file
    for line in eachline(file)
        push!(data, line)
    end
end

data_2 = split.(split(replace(join(data, " "), r"[ ]{2,}"=>';'), ';'), ' ')

function valid_num(data)
    count = 0
    for i in 1:size(data, 1)
        if size(data[i], 1) == 8
            count += 1
        elseif size(data[i], 1) == 7
            if sum(occursin.("cid", data[i])) == 0
                count +=1
            end
        end
    end
    return count
end

valid_num(data_2) #200

function valid_pass(data) 
    count = 0
    valid = []
    for i in 1:size(data, 1)
        if size(data[i], 1) == 8
            push!(valid, data[i])
        elseif size(data[i], 1) == 7
            if sum(occursin.("cid", data[i])) == 0
                push!(valid, data[i])
            end
        end
    end
    valid

    df = DataFrame()
    for i in 1:size(valid, 1)
        a = split.(valid[i], ':')
        b = []
        c = []
        for i = 1:size(a, 1)
            push!(b, a[i][1])
            push!(c, a[i][2])
        end

        d = Dict(zip(b, c))
        if (haskey(d, "cid")) == false
            push!(d, "cid" => "n")
        elseif (haskey(d, "hcl")) == false
            push!(d, "hcl" => "n")
        elseif (haskey(d, "ecl")) == false
            push!(d, "ecl" => "n")
        elseif (haskey(d, "hgt")) == false
            push!(d, "hgt" => "n")
        elseif (haskey(d, "pid")) == false
            push!(d, "pid" => "n")
        elseif (haskey(d, "iyr")) == false
            push!(d, "iyr" => "n")
        elseif (haskey(d, "eyr")) == false
            push!(d, "eyr" => "n")
        elseif (haskey(d, "byr")) == false
            push!(d, "byr" => "n")
        end
        append!(df, DataFrame(;[Symbol(k)=>v for (k,v) in d]...))
    end

    df.hcl = string.(df.hcl);
    df.ecl = string.(df.ecl);

    function string_to_int(int)
        try
            parse(Int64, int)
        catch
            0
        end
    end
    df.hgt = string.(df.hgt);
    df.iyr = string_to_int.(df.iyr);
    df.eyr = string_to_int.(df.eyr);
    df.cid = string_to_int.(df.cid);
    df.byr = string_to_int.(df.byr);

    a = [(occursin.(r"^[0-9]{3,}cm$", df.hgt[i]) || occursin.(r"^[0-9]{2,}in$", df.hgt[i])) == false for i in 1:size(df.hgt, 1)]
    for i in 1:size(df.hgt, 1)
        if a[i] == true
            df.hgt[i] = "0"
        end
    end

    df_pass = DataFrame(byr = Bool[], iyr = Bool[], eyr = Bool[], hgt = Bool[], hcl = Bool[], ecl = Bool[], pid = Bool[], all = Bool[])

    for i = 1:size(df, 1)
        a = ((df.byr[i] >= 1920) && (df.byr[i] <= 2002))
        b = ((df.iyr[i] >= 2010) && (df.iyr[i] <= 2020))
        c = ((df.eyr[i] >= 2020) && (df.eyr[i] <= 2030))
        if occursin("in", df.hgt[i])
            x = string_to_int(replace(df.hgt[i], "in"=>""))
            d = ((x >= 59) && (x <= 76))
        elseif occursin("cm", df.hgt[i])
            x = string_to_int(replace(df.hgt[i], "cm" =>""))
            d = ((x >= 150) && (x <= 193))
        else
            d = false
        end
        e = occursin(r"^#[a-f0-9]{6,}$", df.hcl[i])
        f = df.ecl[i] in ["amb" "blu" "brn" "gry" "grn" "hzl" "oth"]
        g = occursin(r"^[0-9]{9,}$", df.pid[i])
        # g = length(df.pid[1]) == 9
        h = a && b && c && d && e && f && g
        push!(df_pass, [a b c d e f g h])
    end

    return sum(df_pass.all) 
end

valid_pass(data_2) #117 -1 = 116