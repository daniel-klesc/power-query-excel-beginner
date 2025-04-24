# ☁️ Power Query: Connect to a Single File on SharePoint

This guide explains how to connect to a **single file** (such as an Excel or CSV file) stored in a **SharePoint document library**, directly from Excel using Power Query.

---

## 🔑 Prerequisites

To connect to a SharePoint-hosted file successfully:
- You must have access to the SharePoint site
- The file must be stored in a document library (e.g., “Documents”)
- You must know the **SharePoint site URL** and the **file path**

---

## 🪜 Steps to Connect to a Single File via Power Query

1. Open Excel and go to the **Data** tab.
2. Click:
   - **Get Data**
   - **From Web**
3. Paste a **modified version** of the file link:
   - Use:  
     `https://yourcompany.sharepoint.com/sites/YourSiteName/_layouts/15/download.aspx?SourceUrl=`
   - Append the encoded file path (e.g., `/sites/YourSiteName/Shared Documents/Folder/FileName.xlsx`)
4. Example final URL format:  
   `https://yourcompany.sharepoint.com/sites/YourSiteName/_layouts/15/download.aspx?SourceUrl=/sites/YourSiteName/Shared Documents/PowerQueryDemo/Sales_April.xlsx`
5. Click **OK**
6. If prompted, select **Organizational Account** and sign in
7. Power Query will now connect and show available tables or sheets (for Excel)

---

## ⚙️ What Happens in Power Query

If connecting to:
- **Excel file**: Power Query will show all sheets, tables, and named ranges
- **CSV file**: Power Query will load the file directly for preview

Once loaded:
- Apply any desired transformations
- Click **Close & Load** to send data to your Excel workbook

---

## ✅ Tips for Success

- Always use **site-relative paths** when building the `SourceUrl`
- Avoid spaces in file/folder names or encode them (`%20`)
- CSVs open directly, Excel files show sheet/table list
- Rename your query clearly (e.g., `Sales_April_2025`)
- You can refresh this query anytime from Excel

---

## 🧾 Sample Power Query M Code

```powerquery
let
    Source = Excel.Workbook(
        Web.Contents(
            "https://yourcompany.sharepoint.com/sites/YourSiteName/_layouts/15/download.aspx?SourceUrl=/sites/YourSiteName/Shared Documents/PowerQueryDemo/Sales_April.xlsx"
        ),
        null,
        true
    ),
    Sales_Sheet = Source{[Item="Sales", Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Sales_Sheet, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"ProductID", type text}, {"StoreID", type text}, {"Date", type date},
        {"UnitsSold", Int64.Type}, {"Revenue", Int64.Type}
    })
in
    ChangedTypes
```