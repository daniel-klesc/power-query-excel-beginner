# ☁️ Power Query: Connect to SharePoint Folder

Use this method when your CSV or Excel files are stored on **SharePoint Online**, typically in a document library such as “Documents”.

---

## 🔑 Prerequisites
To successfully combine files from a SharePoint folder:
- All files must have the **same structure** (column names, types, and order)
- Files should be the **same type** (e.g., all `.csv`)
- Files must be stored in the **same folder**
- You need permission to access the SharePoint site

---

## 🪜 Steps to Connect via SharePoint Folder

1. Open Excel and go to the **Data** tab.
2. Click:
   - **Get Data**
   - **From Online Services**
   - **From SharePoint Folder**
3. Enter the **SharePoint Site URL only** (e.g., `https://yourcompany.sharepoint.com/sites/YourSiteName`)
4. Click **OK**.
5. In the **Navigator**, you will see all accessible files on the site.
6. Apply filters to show only the desired folder and file type (e.g., `.csv`).
7. Click **Transform Data**.
8. Use **Combine Files** → **Combine & Transform** to open the Power Query logic editor.

---

## ⚙️ What Power Query Automatically Creates

After clicking “Combine & Transform”, Power Query will generate:

| Query Name | Description |
|------------|-------------|
| **Your Main Query** | Final combined table output |
| **Transform Sample File** | Where you define transformations |
| **Sample File** | The file used as a sample |
| **Transform File Function** | Reusable logic for all files |

---

## 🧠 How It Works

- Power Query uses the **first file alphabetically** as the sample
- All transformations are recorded in **Transform Sample File**
- A function is applied to every file in the folder
- Avoid manually editing the main combined query or deleting the helper queries

---

## 💻 Sample M Code

```powerquery
let
    Source = SharePoint.Files("https://yourcompany.sharepoint.com/sites/YourSiteName", [ApiVersion = 15]),
    Filtered = Table.SelectRows(Source, each Text.Contains([Folder Path], "PowerQueryDemo") and Text.EndsWith([Extension], ".csv")),
    TransformFile = (fileContent as binary) =>
        let
            Source = Csv.Document(fileContent, [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None]),
            PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
            ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
                {"ProductID", type text}, {"StoreID", type text}, {"Date", type date},
                {"UnitsSold", Int64.Type}, {"Revenue", Int64.Type}
            })
        in
            ChangedTypes,
    AddCustom = Table.AddColumn(Filtered, "CustomData", each TransformFile([Content])),
    Expanded = Table.Combine(AddCustom[CustomData])
in
    Expanded
```