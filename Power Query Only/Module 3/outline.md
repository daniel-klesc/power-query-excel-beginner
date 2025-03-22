# 📥 Module 3: Connecting to Data Sources

## 🎯 Learning Objectives
By the end of this module, learners will:
- Know how to load data into Power Query from various sources
- Understand the difference between loading data from a file vs a folder
- Learn how to refresh and update queries when the source data changes
- Handle common data source issues like changing file paths or formats

---

## 🧠 Concepts Introduced
- Supported data sources in Power Query
- Workbook vs external source (CSV, folder)
- Dynamic refresh behavior
- Data profiling at import stage

---

## 🏢 Scenario Context: Krkoš Data Landscape

As a new analyst at Krkoš, you're given:
- CSV files with monthly sales
- Excel files with inventory and product catalog
- Manual dealer Excel reports

Your task: Connect and manage these sources with Power Query.

---

## 🧰 Common Data Sources

| Source Type | Example File         | Use Case                     |
|-------------|----------------------|------------------------------|
| Excel       | `product_catalog.xlsx` | Master data lookup (static) |
| CSV         | `sales_jan.csv`      | Monthly transactional data   |
| Folder      | `/sales_monthly/`    | Combine multiple months      |
| Manual Excel | `dealer_notes.xlsx`  | Semi-structured reports      |

---

## 🧪 Exercise: Import Sales CSV into Power Query

**File:** `sales_jan.csv`  
[Download here](sandbox:/mnt/data/sales_jan.csv)

### Task:
1. Load into Power Query:  
   Excel → Data → Get Data → From File → From Text/CSV

2. Check:
   - Delimiters
   - Column types
   - Header row

3. Press Transform Data
.
4. Rename the query to: `SalesJanuary`

---

## 🛠 Mini Challenges
- Change a value in the CSV → Refresh
- Move the file → Handle missing source error
- Use **Data Source Settings** to fix path
