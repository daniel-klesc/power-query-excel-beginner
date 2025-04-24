
# 🔄 Messy Fact Tables with Transformation Objectives

---

## 🧾 fact_sales_dirty.csv

| Column            | Description                                           | Transformation Goal                          | Power Query Functions (UI)                     |
|-------------------|-------------------------------------------------------|-----------------------------------------------|------------------------------------------------|
| `Transaction Date`| Mixed formats (`"2023-01-15"`, `"15/01/2023"`, etc.) | Normalize to date format                      | ➤ Transform → Detect Data Type or Change Type |
| `Product Ref`     | Lowercased, padded ID (e.g. `" p001 "`)              | Trim + uppercase for join                     | ➤ Transform → Trim + ➤ Format → Uppercase     |
| `StoreCode`       | Trailing spaces (`"S001 "`)                          | Trim and standardize                          | ➤ Transform → Trim                             |
| `Cust-ID`         | Valid, used for joining                              | *(No transformation)*                         |                                                |
| `Qty`             | Clean numeric quantity                               | *(No transformation)*                         |                                                |
| `UnitPrice`       | Standard decimal format                              | *(No transformation)*                         |                                                |
| `DiscountRate`    | Text values like `"10%"`                             | Remove `%` and convert to decimal             | ➤ Transform → Replace Values + Change Type     |
| `TotalRevenue`    | Text values like `"$120.50"`, `"120 USD"`            | Extract numeric value                         | ➤ Transform → Replace Values / Extract Digits + Change Type |
| `Channel Used`    | Inconsistent casing and spacing                      | Trim + capitalize for grouping                | ➤ Transform → Trim + Format → Capitalize Each Word |

---

## 📦 fact_inventory_dirty.csv

| Column            | Description                                           | Transformation Goal                          | Power Query Functions (UI)                     |
|-------------------|-------------------------------------------------------|-----------------------------------------------|------------------------------------------------|
| `Inventory Date`  | Mixed formats like `"2023-01-15"` and `"15/01/2023"` | Normalize date                                | ➤ Transform → Change Type or Detect Data Type  |
| `ProductRef`      | Match to messy product key                           | Trim/uppercase if needed                      | ➤ Transform → Trim + ➤ Format → Uppercase     |
| `StoreRef`        | Clean, valid ID                                       | *(No transformation)*                         |                                                |
| `QtyInStock`      | Text like `"43 units"`                                | Extract numeric portion                       | ➤ Extract → Text Before Delimiter or Extract Digits |
| `ReorderFlag`     | `"yes"` / `"No"`                                      | Standardize casing                            | ➤ Format → Capitalize Each Word or Uppercase  |
