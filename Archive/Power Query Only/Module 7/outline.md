# 📊 Module 7: Grouping & Summarizing Data

## 🎯 Learning Objectives
By the end of this module, learners will:
- Use the **Group By** feature to summarize data
- Calculate totals, averages, and counts by category or time
- Analyze trends such as top products, best regions, or busiest months
- Prepare summarized tables ready for PivotTables or charts

---

## 🧠 Concepts Introduced
- **Group By**: Aggregate data based on one or more columns
- Aggregation functions:
  - Sum (Total Revenue, Quantity)
  - Count (Transactions, Products)
  - Average (Revenue per Transaction)
  - Max/Min (Highest/lowest values)
- Multi-level grouping (e.g., Region + Product)
- Using grouped outputs in dashboards or reports

---

## 🏢 Scenario Context: Krkoš Performance Reporting

Krkoš management wants quick insights into performance across channels, products, and time periods.

Sample business questions:
- What are the top 5 products by revenue?
- Which region has the highest sales volume?
- How many products are sold monthly?
- What’s the average revenue per sale in each store?

---

## 🛠️ Group By Workflow

1. Select column(s) to group by (e.g., Product Code, Region)
2. Choose an aggregation:
   - Sum, Count, Average, Max, Min
3. (Optional) Add additional aggregations or columns
4. Rename and format results for reporting

---

## 🧪 Exercise: Summarize Monthly Sales

**Input:** Combined monthly sales (from Module 6)

### Tasks:
1. Load the folder-based query or merged table
2. Group by:
   - **Product Code** → Sum of Quantity, Revenue
   - **Region** → Count of transactions
   - **Date (Month)** → Sum of Revenue
3. Sort results to show top products or regions
4. (Optional) Keep only top 5 results using filters

---

### Bonus:
- Group by **Store + Product** to analyze top-performing combinations
- Create a column for **Revenue per Unit = Revenue / Quantity**

---

## 💡 Pro Tips
- Always rename grouped columns to something meaningful
- Add multiple aggregations at once using the "Advanced" Group By option
- Combine Group By with filters for "Top N" reporting

---

## ✅ Outcomes
- Learner can summarize large datasets into actionable tables
- Knows how to calculate business KPIs using Group By
- Prepared to analyze time-based trends in Module 8
