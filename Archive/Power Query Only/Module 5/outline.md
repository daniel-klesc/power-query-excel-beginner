# 🔗 Module 5: Merging Product & Inventory Info

## 🎯 Learning Objectives
By the end of this module, learners will:
- Understand the concept of merging (joins) in Power Query
- Know the difference between join types (Left, Inner, Full, etc.)
- Successfully combine sales data with product and inventory details
- Handle mismatches, missing values, and nulls in merged data

---

## 🧠 Concepts Introduced
- **Merging Queries**: Combining tables based on a common key
- **Join Types**:
  - Left Join: Keep all from primary, match where possible
  - Inner Join: Keep only matching rows
  - Full Outer Join: Keep everything from both
- Handling **null values** when no match is found
- Expanding merged tables and selecting specific fields

---

## 🏢 Scenario Context: Krkoš Data Enrichment

Krkoš management wants:
- Product names and categories added to the sales data
- Inventory levels matched to sales per product
- Better understanding of stock availability vs demand

You’ve cleaned the January sales data. Now it’s time to merge it with:
- `Product_Catalog.xlsx`
- `Inventory.xlsx`

---

## 🧰 Join Keys Used

| Source Table       | Join Key        |
|--------------------|-----------------|
| Sales_Jan          | Product Code    |
| Product_Catalog    | Product Code    |
| Inventory          | Product Code    |

---

## 🧪 Exercise: Merge Product Info to Sales

**Files:**
- `sales_jan_after_cleaning.xlsx` (from Module 4)
- `product_catalog.xlsx` (to be provided)
- `inventory.xlsx` (to be provided)

### Tasks:
1. Load `sales_jan_after_cleaning.xlsx` into Power Query
2. Load `product_catalog.xlsx` into Power Query
3. Perform a **Left Join** on `Product Code`
4. Expand fields: `Product Name`, `Category`, `Price`
5. Repeat steps to merge in inventory stock levels

### Bonus:
- Add a calculated column to show `"Units Remaining = Inventory - Quantity"`

---

## 💡 Pro Tips
- Rename joined queries before expanding (for clarity)
- Only expand the fields you need
- Use Left Join as default to avoid losing sales rows

---

## ✅ Outcomes
- Learner successfully merges multiple datasets
- Understands join logic and handles missing matches
- Data is now enriched for deeper analysis in Module 6