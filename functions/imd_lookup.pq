let imd_lookup = (postcode as text, domain as text, measure as text) =>    
    let 

        upper_domain = Text.Upper(domain),
        upper_measure = Text.Upper(measure),
        
        selected_domain =
            if upper_domain = "IMD" then "combineddeprivation" else
            if upper_domain = "INCOME" then "incomedeprivation" else 
            if upper_domain = "EMPLOYMENT" then "employmentdeprivation" else 
            if upper_domain = "EDUCATION" then "educskilltraindepriv" else 
            if upper_domain = "HEALTH" then "healthdeprivdisability" else 
            if upper_domain = "CRIME" then "crime" else 
            if upper_domain = "HOUSING" then "barrierstohousservices" else 
            if upper_domain = "LIVING" then "livingenvdepriv" else 
            if upper_domain = "IDAOPI" then "idaopi" else "idaci",

        selected_measure = 
            if upper_measure = "DECILE" then "decObs" else 
            if upper_measure = "SCORE" then "scoreObs" else "rankObs",

        base_query = 
        "PREFIX os-pc: <http://data.ordnancesurvey.co.uk/ontology/postcode/>
        PREFIX os-pcu: <http://data.ordnancesurvey.co.uk/id/postcodeunit/>

        SELECT ?measure WHERE {
            ?obs <http://opendatacommunities.org/def/ontology/communities/societal_wellbeing/imd/indices> <http://opendatacommunities.org/def/concept/general-concepts/imd/" & selected_domain & ">.
            ?obs <http://opendatacommunities.org/def/ontology/geography/refArea> ?areauri .
            ?obs <http://opendatacommunities.org/def/ontology/time/refPeriod> ?perioduri .
            ?obs <http://opendatacommunities.org/def/ontology/communities/societal_wellbeing/imd/" & selected_measure & "> ?measure .
            
            os-pcu:" & Text.Replace(postcode, " ", "") & " os-pc:LH ?lh; <http://opendatacommunities.org/def/geography#lsoa> ?lsoa .
    
            ?areauri <http://www.w3.org/2002/07/owl#sameAs> ?sg.
            ?lsoa <http://www.w3.org/2002/07/owl#sameAs> ?sg .
        }",
        
        encoded_query = Text.Replace(Uri.EscapeDataString(base_query), "%20", "+"),

        sparql_endpoint = "https://opendatacommunities.org/sparql.json?query=" & encoded_query,

        output = Json.Document(Web.Contents(sparql_endpoint)),
        rank = try output[results][bindings]{0}[measure][value] otherwise null
    in
        rank

in
    imd_lookup