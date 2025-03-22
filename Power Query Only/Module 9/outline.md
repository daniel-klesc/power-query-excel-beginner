# 📦 Module 9: Loading Data to Excel

## 🎯 Learning Objectives
By the end of this module, learners will:
- Understand the different load options in Power Query
- Load transformed data into tables, PivotTables, or just connections
- Control where and how the data appears in Excel
- Set up refreshable reports that stay up-to-date with new data

---

## 🧠 Concepts Introduced

- **Load Options** after closing Power Query:
  - Table
  - PivotTable Report
  - PivotChart
  - Create connection only

- Refresh settings:
  - Manual refresh
  - Refresh on file open
  - Background refresh

- Query dependency and data model basics

---

## 🏢 Scenario Context: Krkoš Reports to Management

You’ve built clean, enriched, and summarized data.  
Now it’s time to deliver it as a report the management team can use easily — in **Excel**.

Your goal:
- Show monthly revenue trends in a PivotChart
- List top products in a table
- Ensure the report auto-refreshes when new data is added

---

## 🛠️ Common Load Scenarios

| Goal                           | Load Option     |
|--------------------------------|-----------------|
| Report table with filters      | Table           |
| Summary with drag-and-drop     | PivotTable      |
| Dashboard-ready chart          | PivotChart      |
| Reusable query for later steps | Connection only |

---

## 🧪 Exercise: Build a Refreshable Report

**Input:** Sales data with time intelligence (from Module 8)

### Tasks:
1. Load the final query into a **PivotTable**
2. Set rows to `Month`, columns to `Product`, values to `Revenue`
3. Add a **PivotChart** (column chart)
4. Rename the worksheet to `Monthly Report`
5. Enable:
   - Refresh on open
   - Background refresh (optional)

---

### Bonus:
- Load top 5 products into a separate table using filters
- Create a slicer for `Season` or `Region`

---

## 💡 Pro Tips

- Use meaningful worksheet and query names
- PivotTables are great for flexible summaries — no formulas needed
- Save the workbook in a known location so data sources can be found on refresh

---

## ✅ Outcomes

- Learner can load data to different Excel destinations
- Can create basic dashboards with auto-refresh
- Prepared for final project and wrap-up in Module 10
