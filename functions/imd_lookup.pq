let imd_lookup = (postcode as text, measure as text, index as text) =>    
    let 

        selected_measure = 
            if Text.Lower(measure) = "rank" then "rankObs" else 
            if Text.Lower(measure) = "decile" then "decObs" else "scoreObs",

        selected_index =
            if Text.Lower(index) = "imd" then "combineddeprivation" else
            if Text.Lower(index) = "income" then "incomedeprivation" else 
            if Text.Lower(index) = "employment" then "employmentdeprivation" else 
            if Text.Lower(index) = "education" then "educskilltraindepriv" else 
            if Text.Lower(index) = "health" then "healthdeprivdisability" else 
            if Text.Lower(index) = "crime" then "crime" else 
            if Text.Lower(index) = "housing" then "barrierstohousservices" else 
            if Text.Lower(index) = "living" then "livingenvdepriv" else 
            if Text.Lower(index) = "idaopi" then "idaopi" else "idaci",

        base_query = 
        "PREFIX os-pc: <http://data.ordnancesurvey.co.uk/ontology/postcode/>
        PREFIX os-pcu: <http://data.ordnancesurvey.co.uk/id/postcodeunit/>

        SELECT ?measure WHERE {
            ?obs <http://opendatacommunities.org/def/ontology/communities/societal_wellbeing/imd/indices> <http://opendatacommunities.org/def/concept/general-concepts/imd/" & selected_index & ">.
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