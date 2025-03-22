
let
    Source = Csv.Document(File.Contents("sales_jan.csv"), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date}, 
        {"Region - Store", type text}, 
        {"Product Code", type text}, 
        {"Quantity", Int64.Type}, 
        {"Revenue", Int64.Type}
    }),
    SplitColumn = Table.SplitColumn(ChangedTypes, "Region - Store", Splitter.SplitTextByDelimiter(" - ", QuoteStyle.Csv), {"Region", "Store"}),
    RenamedColumns = Table.RenameColumns(SplitColumn, {{"Revenue", "Total Revenue"}}),
    TrimmedColumns = Table.TransformColumns(RenamedColumns, {
        {"Region", Text.Trim}, 
        {"Store", Text.Trim}, 
        {"Product Code", Text.Trim}
    }),
    ReplacedValues = Table.ReplaceValue(TrimmedColumns, "P001", "KRK-P001", Replacer.ReplaceText, {"Product Code"})
in
    ReplacedValues
