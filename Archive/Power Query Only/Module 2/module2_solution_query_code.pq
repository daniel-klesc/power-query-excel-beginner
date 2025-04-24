
let
    Source = Excel.CurrentWorkbook(){[Name="Raw_Sales_Data"]}[Content],
    RenamedColumns = Table.RenameColumns(Source, {{"Revenue", "Total Revenue"}})
in
    RenamedColumns
