using DelimitedFiles
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day7")
data = readdlm("input.txt")

a = []
b = []
for i in 1:size(data, 1)
    push!(a, join(data[i, :][1:2]))
    # push!(b, [join(data[i, :][5:7]) join(data[i, :][9:11]) join(data[i, :][13:15]) join(data[i, :][17:19])])
    push!(b, [join(data[i, :][6:7]) join(data[i, :][10:11]) join(data[i, :][14:15]) join(data[i, :][18:19])])
end
a

for j in 1:length(b)
    b[j] = [s for s in b[j] if !all(isempty.(s))]
end
b

c = Dict(zip(a, b))

# d = []
# [s for s in b[j] if occursin.(b[j], "shinygold") for j in 1:length(b)]

function find_bags(dict, keyword)
    b = collect(values(dict))
    # count = 0
    e = []
    for j in 1:length(b)
        push!(e, occursin.(string.(b[j]), keyword))
    end

    f = findall(x->x==1, sum.(e))

    g = []
    h = []
    for i in f
        push!(g, string(a[i]))
        push!(h, c[string(a[i])])
    end

    l = []
    for i in h
        for x in i
            push!(l, x)
        end
    end
    l = unique(l)
    len = length(l)
    # count+=1
    return l
    # if len == length(vcat(l, keyword))
    #     return len
    # else
    #     for i in vcat(l, keyword)
    #         append!(l, find_bags(c, string(i)))
    #     end
    # end
    # #end
end

m = find_bags(c, "shinygold")
n = find_bags2(c, vcat(m, "shinygold"))
o = find_bags2(c, vcat(n, "shinygold"))
p = find_bags2(c, vcat(o, "shinygold"))
q = find_bags2(c, vcat(p, "shinygold"))
r = find_bags2(c, vcat(q, "shinygold"))
s = find_bags2(c, vcat(r, "shinygold"))
t = find_bags2(c, vcat(s, "shinygold"))
u = find_bags2(c, vcat(t, "shinygold"))
v = find_bags2(c, vcat(u, "shinygold"))
w = find_bags2(c, vcat(v, "shinygold"))
y = find_bags2(c, vcat(w, "shinygold"))
z = find_bags2(c, vcat(y, "shinygold"))
ab = find_bags2(c, vcat(z, "shinygold"))
ac = find_bags2(c, vcat(ab, "shinygold"))


unique(vcat(m, n, o, p, q, r, s, t, u, v, w, y, z, ab, ac, "shinygold"))







function find_bags2(dict, input)
    output = []
    for i = 1:size(m, 1)
        append!(output, find_bags(dict, input[i]))
        return unique(output)
    end
end



n = find_bags2(c, m)
find_bags2(c, n)



for i in l
    c[i]

for i in 

occursin.(string(b[500]), "shinygold")

unique(data[:, 1].*data[:, 2])