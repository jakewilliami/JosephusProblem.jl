module JosephusProblem

# TODO: Add options to customise skip distance, start position, and direction

export josephus_perm

function msb_pos(n::T) where {T <: Integer}
    # Get the position (0-indexed) of the most significant bit
    # See also Base.top_set_bit
    # Equivalently: floor(Int, log2(n))

    return 8sizeof(n) - leading_zeros(n) - 1
end

function highest_one_bit(n::T) where {T <: Integer}
    # Get the largest power of 2 that is ≤ n
    # See also Java's Integer.highestOneBit

    return n & (1 << msb_pos(n))
end

function josephus_perm(n::T) where {T <: Integer}
    # Credit for solution: Todd Rangiwhetu
    return (n - highest_one_bit(n)) << 1 + 1

    # Equivalently:
    # ~highest_one_bit(2n) & ((n << 1) | 1)
    # Ref: https://en.wikipedia.org/wiki/Josephus_problem#Bitwise

    # Equivalent solution by Dillon Mayhew:
    # (n & ~(1 << msb_pos(n))) << 1 + 1
    # In which we clear the most significant bit and double the result
end

end
