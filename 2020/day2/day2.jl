using DelimitedFiles, DataFrames
cd("$(pwd())/Documents/_econ/advent-of-code-2020/day2")
data = readdlm("input.txt")

a = split.(data[:, 1], '-')
b = split.(data[:, 2], ':', keepempty = false)
c = data[:, 3]

df = DataFrame(min = Int64[], max = Int64[], rule = String[], pw = String[], n = Int64[], pass = Bool[], pass2 = Bool[])
for i = 1:length(a)
    push!(df, [parse(Float64, a[i][1]) parse(Float64, a[i][2]) b[i][1] string(c[i]) 0 false false])
end

for j = 1:size(df, 1)
    df.n[j] = count(i->(i == collect(df[j, :rule])[1]), df[j, :pw])
    df.pass[j] = (df.n[j] <= df.max[j]) && (df.n[j] >= df.min[j])
    df.pass2[j] = (string(df.pw[j][df.min[j]]) == df.rule[j]) ⊻ (string(df.pw[j][df.max[j]]) == df.rule[j])
end
df

sum(df.pass) #666
sum(df.pass2) #670