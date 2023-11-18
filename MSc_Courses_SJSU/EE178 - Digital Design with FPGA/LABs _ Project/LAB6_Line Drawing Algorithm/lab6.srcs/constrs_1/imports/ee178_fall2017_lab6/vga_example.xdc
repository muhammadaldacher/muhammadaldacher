# Constraints for CLK
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name external_clock -period 10.00 [get_ports clk]

# Constraints for VS and HS
set_property PACKAGE_PIN R19 [get_ports {vs}]
set_property IOSTANDARD LVCMOS33 [get_ports {vs}]
set_property PACKAGE_PIN P19 [get_ports {hs}]
set_property IOSTANDARD LVCMOS33 [get_ports {hs}]

# Constraints for RED
set_property PACKAGE_PIN G19 [get_ports {r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
set_property PACKAGE_PIN H19 [get_ports {r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
set_property PACKAGE_PIN J19 [get_ports {r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
set_property PACKAGE_PIN N19 [get_ports {r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]

# Constraints for GRN
set_property PACKAGE_PIN J17 [get_ports {g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
set_property PACKAGE_PIN H17 [get_ports {g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
set_property PACKAGE_PIN G17 [get_ports {g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
set_property PACKAGE_PIN D17 [get_ports {g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]

# Constraints for BLU
set_property PACKAGE_PIN N18 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN L18 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN K18 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN J18 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

# Constraints for PCLK_MIRROR
set_property PACKAGE_PIN J1 [get_ports {pclk_mirror}]
set_property IOSTANDARD LVCMOS33 [get_ports {pclk_mirror}]

# Constraints for WRITE_DATA
set_property PACKAGE_PIN V17 [get_ports {write_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[0]}]
set_property PACKAGE_PIN V16 [get_ports {write_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[1]}]
set_property PACKAGE_PIN W16 [get_ports {write_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[2]}]
set_property PACKAGE_PIN W17 [get_ports {write_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[3]}]
set_property PACKAGE_PIN W15 [get_ports {write_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[4]}]
set_property PACKAGE_PIN V15 [get_ports {write_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[5]}]
set_property PACKAGE_PIN W14 [get_ports {write_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[6]}]
set_property PACKAGE_PIN W13 [get_ports {write_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_data[7]}]

# Constraints for READ_DATA
set_property PACKAGE_PIN U16 [get_ports {read_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[0]}]
set_property PACKAGE_PIN E19 [get_ports {read_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[1]}]
set_property PACKAGE_PIN U19 [get_ports {read_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[2]}]
set_property PACKAGE_PIN V19 [get_ports {read_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[3]}]
set_property PACKAGE_PIN W18 [get_ports {read_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[4]}]
set_property PACKAGE_PIN U15 [get_ports {read_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[5]}]
set_property PACKAGE_PIN U14 [get_ports {read_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[6]}]
set_property PACKAGE_PIN V14 [get_ports {read_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_data[7]}]

# Constraints for ADDRESS
set_property PACKAGE_PIN U1 [get_ports {address[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[0]}]
set_property PACKAGE_PIN T1 [get_ports {address[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[1]}]
set_property PACKAGE_PIN R2 [get_ports {address[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[2]}]

# Constraints for WRITE
set_property PACKAGE_PIN U18 [get_ports {write}]
set_property IOSTANDARD LVCMOS33 [get_ports {write}]

# Constraints for IRQ
set_property PACKAGE_PIN L1 [get_ports {irq}]
set_property IOSTANDARD LVCMOS33 [get_ports {irq}]

# Constraints for CFGBVS
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
