module JosephusProblem

# TODO: Add options to customise skip distance, start position, and direction

export josephus_perm

function highest_one_bit(n::T) where {T <: Integer}
    # Get the largest power of 2 that is ≤ n
    # See also Java's Integer.highestOneBit

    msb_pos = 8sizeof(n) - leading_zeros(n) - 1
    # See also Base.top_set_bit
    # Equivalently: msb_pos = floor(Int, log2(n))

    return n & (1 << msb_pos)
end

function josephus_perm(n::T) where {T <: Integer}
    # Credit for solution: Todd Rangiwhetu
    return (n - highest_one_bit(n)) << 1 + 1

    # Equivalently:
    # ~highest_one_bit(2n) & ((n << 1) | 1)
    # Ref: https://en.wikipedia.org/wiki/Josephus_problem#Bitwise

    # Possible start to solution (Dillon Mayhew):
    # (n >> 1) << 1
end

end
