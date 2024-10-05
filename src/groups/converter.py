from ..utils import convertDateTime

def convertRecordSetToGetGroupsData(recordSet):
    
    processedRecordSet = {
        "group_uuid" : recordSet["GROUP_UUID"],
        "group_name" : recordSet["GROUP_NAME"],
        "is_active" : recordSet["IS_ACTIVE"],
        "is_admin" : recordSet["IS_ADMIN"],
        "is_default" : recordSet["IS_DEFAULT"],
        "group_creation_date" : convertDateTime(recordSet["GROUP_CREATION_DATE"]),
        "group_city" : recordSet["GROUP_CITY"],
        "subsc_type" : recordSet["SUBSC_TYPE"],
        #"decision" : recordSet["DECISION"],
        "group_goal" : recordSet["GROUP_GOAL"],
        "total_group_counts_to_date" : recordSet["TOTAL_GROUP_COUNTS"],
        "group_total_counts" : None,
        "last_updated_datetime" : None,
        "grand_total" : None,
        "last_updated_count" : None,
        "group_total_counts_today" : None
    }

    return processedRecordSet

def convertRecordSetToGetLastUpdateAllGroups(recordSet):
    
    processedRecordSet = {
        "group_uuid" : recordSet["GROUP_UUID"],
        "group_name" : recordSet["GROUP_NAME"],
        "is_active" : None,
        "is_admin" : None,
        "is_default" : None,
        "group_creation_date" : None,
        "group_city" : None,
        "subsc_type" : None,
        #"decision" : recordSet["DECISION"],
        "group_goal" : None,
        "total_group_counts_to_date" : None,
        "group_total_counts" : None,
        "last_updated_datetime" : recordSet["LAST_UPDATED_DATETIME"],
        "grand_total" : None,
        "last_updated_count" : None,
        "group_total_counts_today" : int(recordSet["GROUP_DAILY_TOTAL_COUNTS"])
    }

    return processedRecordSet


def convertRecordSetToGetGroupCountsTile(recordSet):

    total_group_counts_to_date: int = None
    grand_total: int = None
    last_updated_count: int = None

    if (recordSet[2]["RESULT"] == None):
        total_group_counts_to_date = 0
    else:
        total_group_counts_to_date = int(recordSet[2]["RESULT"])
    
    if (recordSet[0]["RESULT"] == None):
        grand_total = 0
    else:
        grand_total = int(recordSet[0]["RESULT"])
    
    if (recordSet[1]["RESULT"] == None):
        last_updated_count = 0
    else:
        last_updated_count = int(recordSet[0]["RESULT"])
    
    processedRecordSet = {
        "group_uuid" : None,
        "group_name" : None,
        "is_active" : None,
        "is_admin" : None,
        "is_default" : None,
        "group_creation_date" : None,
        "group_city" : None,
        "subsc_type" : None,
        "decision" : None,
        "group_goal" : None,
        "total_group_counts_to_date" : total_group_counts_to_date,
        "group_total_counts" : None,
        "last_updated_datetime" : None,
        "grand_total" : grand_total,
        "last_updated_count" : last_updated_count,
        "group_total_counts_today" : None,
    }

    return processedRecordSet

def convertInviteStatus(recordSet):

    is_admin: bool = None
    user_exists: bool = None
    group_member: bool = None
    user_invited: bool = None

    if (recordSet[0]["DECISION"] == "Y"):
        is_admin = True
    else:
        is_admin = False
    
    if (recordSet[1]["DECISION"] == '1'):
        user_exists = True
    else:
        user_exists = False

    if (recordSet[2]["DECISION"] == '1'):
        group_member = True
    else:
        group_member = False

    if (recordSet[3]["DECISION"] == '1'):
        user_invited = True
    else:
        user_invited = False

    processedRecordSet = {

        "is_admin" : is_admin,
        "user_exists": user_exists,
        "group_member": group_member,
        "user_invited": user_invited
    }

    return processedRecordSet

def convertGroupInvitations(recordSet):

    processed_group_invitation = {

        "group_name" : recordSet["GROUP_NAME"],
        "invite_code" : recordSet["INVITE_CODE"]
    }

    return processed_group_invitation

def convertRecordSetToGetCountsPerDeviceForToday(recordSet):

    processed_daily_group_counts_for_today_per_device = [

        {
            "device_uuid" : recordSet[0]["device_uuid"],
            "device_type" : recordSet[0]["device_type"],
            "total_user_date_counts" : recordSet[0]["total_user_date_counts"],
        },
        {
            "device_uuid" : recordSet[1]["device_uuid"],
            "device_type" : recordSet[1]["device_type"],
            "total_user_date_counts" : recordSet[1]["total_user_date_counts"],
        } 
    ]