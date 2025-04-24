# 🧰 Module 2: Power Query Basics – Meet Your New Best Friend

## 🎯 Learning Objectives
By the end of this module, learners will:
- Know how to launch Power Query in Excel
- Understand the layout of the Power Query Editor
- Recognize the importance of each component: preview pane, steps pane, formula bar, etc.
- Load their first dataset and apply simple transformations

---

## 🧠 Concepts Introduced
- Launching Power Query via “Get & Transform”
- Query = a recipe, not a one-time action
- Applied Steps = transformation history
- Power Query is non-destructive — original data stays safe

---

## 🖥️ Power Query Editor Tour

| Section             | Description |
|---------------------|-------------|
| **Query Pane**      | List of all queries in workbook |
| **Data Preview**    | View of sample data rows |
| **Applied Steps**   | Tracks each transformation |
| **Ribbon**          | Access to tools: transformations, merges, sources |
| **Formula Bar**     | Shows M code for each step |
| **Column Header Row** | Used for selecting, sorting, transforming columns |

💡 *Tip: You can always remove or modify any step in Applied Steps.*

---

## 📥 Exercise: First Load into Power Query

**File:** `module2_raw_sales_data.xlsx`  
[Download here](sandbox:/mnt/data/module2_raw_sales_data.xlsx)

### Task:
1. Open the workbook
2. Load the `Raw_Sales_Data` sheet into Power Query:
   - Option 1) Excel → Data → Get Data → From Workbook
   - Option 2) Excel → Data → From Table/Range

3. Explore the interface:
   - Check column data types
   - Look at the steps (Source → Navigation)
