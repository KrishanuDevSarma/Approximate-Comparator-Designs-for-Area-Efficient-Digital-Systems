# Area-Efficient Approximate Comparator Designs

&#x20;



The work in this project was done as part of my M.tech course in NIT Silchar as a mini-project. It presents presents a complete design and evaluation framework for **area-efficient approximate comparators** across multiple bit-widths (4, 8, 16, and 32 bits). It includes Verilog-based hardware modules, testbenches, waveform outputs, synthesis reports, and accuracy/area analysis scripts. The main objective is to reduce logic complexity while preserving functional accuracy above 85%.

---

## Project Objective

The project investigates gate-level approximation techniques to reduce the hardware overhead of digital comparators. Key techniques applied across different comparator sizes include:

- **Majority Voting** (used for 4-bit and 8-bit comparators)
- **Gate Substitution**
- **Gate Merging**
- **Combination of Gate Substitution and Merging** (for higher bit-widths like 16-bit and 32-bit)

The goal is to maintain over **85% classification accuracy** while reducing **gate count**, **wire count**, and thus overall area.

---

## Folder Structure

```
approx-comparators/
├── README.md                       # Project overview, methodology, and usage guide
├── LICENSE                         # Open-source license (e.g., MIT)
├── .gitignore                      # Ignore build outputs and waveform files
│
├── Docs/                           # Documentation & write-ups
│   ├── methodology.md              # Explanation of approximation strategies
│   └── results_summary.md          # Summary of accuracy, gate count, and wire count
│
├── Design_files/                   # Verilog modules for normal and approximate comparators
│   ├── comparator_4_bit.v
│   ├── comparator_8_bit.v
│   ├── comparator_16_bit.v
│   ├── comparator_32_bit.v
│   ├── approx_comparator_4_bit.v
│   ├── approx_comparator_8_bit.v
│   ├── approx_comparator_16_bit.v
│   └── approx_comparator_32_bit.v
│
├── Testbench_files/                # Verilog testbenches with automated result checks
│   ├── comparator_4_bit_tb.v
│   ├── comparator_8_bit_tb.v
│   ├── comparator_16_bit_tb.v
│   ├── comparator_32_bit_tb.v
│   ├── approx_comparator_4_bit_tb.v
│   ├── approx_comparator_8_bit_tb.v
│   ├── approx_comparator_16_bit_tb.v
│   └── approx_comparator_32_bit_tb.v
│
├── Waveforms/                      # VCD files generated from testbenches
│   ├── comparator_4_bit_tb.vcd
│   ├── approx_comparator_4_bit_tb.vcd
│   └── ...
│
├── Synthesis_reports/              # Gate and wire count reports generated via Yosys
│   ├── comparator_4_bit_stats.txt
│   ├── approx_comparator_4_bit_stats.txt
│   └── ...
│
├── Scripts/                        # Synthesis automation scripts
│   └── synth_comparators.tcl       # Yosys script to synthesize all modules
│
└── Accuracy_analysis/              # CSV data, analysis scripts, and plots
    ├── accuracy_comparison.csv
    ├── accuracy_area_analysis.py
    ├── accuracy_vs_bitwidth.png
    ├── gate_count_comparison.png
    └── wire_count_comparison.png
```

---

## Included Designs

### Normal Comparators:

- `comparator_4_bit.v`
- `comparator_8_bit.v`
- `comparator_16_bit.v`
- `comparator_32_bit.v`

### Approximate Comparators:

- `approx_comparator_4_bit.v`
- `approx_comparator_8_bit.v`
- `approx_comparator_16_bit.v`
- `approx_comparator_32_bit.v`

Approximate designs apply simplifications to reduce complexity while ensuring acceptable accuracy. Techniques used include MSB prioritization (majority voting), gate-level simplifications, and logic merging.

---

## Simulation Instructions

To simulate any comparator and generate the waveform:

```bash
cd Testbench_files
iverilog -o run_tb approx_comparator_8_bit_tb.v ../Design_files/approx_comparator_8_bit.v
vvp run_tb
gtkwave ../Waveforms/approx_comparator_8_bit_tb.vcd
```

Make sure the respective design and testbench files are referenced correctly.

---

## Synthesis Instructions

To run synthesis using Yosys, use the script provided in the `Scripts/` folder:

```bash
cd Scripts
yosys -s synth_comparators.tcl
```

This will generate synthesis reports (`*.txt` and `*.json`) in the `Synthesis_reports/` folder.

---

## Accuracy and Area Analysis

Statistical results have been compiled in `Accuracy_analysis/` and visualized using Python scripts. You can run:

```bash
cd Accuracy_analysis
python3 accuracy_area_analysis.py
```

To regenerate plots such as:

- Accuracy vs Bit Width
- Gate Count Comparison
- Wire Count Comparison

---

## Example Evaluation Results

| Comparator    | Gates Saved (%) | Accuracy (%) |
| ------------- | --------------- | ------------ |
| 4-bit Approx  | 31.25%          | 90%          |
| 8-bit Approx  | 40.00%          | 89%          |
| 16-bit Approx | 45.21%          | 87%          |
| 32-bit Approx | 47.12%          | 86%          |

These results validate the area-efficiency of the approximate designs, particularly for higher bit-width comparators.

---

## Documentation

- [`Docs/methodology.md`](Docs/methodology.md): Techniques used across comparator designs
- [`Docs/results_summary.md`](Docs/results_summary.md): Accuracy and gate/wire count analysis

---

## License

This project is licensed under the **MIT License**. Refer to `LICENSE` for more details.

---

## Contributors

- **Krishanu Dev Sarma** – RTL Design, Approximation Strategy, Evaluation

---

## Future Work

- Extend to comparators with sign and overflow handling
- Explore dynamic or adaptive approximation based on input data patterns
- Apply the same strategies to arithmetic circuits (e.g., adders, multipliers)
- Integrate formal verification to validate approximation correctness bounds

---

Thank you for exploring this repository. Contributions and suggestions are welcome. Please feel free to open issues or submit pull requests.

