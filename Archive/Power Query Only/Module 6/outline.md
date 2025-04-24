# 🗂 Module 6: Combining Monthly Files (Folder Import)

## 🎯 Learning Objectives
By the end of this module, learners will:
- Know how to import and combine multiple files from a folder
- Automatically detect and transform new monthly files
- Understand file metadata (filename, extension, date)
- Build a dynamic query that grows with each reporting cycle

---

## 🧠 Concepts Introduced
- Folder as a data source
- Binary file transformation
- Applying transformations to all files in a folder
- Filtering, renaming, and cleaning columns post-import
- Using filename metadata (e.g., extract month)

---

## 🏢 Scenario Context: Krkoš Monthly Sales

Krkoš exports sales transactions every month into a shared folder.  
Your goal: **automatically combine all monthly CSV files into one dataset** for ongoing analysis and reporting.

You’ll use the Power Query Folder connector to load:
- `sales_jan.csv`
- `sales_feb.csv`
- Additional files in the same format

---

## 📁 Folder Import Workflow

1. **Connect to Folder**  
   Excel → Data → Get Data → From Folder

2. **Filter Files**  
   Keep only `.csv` files with expected structure

3. **Transform Sample File**  
   Promote headers, change column types, clean up

4. **Apply Transform to All Files**  
   Combine all into one table

5. **Add Source Filename Column**  
   Extract month from filename (e.g., "sales_jan")

---

## 🧪 Exercise: Combine Monthly Sales Files

**Files:**
- `sales_jan.csv` (from Module 3)
- `sales_feb.csv` (to be provided)

### Tasks:
1. Place both CSVs into a folder
2. Use “From Folder” in Power Query to import
3. Clean and standardize the combined data
4. Add a new column to extract the month from the filename

---

## 💡 Pro Tips
- Store your files in a dedicated folder and never move them
- Always build transformation logic using the *sample file*
- Keep the file structure consistent (same columns, types)

---

## ✅ Outcomes
- Learner builds a dynamic, auto-updating query
- Understands how to manage folder-based workflows
- Ready to group, summarize, and analyze in Module 7
