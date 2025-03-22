
let
    Source = Folder.Files("C:\Your\Folder\Path\sales_data"),
    FilteredCSVs = Table.SelectRows(Source, each Text.EndsWith([Extension], ".csv")),
    ImportedFiles = Table.AddColumn(FilteredCSVs, "Custom", each Csv.Document(File.Contents([Folder Path] & [Name]), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None])),
    ExpandedCustom = Table.ExpandTableColumn(ImportedFiles, "Custom", {"Column1", "Column2", "Column3", "Column4", "Column5"}, {"Date", "Region - Store", "Product Code", "Quantity", "Revenue"}),
    ChangedTypes = Table.TransformColumnTypes(ExpandedCustom, {
        {"Date", type date}, 
        {"Region - Store", type text}, 
        {"Product Code", type text}, 
        {"Quantity", Int64.Type}, 
        {"Revenue", Int64.Type}
    }),
    AddedMonth = Table.AddColumn(ChangedTypes, "Month", each Date.ToText([Date], "yyyy-MM"), type text),
    Grouped = Table.Group(AddedMonth, {"Month", "Product Code"}, {
        {"Total Quantity", each List.Sum([Quantity]), Int64.Type},
        {"Total Revenue", each List.Sum([Revenue]), Int64.Type}
    }),
    AddedRevenuePerUnit = Table.AddColumn(Grouped, "Revenue per Unit", each [Total Revenue] / [Total Quantity], type number)
in
    AddedRevenuePerUnit
