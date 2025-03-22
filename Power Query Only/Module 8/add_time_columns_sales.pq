
let
    // Load data from folder or combined query
    Source = Folder.Files("C:\Your\Folder\Path\sales_data"),
    FilteredCSVs = Table.SelectRows(Source, each Text.EndsWith([Extension], ".csv")),
    ImportedFiles = Table.AddColumn(FilteredCSVs, "Custom", each Csv.Document(File.Contents([Folder Path] & [Name]), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None])),
    ExpandedData = Table.ExpandTableColumn(ImportedFiles, "Custom", {"Column1", "Column2", "Column3", "Column4", "Column5"}, {"Date", "Region - Store", "Product Code", "Quantity", "Revenue"}),

    // Promote headers and change types
    PromotedHeaders = Table.PromoteHeaders(ExpandedData, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date}, 
        {"Region - Store", type text}, 
        {"Product Code", type text}, 
        {"Quantity", Int64.Type}, 
        {"Revenue", Int64.Type}
    }),

    // Add date/time columns
    AddYear = Table.AddColumn(ChangedTypes, "Year", each Date.Year([Date]), Int64.Type),
    AddMonth = Table.AddColumn(AddYear, "Month", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonth, "Month Name", each Date.MonthName([Date]), type text),
    AddQuarter = Table.AddColumn(AddMonthName, "Quarter", each Date.QuarterOfYear([Date]), Int64.Type),
    AddWeekday = Table.AddColumn(AddQuarter, "Weekday", each Date.DayOfWeekName([Date]), type text),
    AddIsWeekend = Table.AddColumn(AddWeekday, "Is Weekend", each Date.DayOfWeek([Date]) >= 5, type logical),

    // Add Season based on Month
    AddSeason = Table.AddColumn(AddIsWeekend, "Season", each 
        if List.Contains({12, 1, 2}, Date.Month([Date])) then "Winter" 
        else if List.Contains({3, 4, 5}, Date.Month([Date])) then "Spring"
        else if List.Contains({6, 7, 8}, Date.Month([Date])) then "Summer"
        else "Autumn", type text)

in
    AddSeason
