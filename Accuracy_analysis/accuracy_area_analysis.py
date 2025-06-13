# Accuracy and Area Analysis for Normal vs Approximate Comparators

# 📊 This notebook visualizes and compares accuracy and gate-level area (gate/wire counts)
# for comparator designs of various bit widths (4, 8, 16, 32) with and without approximation.

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Read the dataset
df = pd.read_csv("accuracy_vs_area.csv")

# Set seaborn style
sns.set(style="whitegrid")

# === 1. Bar Chart: Gate Count Comparison ===
plt.figure(figsize=(10, 6))
sns.barplot(x="Bit_Width", y="Gate_Count", hue="Comparator_Type", data=df)
plt.title("Gate Count Comparison: Normal vs Approximate Comparators")
plt.xlabel("Bit Width")
plt.ylabel("Gate Count")
plt.legend(title="Comparator Type")
plt.tight_layout()
plt.savefig("gate_count_comparison.png")
plt.show()

# === 2. Bar Chart: Wire Count Comparison ===
plt.figure(figsize=(10, 6))
sns.barplot(x="Bit_Width", y="Wire_Count", hue="Comparator_Type", data=df)
plt.title("Wire Count Comparison: Normal vs Approximate Comparators")
plt.xlabel("Bit Width")
plt.ylabel("Wire Count")
plt.legend(title="Comparator Type")
plt.tight_layout()
plt.savefig("wire_count_comparison.png")
plt.show()

# === 3. Line Plot: Accuracy vs Bit Width ===
plt.figure(figsize=(10, 6))
sns.lineplot(data=df, x="Bit_Width", y="Accuracy_Percent", hue="Comparator_Type", marker="o")
plt.title("Accuracy vs Bit Width")
plt.xlabel("Bit Width")
plt.ylabel("Accuracy (%)")
plt.ylim(80, 102)
plt.tight_layout()
plt.savefig("accuracy_vs_bitwidth.png")
plt.show()

# === 4. Summary Table ===
display(df.sort_values(["Bit_Width", "Comparator_Type"]))
