# Yosys synthesis script for all exact and approximate comparators

# 4-bit Exact Comparator
read_verilog ../Design_files/comparator_4_bit.v
hierarchy -check -top comparator_4_bit
synth -top comparator_4_bit
stat > ../synthesis_reports/comparator_4_bit_stats.txt
write_json ../synthesis_reports/comparator_4_bit.json
clean


# 4-bit Approximate Comparator
read_verilog ../Design_files/approx_comparator_4_bit.v
hierarchy -check -top approx_comparator_4_bit
synth -top approx_comparator_4_bit
stat > ../synthesis_reports/approx_comparator_4_bit_stats.txt
write_json ../synthesis_reports/approx_comparator_4_bit.json
clean


# 8-bit Exact Comparator
read_verilog ../Design_files/comparator_8_bit.v
hierarchy -check -top comparator_8_bit
synth -top comparator_8_bit
stat > ../synthesis_reports/comparator_8_bit_stats.txt
write_json ../synthesis_reports/comparator_8_bit.json
clean


# 8-bit Approximate Comparator
read_verilog ../Design_files/approx_comparator_8_bit.v
hierarchy -check -top approx_comparator_8_bit
synth -top approx_comparator_8_bit
stat > ../synthesis_reports/approx_comparator_8_bit_stats.txt
write_json ../synthesis_reports/approx_comparator_8_bit.json
clean


# 16-bit Exact Comparator
read_verilog ../Design_files/comparator_16_bit.v
hierarchy -check -top comparator_16_bit
synth -top comparator_16_bit
stat > ../synthesis_reports/comparator_16_bit_stats.txt
write_json ../synthesis_reports/comparator_16_bit.json
clean


# 16-bit Approximate Comparator
read_verilog ../Design_files/approx_comparator_16_bit.v
hierarchy -check -top approx_comparator_16_bit
synth -top approx_comparator_16_bit
stat > ../synthesis_reports/approx_comparator_16_bit_stats.txt
write_json ../synthesis_reports/approx_comparator_16_bit.json
clean


# 32-bit Exact Comparator
read_verilog ../Design_files/comparator_32_bit.v
hierarchy -check -top comparator_32_bit
synth -top comparator_32_bit
stat > ../synthesis_reports/comparator_32_bit_stats.txt
write_json ../synthesis_reports/comparator_32_bit.json
clean


# 32-bit Approximate Comparator
read_verilog ../Design_files/approx_comparator_32_bit.v
hierarchy -check -top approx_comparator_32_bit
synth -top approx_comparator_32_bit
stat > ../synthesis_reports/approx_comparator_32_bit_stats.txt
write_json ../synthesis_reports/approx_comparator_32_bit.json
clean

