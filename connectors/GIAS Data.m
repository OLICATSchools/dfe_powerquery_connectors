let
    YearRef = Text.From(Date.Year(DateTime.LocalNow())),
    MonthRef = if Text.Length(Text.From(Date.Month(DateTime.LocalNow()))) = 1 then "0"&Text.From(Date.Month(DateTime.LocalNow())) else Text.From(Date.Month(DateTime.LocalNow())),
    DayRef = if Text.Length(Text.From(Date.Day(DateTime.LocalNow()))) = 1 then "0"&Text.From(Date.Day(DateTime.LocalNow())) else Text.From(Date.Day(DateTime.LocalNow())),
    URL = "http://ea-edubase-api-prod.azurewebsites.net/edubase/edubasealldata" & YearRef & MonthRef & DayRef &".csv",

    Source = Csv.Document(Web.Contents(URL),[Delimiter=",", Encoding=1252, QuoteStyle=QuoteStyle.None])
in
    Source
