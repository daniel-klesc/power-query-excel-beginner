/*
This script:

Loads cleaned sales data

Merges product catalog and inventory

Adds a calculated column Units Remaining = Stock - Quantity
*/

let
    // Load sales data
    SalesSource = Excel.Workbook(File.Contents("sales_jan_after_cleaning.xlsx"), null, true),
    SalesData = SalesSource{[Item="Cleaned_Sales_Data",Kind="Sheet"]}[Data],
    PromotedSales = Table.PromoteHeaders(SalesData, [PromoteAllScalars=true]),

    // Load product catalog
    CatalogSource = Excel.Workbook(File.Contents("product_catalog.xlsx"), null, true),
    CatalogData = CatalogSource{[Item="Product_Catalog",Kind="Sheet"]}[Data],
    PromotedCatalog = Table.PromoteHeaders(CatalogData, [PromoteAllScalars=true]),

    // Load inventory
    InventorySource = Excel.Workbook(File.Contents("inventory.xlsx"), null, true),
    InventoryData = InventorySource{[Item="Inventory",Kind="Sheet"]}[Data],
    PromotedInventory = Table.PromoteHeaders(InventoryData, [PromoteAllScalars=true]),

    // Merge product catalog into sales
    MergedCatalog = Table.NestedJoin(PromotedSales, {"Product Code"}, PromotedCatalog, {"Product Code"}, "Catalog", JoinKind.LeftOuter),
    ExpandedCatalog = Table.ExpandTableColumn(MergedCatalog, "Catalog", {"Product Name", "Category", "Price"}),

    // Merge inventory into result
    MergedInventory = Table.NestedJoin(ExpandedCatalog, {"Product Code"}, PromotedInventory, {"Product Code"}, "Inventory", JoinKind.LeftOuter),
    ExpandedInventory = Table.ExpandTableColumn(MergedInventory, "Inventory", {"Stock"}),

    // Add calculated column: Units Remaining
    AddedRemaining = Table.AddColumn(ExpandedInventory, "Units Remaining", each [Stock] - [Quantity], Int64.Type)
in
    AddedRemaining
