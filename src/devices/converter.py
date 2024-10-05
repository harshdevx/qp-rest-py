
def convertRecordSetToDevices(recordSet):
    
    processedRecordSet = {

        'device_uuid' : recordSet["UUID"],
        'device_hash' : recordSet["DEVICE_HASH"],
        'device_name' : recordSet["DEVICE_NAME"],
        'device_type' : recordSet["DEVICE_TYPE"],
        'is_active': recordSet["IS_ACTIVE"],
        'registration_date' : recordSet["REGISTRATION_DATE"],
        'inactivation_date' : recordSet["INACTIVATION_DATE"],
        'reactivation_date' : recordSet["REACTIVATION_DATE"]
    }

    return processedRecordSet