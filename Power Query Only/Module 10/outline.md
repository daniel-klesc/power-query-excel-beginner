# 🧠 Module 10: Best Practices & Final Project

## 🎯 Learning Objectives
By the end of this module, learners will:
- Understand essential best practices for using Power Query effectively
- Learn how to manage, organize, and document queries
- Troubleshoot common issues like errors, mismatches, and refresh failures
- Complete a final project simulating a real-world business challenge

---

## 🧠 Concepts Introduced

- Naming conventions for queries, steps, and columns
- Organizing queries using folders (groups)
- Using comments in formula bar (advanced)
- Fixing broken steps (e.g., source moved or renamed)
- Tracing dependencies between queries

---

## 🏢 Scenario Context: Krkoš Needs an Automated Dashboard

You’ve been asked to deliver a one-click-refresh dashboard that shows:

- Best-selling products by month
- Regional sales trends
- Inventory gaps (when sales exceed stock)
- Impact of seasons or discounts on sales

Management needs to make informed, data-driven decisions for the next quarter.

---

## 🛠️ Best Practices to Follow

| Best Practice             | Why it Matters             |
|---------------------------|-----------------------------|
| Use meaningful query names | Easier navigation           |
| Document complex steps     | Clarity for others (and future you!) |
| Avoid hardcoded paths      | Prevents broken refresh     |
| Group related queries      | Improves structure          |
| Remove unused steps/columns| Optimizes performance       |

---

## 🧪 Final Project: Outdoor BI Report

**Files:**
- Combined sales CSVs (Jan + Feb)
- Product catalog
- Inventory
- Optional: Manual dealer notes

### Requirements:
1. **Import and clean all data**
2. **Merge product and inventory details**
3. **Add time intelligence columns**
4. **Summarize by product, region, month**
5. **Deliver output as:**
   - PivotTable with slicers (e.g., Region, Season)
   - Chart of monthly trends
   - Table showing top 5 products and inventory gaps

6. **BONUS:** Highlight any data quality issues

---

## 💡 Pro Tips

- Use folders to organize queries by stage (Raw, Cleaned, Final)
- Add descriptive names for each Applied Step
- Use the **Advanced Editor** to fix broken code quickly
- Don’t forget to test the refresh functionality!

---

## ✅ Outcomes

- Learner applies full Power Query workflow end-to-end
- Demonstrates confidence in solving real business problems
- Creates a dynamic, reusable reporting solution
