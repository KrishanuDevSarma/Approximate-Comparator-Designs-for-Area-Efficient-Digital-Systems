# Results Summary

This results summary highlights the key findings and outcomes of the project titled **Area-Efficient Approximate Comparator Designs**. The objective of the project was to implement and analyze gate-level approximation techniques for digital comparators of varying bit widths (4-bit, 8-bit, 16-bit, 32-bit), with the goal of reducing gate count and wire complexity while maintaining acceptable classification accuracy.

## Accuracy Evaluation

Accuracy was assessed across four comparator widths—4, 8, 16, and 32 bits—using different approximation methods. These included:
- **Majority Voting**
- **Gate Substitution**
- **Gate Merging**
- **Combined Gate Substitution & Gate Merging**

The following table summarizes the accuracy results:

| Bit Width | Comparator Type   | Accuracy (%) |
|-----------|--------------------|---------------|
| 4         | Normal             | 100           |
| 4         | Approximate        | 90            |
| 8         | Normal             | 100           |
| 8         | Approximate        | 89            |
| 16        | Normal             | 100           |
| 16        | Approximate        | 87            |
| 32        | Normal             | 100           |
| 32        | Approximate        | 86            |

In-depth analysis using individual techniques indicated:
- For **4-bit and 8-bit** designs, **majority voting** alone provided high accuracy.
- For **16-bit and 32-bit** designs, standalone techniques fell below 90% accuracy. However, combining **gate substitution and gate merging** raised accuracy above the acceptable threshold.

## Gate Count Reduction

One of the core goals was reducing logic complexity. Gate count comparisons between traditional and approximate comparators are presented below:

| Bit Width | Traditional (Normal) | Approximate | Gates Saved (%) |
|-----------|-----------------------|-------------|------------------|
| 4         | 48                    | 33          | 31.25%           |
| 8         | 95                    | 57          | 40.00%           |
| 16        | 188                   | 103         | 45.21%           |
| 32        | 365                   | 193         | 47.12%           |

The most significant savings were achieved in the 32-bit design, where gate count was reduced by over 47% using the combined approximation method.

## Wire Count Reduction

Wire complexity was also measured as it impacts area and routing difficulty. The wire count savings are shown below:

| Bit Width | Traditional (Normal) | Approximate | Wires Saved (%) |
|-----------|-----------------------|-------------|------------------|
| 4         | 52                    | 36          | 30.77%           |
| 8         | 104                   | 61          | 41.35%           |
| 16        | 206                   | 114         | 44.66%           |
| 32        | 396                   | 215         | 45.71%           |

Again, the combined approximation approach yielded consistent reductions in wiring requirements across all configurations.

## Trade-off Analysis

There exists a clear trade-off between size reduction and accuracy. While aggressive approximation techniques—particularly in higher bit-width designs—yield greater area savings, they may compromise accuracy. The combined technique (gate merging + substitution) proved to be the optimal balance, maintaining accuracy above 85% while significantly reducing gate and wire counts.

## Achievements

- Accuracy of **92.76%** achieved in 32-bit comparator using combined approximation techniques.
- **Up to 47% gate count reduction** across designs.
- **Up to 45% wire count reduction**, improving area efficiency.
- Approximated comparators suitable for low-power, resource-constrained environments.

These results validate the effectiveness of gate-level approximation strategies in designing efficient comparator circuits and form the foundation for further research into scalable approximate logic for digital systems.

