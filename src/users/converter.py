from ..utils import convertDateTime

def convertRecordSetToUserPersonalData(recordSet):
    processedRecordSet = {
        "user_uuid" : recordSet["UUID"],
        "user_name" : recordSet["USER_NAME"],
        "full_name" : recordSet["FULL_NAME"],
        "email_hash" : recordSet["EMAIL_HASH"],
        "primary_email_id" : recordSet["PRIMARY_EMAIL_ID"],
        "primary_mobile_number" : recordSet["PRIMARY_MOBILE_NUMBER"],
        "gender" : recordSet["GENDER"],
        "creation_date" : convertDateTime(recordSet["CREATION_DATE"]),
        "device_token" : recordSet["DEVICE_TOKEN"],
        "domain_uuid" : recordSet["DOMAIN_UUID"],
        "domain_name" : recordSet["DOMAIN_NAME"]
    }

    return processedRecordSet

def convertRecordSetToUserAppSecData(recordSet):
    processedRecordSet = {
        "user_uuid" : recordSet["UUID"],
        "email_hash" : recordSet["EMAIL_HASH"],
        "creation_date" : convertDateTime(recordSet["CREATION_DATE"]),
        "inactivation_date" : convertDateTime(recordSet["INACTIVATION_DATE"]),
        "account_expiry_date" : convertDateTime(recordSet["ACCOUNT_EXPIRY_DATE"]),
        "device_token" : recordSet["DEVICE_TOKEN"],
        "is_active" : recordSet["IS_ACTIVE"],
        "is_premium" : recordSet["IS_PREMIUM"],
        "refresh_token" : recordSet["REFRESH_TOKEN"],
        "registered_devices" : recordSet["REGISTERED_DEVICES"],
        "role" : recordSet["ROLE"],
        "subsc_type" : recordSet["SUBSC_TYPE"],
        "subsc_uuid" : recordSet["SUBSC_UUID"],
    }

    return processedRecordSet        