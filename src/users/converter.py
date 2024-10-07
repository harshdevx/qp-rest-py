from utils import convertDateTime


def convert_recordset_to_user_personal_data(record_set: dict):
    processed_recordset: dict = {
        "user_uuid": record_set.get("UUID"),
        "user_name": record_set.get("USER_NAME"),
        "full_name": record_set.get("FULL_NAME"),
        "email_hash": record_set.get("EMAIL_HASH"),
        "primary_email_id": record_set.get("PRIMARY_EMAIL_ID"),
        "primary_mobile_number": record_set.get("PRIMARY_MOBILE_NUMBER"),
        "gender": record_set.get("GENDER"),
        "creation_date": convertDateTime(record_set.get("CREATION_DATE")),
        "device_token": record_set.get("DEVICE_TOKEN"),
        "domain_uuid": record_set.get("DOMAIN_UUID"),
        "domain_name": record_set.get("DOMAIN_NAME"),
    }

    return processed_recordset


def convert_recordset_to_user_appsec_data(record_set: dict):
    processed_recordset: dict = {
        "user_uuid": record_set.get("UUID"),
        "email_hash": record_set.get("EMAIL_HASH"),
        "creation_date": convertDateTime(record_set.get("CREATION_DATE")),
        "inactivation_date": convertDateTime(record_set.get("INACTIVATION_DATE")),
        "account_expiry_date": convertDateTime(record_set.get("ACCOUNT_EXPIRY_DATE")),
        "device_token": record_set.get("DEVICE_TOKEN"),
        "is_active": record_set.get("IS_ACTIVE"),
        "is_premium": record_set.get("IS_PREMIUM"),
        "refresh_token": record_set.get("REFRESH_TOKEN"),
        "registered_devices": record_set.get("REGISTERED_DEVICES"),
        "role": record_set.get("ROLE"),
        "subsc_type": record_set.get("SUBSC_TYPE"),
        "subsc_uuid": record_set.get("SUBSC_UUID"),
    }

    return processed_recordset
