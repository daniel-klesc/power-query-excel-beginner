Goal of course
- teach how to approach reporting in excel
- as tools the course uses Power Query (preparation of data), Power Pivot (data modelling), Visuals in Excel

Annotation (Another details)
Scope
- In Power Query all activities is going to be done UI (no M code)
- Power Pivot how to connect tables and use simple DAX measures/queries
- in visual part, charts etc.

Scope detail

The course will go through all the whole process from modifying source data to make data model and to make visualization/dashboard
To demonstrate functionalities of the technologies mentioned above will be used fictive company Krkos selling outdoor equipment, clothes etc.


# Theory of the full road from source data to dashboard
The process consists of data preparation called ETL (Extract, Transform and Load), data modeling (connecting the tables) and final step visualization


# Full stack process
Exists two ways how to proceed.
- From Top to Down
- From Down to Top

## From Down to Top
This process starts from data preparation, followed by data modelling and ends with visualization

### Extract & Transform & Load (ETL)
Definition/Explanation
ETL stands for Extract, Transform, Load – it’s a process used in data integration and reporting pipelines. Here’s what each part means:

**Extract**:
This step involves pulling data from one or more sources – such as databases, Excel files, APIs, or CSV exports. The goal is to collect raw data for further processing.

**Transform**:
This is where the data gets cleaned, shaped, and organized. It might include:
- Filtering unnecessary rows/columns
- Splitting or merging fields
- Converting formats (e.g., text to dates)
- Calculating new fields
- Joining data from different sources

Power Query in Excel is a tool specifically built for this step.

**Load**:
Finally, the transformed data is loaded into a destination – usually a database, data warehouse, or Excel data model (like Power Pivot), ready for analysis or reporting.

For ETL we use Power Query.

Why to use Power Query for ETL
1) Save Time: You only build the data-cleaning steps once. Next time, just click Refresh and Power Query will repeat everything automatically.
2) No More Manual Copy-Paste: Forget downloading new files and manually adjusting them. Power Query will handle new data the same way every time.
3) Reduce Errors: Manual steps often lead to mistakes. Power Query ensures your process is always consistent.
4) Combine Multiple Files: Need to join 10 sales reports into one summary? Power Query can do it with a few clicks.
5) Work Like a Pro: You don’t need to be an IT expert. Power Query uses a user-friendly interface and a step-by-step approach.

#### Showcase:
##### Instructions for LLM:
I would like to prepare excel file with one table (you can choose one of the dimension tables for Krkos company).
I need to demonstrate a few steps in Power Query that are needed to get table suitable(transformed) for reporting as dimension table.
The transformation needs to be possible to do in Power Query UI.

Describe for me the transformation steps a user should do to get final dimension table from the source one.

##### Result:
# Power Query Transformation Steps – Product Dimension Table

## 📦 Initial Table (Raw Data)
| ProdID | Product_Name        | Category | SubCategory | Size_Color | Active | Launch_Date |
|--------|---------------------|----------|-------------|------------|--------|-------------|
| 101    | Jacket XPRO Blue M  | Jackets  | Waterproof  | M_Blue     | Y      | 2022-10-01  |
| 102    | Jacket XPRO Red L   | Jackets  | Waterproof  | L_Red      | Y      | 2022-10-01  |
| 103    | Pants Trail Grey S  | Pants    | Hiking      | S_Grey     | N      | 2021-04-15  |

---

## 🎯 Goal
Prepare this table for use as a **clean product dimension table** in reporting.

---

## ✅ Transformation Steps (All via Power Query UI)

### 1. Load Data into Power Query
- Excel → Data → Get & Transform → From Table/Range

### 2. Rename Columns
- `ProdID` → `Product ID`
- `Product_Name` → `Product Name`
- `Size_Color` → `SizeColor`
- `Active` → `Is Active`

### 3. Filter Inactive Products
- Filter `Is Active` to only include `Y`

### 4. Split SizeColor into Size and Color
- Select `SizeColor` → Split by Delimiter `_`
- Output: `Size`, `Color`

### 5. Set Correct Data Types
- `Product ID` → Whole Number
- `Launch_Date` → Date
- Others → Text

### 6. Trim and Clean Text
- Select all text columns
- Use Transform → Format → Trim & Clean

### 7. Reorder Columns (Optional)
- Rearrange columns for clarity

### 8. Load to Excel
- Close & Load → Table or Data Model

---

## 🧾 Final Table

| Product ID | Product Name       | Category | SubCategory | Size | Color | Launch Date |
|------------|--------------------|----------|-------------|------|--------|--------------|
| 101        | Jacket XPRO Blue M | Jackets  | Waterproof  | M    | Blue   | 2022-10-01   |
| 102        | Jacket XPRO Red L  | Jackets  | Waterproof  | L    | Red    | 2022-10-01   |


Btw Power Query is using(generates) in the background Power Query M formula language


### Data Modeling
Demonstrate

#### Showase
##### Instructions for LLM:
Power Pivot in Excel

Generate for me an excel file containing two dimension tables and one fact table from the Krkos company.
The tables are going to be used directly in the data model. It means all the transformations are done.

Generate all necesarry Power Query code as copy & paste.

If you are able to create Power Pivot data model do it.

##### Description of Showcase
- show data model
- show possible power pivot and its possibility to show data
- mention how easy is to slice and dice fact table by dimension tables


# ETL with Power Query
Let's have a look how to start using a PQ.
## Instructions for LLM:
