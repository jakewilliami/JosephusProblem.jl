using JosephusProblem
using Test

@testset "JosephusProblem.jl" begin
    answers = Pair{Int, Int}[
        10     => 5,
        33     => 3,
        100    => 73,
        17     => 3,
        15     => 15,
        9      => 3,
        64     => 1,
        1000   => 977,
        10_000 => 3617,
        1025   => 3,
    ]

    for (a, b) in answers
        @test josephus_perm(a) == b
    end
end


# TODO: Write "dumb" algorithm and check against bitwise answers
#       For example:
#
# function ring(A::Vector{Int}, last::Bool = true)
#     n = length(A)
#     Y = Int[]
#     sizehint!(Y, n ÷ 2)
#     new_last = false
#     for i in 0:(n - 1)
#         p = last ? i % 2 != 0 : i % 2 == 0
#         if p
#             push!(Y, A[i + 1])
#             if i == (n - 1)
#                 new_last = true
#             end
#         end
#     end
#     return Y, new_last
# end
#
# function ring(n::Int)
#     A = Vector{Int}(undef, n)
#     Y = Int[]
#     sizehint!(Y, n ÷ 2)
#     last = false
#     for i in 0:(n - 1)
#         A[i + 1] = i
#         if i % 2 == 0
#             push!(Y, i)
#             if i == (n - 1)
#                 last = true
#             end
#         end
#     end
#     i = 3
#     while length(Y) > 1
#         Y, last = ring(Y, last)
#         i += 1
#     end
#     return only(Y) + 1
# end
