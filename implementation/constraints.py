#!/usr/bin/python3

width = 4
height = 8
startx = 18
starty = 104


print('#TEROs: 2 x', width * height)
header = "main_block_design_i/tero_puf_main_block_0/U0/puf/tero_array_"

print(f'set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {{{header}A/gen_tero[*].r/O}}]')
print(f'set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {{{header}B/gen_tero[*].r/O}}]')

for w in range(width):
    for h in range(height):
        print(f'set_property LOC SLICE_X{startx + w*2}Y{starty + h} [get_cells {{{header}A/gen_tero[{h * width + w}].r/u0}}]')
        print(f'set_property LOC SLICE_X{startx + w*2}Y{starty + height + h} [get_cells {{{header}B/gen_tero[{h * width + w}].r/u0}}]')
