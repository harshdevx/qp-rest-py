
def convertRecordSetToDomains(recordSet):
    processedRecordSet = {

        'domain_uuid' : recordSet["UUID"],
        'domain_name' : recordSet["DOMAIN_NAME"]
    }

    return processedRecordSet