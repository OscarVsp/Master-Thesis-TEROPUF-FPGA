#!/usr/bin/python3

width = 2
height = 8
startx = 18
starty = 104


print('#TEROs: 2 x', width * height)
header = "cell_testing_i/ro_array_0/U0/"

print(f'set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {{{header}tero_array_0/gen_tero[*].r/O}}]')
print(f'set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {{{header}tero_array_1/gen_tero[*].r/O}}]')

for w in range(width):
    for h in range(height):
        print(f'set_property LOC SLICE_X{startx + w*2}Y{starty + h} [get_cells {{{header}tero_array_0/gen_tero[{h * width + w}].r/u0}}]')
        print(f'set_property LOC SLICE_X{startx + w*2}Y{starty + height + h} [get_cells {{{header}tero_array_1/gen_tero[{h * width + w}].r/u0}}]')
