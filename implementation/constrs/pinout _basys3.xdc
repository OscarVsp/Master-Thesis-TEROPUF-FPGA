# TODO: check and diff with nexys (debuging ?)

#BASYS-3

#Implementation
set_property PACKAGE_PIN T18 [get_ports reset]
set_property PACKAGE_PIN W5 [get_ports sys_clock]
set_property PACKAGE_PIN B18 [get_ports usb_uart_rxd]
set_property PACKAGE_PIN A18 [get_ports usb_uart_txd]

set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_txd]

#Debuging

set_property PACKAGE_PIN L1 [get_ports {leds[15]}]
set_property PACKAGE_PIN P1 [get_ports {leds[14]}]
set_property PACKAGE_PIN N3 [get_ports {leds[13]}]
set_property PACKAGE_PIN P3 [get_ports {leds[12]}]
set_property PACKAGE_PIN U3 [get_ports {leds[11]}]
set_property PACKAGE_PIN W3 [get_ports {leds[10]}]
set_property PACKAGE_PIN V3 [get_ports {leds[9]}]
set_property PACKAGE_PIN V13 [get_ports {leds[8]}]
set_property PACKAGE_PIN V14 [get_ports {leds[7]}]
set_property PACKAGE_PIN U14 [get_ports {leds[6]}]
set_property PACKAGE_PIN U15 [get_ports {leds[5]}]
set_property PACKAGE_PIN W18 [get_ports {leds[4]}]
set_property PACKAGE_PIN V19 [get_ports {leds[3]}]
set_property PACKAGE_PIN U19 [get_ports {leds[2]}]
set_property PACKAGE_PIN E19 [get_ports {leds[1]}]
set_property PACKAGE_PIN U16 [get_ports {leds[0]}]
set_property PACKAGE_PIN V17 [get_ports SW0]

set_property IOSTANDARD LVCMOS18 [get_ports {leds[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports SW0]



