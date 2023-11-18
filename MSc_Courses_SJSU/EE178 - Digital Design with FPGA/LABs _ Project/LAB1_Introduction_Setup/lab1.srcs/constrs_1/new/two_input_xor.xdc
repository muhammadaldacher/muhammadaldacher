# Constraints for SW0
set_property PACKAGE_PIN V17 [get_ports {in1}]
set_property IOSTANDARD LVCMOS33 [get_ports {in1}]
# Constraints for SW1
set_property PACKAGE_PIN V16 [get_ports {in2}]
set_property IOSTANDARD LVCMOS33 [get_ports {in2}]
# Constraints for LD0
set_property PACKAGE_PIN U16 [get_ports {out}]
set_property IOSTANDARD LVCMOS33 [get_ports {out}]
# Constraints for CFGBVS
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]