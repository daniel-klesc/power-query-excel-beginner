/*
This script covers:

Importing and combining monthly CSVs

Cleaning and splitting columns

Merging with product catalog and inventory

Adding time intelligence and calculated fields

Preparing data for reporting and dashboarding
*/
let
    // 1. Load CSV files from folder
    Source = Folder.Files("C:\Your\Path\To\FinalProjectData"),
    FilteredCSVs = Table.SelectRows(Source, each Text.EndsWith([Extension], ".csv")),
    Imported = Table.AddColumn(FilteredCSVs, "Data", each Csv.Document(File.Contents([Folder Path] & [Name]), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None])),
    Expanded = Table.ExpandTableColumn(Imported, "Data", {"Column1", "Column2", "Column3", "Column4", "Column5"}, {"Date", "Region - Store", "Product Code", "Quantity", "Revenue"}),

    // 2. Promote headers and change data types
    PromotedHeaders = Table.PromoteHeaders(Expanded, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date},
        {"Region - Store", type text},
        {"Product Code", type text},
        {"Quantity", Int64.Type},
        {"Revenue", Int64.Type}
    }),

    // 3. Split Region and Store
    SplitRegionStore = Table.SplitColumn(ChangedTypes, "Region - Store", Splitter.SplitTextByDelimiter(" - ", QuoteStyle.Csv), {"Region", "Store"}),

    // 4. Load product catalog
    Catalog = Excel.Workbook(File.Contents("C:\Your\Path\To\FinalProjectData\product_catalog.xlsx"), null, true),
    ProductTable = Catalog{[Item="Product_Catalog",Kind="Sheet"]}[Data],
    PromotedCatalog = Table.PromoteHeaders(ProductTable, [PromoteAllScalars=true]),

    // 5. Merge with product catalog
    MergedProduct = Table.NestedJoin(SplitRegionStore, {"Product Code"}, PromotedCatalog, {"Product Code"}, "ProductInfo", JoinKind.LeftOuter),
    ExpandedProduct = Table.ExpandTableColumn(MergedProduct, "ProductInfo", {"Product Name", "Category", "Price"}),

    // 6. Load inventory
    InventoryWB = Excel.Workbook(File.Contents("C:\Your\Path\To\FinalProjectData\inventory.xlsx"), null, true),
    InventoryTable = InventoryWB{[Item="Inventory",Kind="Sheet"]}[Data],
    PromotedInventory = Table.PromoteHeaders(InventoryTable, [PromoteAllScalars=true]),

    // 7. Merge with inventory
    MergedInventory = Table.NestedJoin(ExpandedProduct, {"Product Code"}, PromotedInventory, {"Product Code"}, "StockInfo", JoinKind.LeftOuter),
    ExpandedInventory = Table.ExpandTableColumn(MergedInventory, "StockInfo", {"Stock"}),

    // 8. Add calculated column: Units Remaining
    AddUnitsRemaining = Table.AddColumn(ExpandedInventory, "Units Remaining", each [Stock] - [Quantity], Int64.Type),

    // 9. Add time columns
    AddYear = Table.AddColumn(AddUnitsRemaining, "Year", each Date.Year([Date]), Int64.Type),
    AddMonth = Table.AddColumn(AddYear, "Month", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonth, "Month Name", each Date.MonthName([Date]), type text),
    AddQuarter = Table.AddColumn(AddMonthName, "Quarter", each Date.QuarterOfYear([Date]), Int64.Type),
    AddWeekday = Table.AddColumn(AddQuarter, "Weekday", each Date.DayOfWeekName([Date]), type text),
    AddIsWeekend = Table.AddColumn(AddWeekday, "Is Weekend", each Date.DayOfWeek([Date]) >= 5, type logical),

    // 10. Add Season column
    AddSeason = Table.AddColumn(AddIsWeekend, "Season", each 
        if List.Contains({12, 1, 2}, Date.Month([Date])) then "Winter" 
        else if List.Contains({3, 4, 5}, Date.Month([Date])) then "Spring" 
        else if List.Contains({6, 7, 8}, Date.Month([Date])) then "Summer" 
        else "Autumn", type text)
in
    AddSeason
