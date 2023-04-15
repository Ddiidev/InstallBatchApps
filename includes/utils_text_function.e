namespace utils

public function indexOf(sequence element, sequence value)
    integer step = length(element)
    integer len = length(value)
    for i = 1 to len do
        if (i+step > len) then
            step = len - i
        end if
        if equal(element, value[i..i+step-1]) then
            return i
        end if
    end for
    
    return 0
end function