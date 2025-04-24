# 📁 Importing and Combining Files from a Folder in Power Query

Use Power Query to import multiple CSV files with identical structure from a folder and combine them into a single table.

## 🪜 Step-by-Step Instructions (Excel)

1. Place all 4 CSV files into one folder on your system.
2. Open Excel and go to the **Data** tab.
3. Click **Get Data** → **From File** → **From Folder**.
4. Browse to and select the folder containing the sales CSV files.
5. Click **OK**. A list of files will appear.
6. Click **Transform Data** to open the Power Query Editor.

## 🧰 In Power Query Editor:
1. Click the **Combine** button → **Combine & Transform**.
2. Power Query will auto-detect the structure and show a sample preview.
3. Review the columns: `ProductID`, `StoreID`, `Date`, `UnitsSold`, `Revenue`.
4. Click **OK** to import all data into a single table.

You now have a table that combines all 4 files, ready for reporting and analysis.

# 🧠 What Happens Behind the Scenes: Power Query Folder Connector

When you connect to a folder of files using **Power Query in Excel**, a set of helper queries is automatically created to streamline the process of **combining** and **transforming** those files.

## ⚙️ What Power Query UI Generates

After you choose **"Combine & Transform"** in the Folder connector, Power Query creates several components:

### 1. **Main Query (your combined data table)**
- This is the final output, where all data from the files is loaded and combined.
- It uses other helper queries to do the transformation.

### 2. **Helper Queries**
You will see a group called **“Transform Sample File from...”**. These are:

| Helper Query | Description |
|--------------|-------------|
| **Transform Sample File** | Where transformations are applied to one sample file |
| **Sample File** | The file content used for preview/transformation logic |
| **Transform File Function** | A function generated to apply the same steps to every file |
| **Other Queries (optional)** | May include extracted headers, schemas, or metadata |

---

## 📂 How the Transformation Logic Works

1. **Power Query picks one file** from your folder to act as the _"sample file"_.
   - Usually, it picks the **first file alphabetically** in the folder.
   - This file is shown in the **“Transform Sample File”** query.

2. **You make transformations in the “Transform Sample File” query**.
   - Example: change data types, remove columns, rename headers.
   - These steps are recorded into a reusable function.

3. **The function is then applied to every other file**.
   - That’s how all files are cleaned using the same rules — automatically.

---

## 🚫 What NOT to Do

- **Don’t delete the helper queries**: They are required for the folder import to work.
- **Don’t manually transform the main query** (combined output) directly.
  - Instead, apply all transformations in the **Transform Sample File** query.
- **Don’t rename files randomly** after the connection is created.
  - Power Query relies on consistent structure and format.

---

## 🔁 Can I choose a different sample file?

Yes. If Power Query picks a file that doesn't represent the full structure:
1. Click the dropdown beside the **Combine Files** button.
2. Choose **"Choose Sample File"**.
3. Select the most representative file from the list.

---

## 🧠 Summary for Learners

| Concept | Best Practice |
|--------|---------------|
| Where to apply transformations? | In **Transform Sample File** query |
| Which file is used for example? | The **first file** (alphabetically, by default) |
| Should I edit combined table directly? | ❌ No |
| Can I change the sample file? | ✅ Yes
