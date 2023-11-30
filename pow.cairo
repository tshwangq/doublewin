%lang starknet

from starkware.cairo.common.math import abs_value, assert_nn, assert_le, sqrt, unsigned_div_rem, signed_div_rem
from starkware.cairo.common.math_cmp import is_le, is_nn, is_in_range
from starkware.cairo.common.pow import pow
from starkware.cairo.common.serialize import serialize_word

func recursive_calc_pow{range_check_ptr}(x, p) -> (y):
    alloc_locals

    if p == 0:
        return (1)
    end

    if p == 1:
        return (x)
    end

    let (div, rem) = unsigned_div_rem(p, 2)

    let (local res) = recursive_calc_pow(x * x, div)

    if rem == 1:
        return (res * x)
    end

    return (res)
end
