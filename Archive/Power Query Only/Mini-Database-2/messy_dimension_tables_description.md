
# 🧱 Messy Dimension Tables with Transformation Objectives

---

## 1. 👥 dim_customer_dirty.xlsx

| Column             | Description                                | Transformation Goal                  | Power Query Functions (UI)         |
|--------------------|--------------------------------------------|--------------------------------------|------------------------------------|
| `Customer Name`     | Full name (e.g. `"Anna Novakova"`)         | Split into `First Name`, `Last Name` | ➤ Split Column → By Delimiter     |
| `Customer ID`       | Clean ID                                   | Join Key                             | *(No transformation)*              |
| `Gender`            | Random casing (`"female"`, `"MALE"`)       | Standardize format                   | ➤ Transform → Format → Capitalize Each Word |
| `Age Description`   | e.g. `"Age: 36"`, `"42 yrs"`               | Extract numeric age                  | ➤ Extract → Text Between Delimiters / ➤ Transform → Extract Digits |
| `Loyalty Tier`      | Typos & spacing (`" gold "`, `"SILVR"`)    | Cleanup and replace values           | ➤ Transform → Format → Trim + ➤ Replace Values |
| `Channel Info`      | e.g. `"Prefers Online"`, `"Visits Store"`  | Extract main channel keyword         | ➤ Split Column / Extract → Text Before / After Delimiter |

---

## 2. 🏬 dim_store_dirty.xlsx

| Column           | Description                              | Transformation Goal                 | Power Query Functions (UI)            |
|------------------|------------------------------------------|-------------------------------------|----------------------------------------|
| `Store ID`        | Clean ID                                | Join Key                            | *(No transformation)*                  |
| `Region`          | Mixed values (`"north "`, `"NORTH"`)     | Normalize values                    | ➤ Format → Trim + ➤ Format → Capitalize Each Word |
| `City and Type`   | `"Brno - Flagship"`                      | Split into `City` and `Store Type`  | ➤ Split Column → By Delimiter          |
| `OpenDate`        | Text field: `"Opened: 2019-04-15"`       | Extract and convert to `Date`       | ➤ Extract → Text After Delimiter → Change Type to Date |
| `Manager`         | `"John Smith"`                           | Optional: Split for future joins    | ➤ Split Column → By Delimiter          |

---

## 3. 🧺 dim_product_dirty.xlsx

| Column           | Description                                 | Transformation Goal                     | Power Query Functions (UI)              |
|------------------|---------------------------------------------|------------------------------------------|------------------------------------------|
| `Product Key`     | e.g. `" p001 "`, `"P002"`                   | Trim + uppercase                         | ➤ Format → Trim → Uppercase              |
| `Name`            | e.g. `"Krkoš TrailMaster Tent"`             | Extract brand + model + type             | ➤ Split Column → By Delimiter (space-based) or ➤ Extract → First/Last Word |
| `Category Info`   | e.g. `"Camping > Tent"`                     | Split into `Category`, `Subcategory`     | ➤ Split Column → By Delimiter (`>`)      |
| `Color/Weight`    | `"Red | 2.5kg"`                             | Split into `Color`, `Weight (numeric)`   | ➤ Split → By Delimiter → ➤ Remove Text / Change Type |
| `Price`           | e.g. `"$120.50"`                            | Remove `$` and convert to number         | ➤ Replace Values (remove `$`) → Change Type to Decimal Number |
