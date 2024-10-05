
def convertRecordSetToGetCities(recordSet):

    processedRecordSet = {

        recordSet["CITY"]: {

            "city_uuid": recordSet["UUID"],
            "city_country": recordSet["CITY_COUNTRY"]
        }
    }

    return processedRecordSet