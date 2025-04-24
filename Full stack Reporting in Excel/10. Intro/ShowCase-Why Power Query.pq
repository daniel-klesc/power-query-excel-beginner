
let
    Source = Excel.CurrentWorkbook(){[Name="Table1"]}[Content],
    RenamedColumns = Table.RenameColumns(Source, {
        {"ProdID", "Product ID"},
        {"Product_Name", "Product Name"},
        {"Size_Color", "SizeColor"},
        {"Active", "Is Active"}
    }),
    FilteredActive = Table.SelectRows(RenamedColumns, each ([Is Active] = "Y")),
    SplitColumn = Table.SplitColumn(FilteredActive, "SizeColor", Splitter.SplitTextByDelimiter("_", QuoteStyle.Csv), {"Size", "Color"}),
    ChangedTypes = Table.TransformColumnTypes(SplitColumn, {
        {"Product ID", Int64.Type},
        {"Product Name", type text},
        {"Category", type text},
        {"SubCategory", type text},
        {"Size", type text},
        {"Color", type text},
        {"Launch_Date", type date}
    }),
    TrimmedText = Table.TransformColumns(ChangedTypes, {
        {"Product Name", Text.Trim, type text},
        {"Category", Text.Trim, type text},
        {"SubCategory", Text.Trim, type text},
        {"Size", Text.Trim, type text},
        {"Color", Text.Trim, type text}
    }),
    CleanedText = Table.TransformColumns(TrimmedText, {
        {"Product Name", Text.Clean, type text},
        {"Category", Text.Clean, type text},
        {"SubCategory", Text.Clean, type text},
        {"Size", Text.Clean, type text},
        {"Color", Text.Clean, type text}
    })
in
    CleanedText
