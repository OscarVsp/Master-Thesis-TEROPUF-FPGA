# MFE

## Implementation

- [done] RO redo
- [done] RO ECC redo
- [done] TERO
- [done] TERO ECC
- [running] Softcoding of ref_counter_limit (-> driver for configuration)
- Bit selection after statistical analysis for both stability and uniformity (-> driver for configuration), which can be used for the ECC !

## Driver

- Reading (with ref_counter_limit as optional parameter that call below method before)
- Syndrome write
- Ref_counter_limit write
- Bit selection write

## Stats

For both RO and TERO, run all parameters !
board comparaison