let
    // Get the data from Performce Tables in Excel file format
    YearRef = if Date.Month(DateTime.LocalNow()) >= 9 then Date.Year(DateTime.LocalNow()) - 1 else Date.Year(DateTime.LocalNow()) - 2,
    
    // Change this to get different datasets
    Keyword = "CENSUS",

    // Create URL for previous academic year
    // Edit uppercase keyword after &filters= to get different types of data
    MainURL = "https://www.compare-school-performance.service.gov.uk/download-data?download=true&regions=0&filters=" & Keyword & "&fileformat=xls&year=" & Text.From(YearRef)&"-"&Text.From(YearRef + 1) & "&meta=false",
    
    // Create URL for academic year two years ago
    // Edit uppercase keyword after &filters= to get different types of data
    BackupURL = "https://www.compare-school-performance.service.gov.uk/download-data?download=true&regions=0&filters=" & Keyword & "&fileformat=xls&year=" & Text.From(YearRef - 1)&"-"&Text.From(YearRef) & "&meta=false",
    
    // Attempt to get data from MainURL
    ErrorValue = Value.Metadata(Web.Contents(MainURL, [ManualStatusHandling={404}]))[Response.Status],
    
    // If no data found at MainURL get data from BackupURL
    Source = if ErrorValue = 404 then Excel.Workbook(Web.Contents(BackupURL)) else Excel.Workbook(Web.Contents(MainURL))
in
    Source
