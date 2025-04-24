# 🧹 Module 4: Cleaning & Shaping Sales Data

## 🎯 Learning Objectives
By the end of this module, learners will:
- Apply common cleaning steps in Power Query (remove blanks, fix data types, etc.)
- Use transformation tools to restructure messy data
- Understand how each step builds toward a clean and structured output
- Gain confidence working with real-world inconsistencies

---

## 🧠 Concepts Introduced
- Removing unnecessary rows and columns
- Changing and detecting data types
- Splitting column values
- Renaming columns consistently
- Handling nulls, errors, and strange formats

---

## 🏢 Scenario Context: Krkoš Sales Data

The sales data exported monthly from different systems is:
- Messy (mixed date formats, text numbers)
- Contains extra header rows or blank lines
- Combines "Region - Store" in a single column
- Includes inconsistent text casing (e.g., `P001`, `p001`, ` P001 `)

Your task: Clean and shape it for consistent analysis.

---

## 🛠️ Common Transformations Used

| Tool                    | Purpose                                  |
|-------------------------|------------------------------------------|
| Remove Rows             | Delete blanks or extra headers           |
| Change Type             | Ensure numbers/dates are treated correctly |
| Split Column by Delimiter | Separate "Region - Store"             |
| Trim & Clean            | Remove leading/trailing spaces           |
| Replace Values          | Standardize codes or text                |
| Rename Columns          | Improve readability and consistency      |

---

## 🧪 Exercise: Clean January Sales Data

**File:** `sales_jan.csv` (from Module 3)  
[Download here](sandbox:/mnt/data/sales_jan.csv)

### Task:
1. Load the CSV into Power Query (if not already done)
2. Apply the following transformations:
   - Remove blank rows
   - Change column types (Date, Number, Text)
   - Split `"Region - Store"` into two columns: `Region`, `Store`
   - Rename `"Revenue"` to `"Total Revenue"`
   - Trim and clean all text columns

### Bonus Challenge:
- Replace `"P001"` with `"KRK-P001"` to match internal naming convention

---

## 💡 Pro Tips
- Use the **Transform** tab for column-based actions
- Use **View → Column quality / distribution / profile** to spot issues
- Right-click any step in Applied Steps to rename or delete it

---

## ✅ Outcomes
- Learner can apply core cleaning techniques in Power Query
- Understands step-by-step transformation logic
- Ready to merge and enrich data in Module 5
