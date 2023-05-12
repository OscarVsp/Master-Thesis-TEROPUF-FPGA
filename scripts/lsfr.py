from typing import List, Tuple

def state_to_str(state: List[bool]):
    string = ''.join(["1" if bit else "0" for bit in state])
    return string
    
def lsfr(state: List[bool]):
    return [state[9] != state[6]] +  state[:9]

state = [True]+[False for _ in range(9)]

combinaisons: List[Tuple[str, str]] = []

for i in range(1023):
    selection_1 = state_to_str(state[:5])
    selection_2 = state_to_str(state[5:])
    print(f"{i}:    {selection_1} | {selection_2}")
    combinaisons.append((selection_1,selection_2 ))
    state = lsfr(state)
    
array_1_occurence = [0]*32
array_2_occurence = [0]*32

for comb in combinaisons:
    array_1_occurence[int(comb[0],2)] += 1
    array_2_occurence[int(comb[1],2)] += 1
   
            
print(array_1_occurence)
print(array_2_occurence)