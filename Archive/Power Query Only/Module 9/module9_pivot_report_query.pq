/*
This query:

Loads the enriched dataset

Promotes headers and sets correct data types

Renames key columns for better readability in the report

*/
let
    // Load enriched sales data
    Source = Excel.Workbook(File.Contents("C:\Your\Path\To\sales_with_time_columns.xlsx"), null, true),
    SalesData = Source{[Item="Sales_Time_Enriched",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(SalesData, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date},
        {"Region - Store", type text},
        {"Product Code", type text},
        {"Quantity", Int64.Type},
        {"Revenue", Int64.Type},
        {"Year", Int64.Type},
        {"Month", Int64.Type},
        {"Month Name", type text},
        {"Quarter", Int64.Type},
        {"Weekday", type text},
        {"Is Weekend", type logical},
        {"Season", type text}
    }),

    // Optional: clean column names
    RenamedCols = Table.RenameColumns(ChangedTypes, {
        {"Product Code", "Product"},
        {"Month Name", "Month"},
        {"Revenue", "Total Revenue"}
    })
in
    RenamedCols
