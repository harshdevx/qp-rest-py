import uuid
import hashlib

from ..db import engine
from datetime import datetime 

from ..groups import converter
from ..utils import convertToMySqlDateTime, deviceDataFormatter

async def createGroup(payload):

    response_data: dict
    group_uuid: str = str(uuid.uuid4())
    creationDate: str = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
    group_goal: int = payload["group_goal"]

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_insert_group_and_group_user', payload["user_uuid"], group_uuid, payload["group_name"],
        creationDate, payload["city_uuid"], group_goal, payload["is_default"])

    for result in cur.stored_results():
            rs = result.fetchone()

    raw_conn.close()
    
    response_data = {
        'code' : 1,
        'result' : "group created",
        'group_uuid' : rs['GROUP_UUID'],
        'group_name' : rs['GROUP_NAME'],
        'group_creation_date' : creationDate,
        'group_goal' : rs['GROUP_GOAL'],
        'total_group_counts' : rs['TOTAL_GROUP_COUNTS'],
        'group_city' : rs['GROUP_CITY'],
	}

    return response_data

async def createGroupInvitations(payload) -> bool:
    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_insert_group_invitations', [payload["group_uuid"], payload["primary_email_id"], payload["invite_code"]])

    raw_conn.close()

    return True
 
async def checkInviteStatus(payload):

    email_hash: str = hashlib.sha1(payload["primary_email_id"].encode('utf-8')).hexdigest()
    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_validate_group_invitations', [payload["group_uuid"], payload["user_uuid"], email_hash])
    invite_status = [data.fetchall() for data in cur.stored_results()][0]

    processed_invite_status = converter.convertInviteStatus(invite_status)

    raw_conn.close()

    return processed_invite_status

    
async def getGroupInvitations(user_uuid):

    raw_conn = engine.connection()
    cur = raw_conn.cursor(dictionary=True)

    cur.callproc('sp_v3_get_group_invitations', user_uuid)

    for results in cur.stored_results():
        group_invitations = results.fetchall()
        
        processed_group_invitations = []

        processed_group_invitations.append(converter.convertGroupInvitations(group_invitations))
    
    raw_conn.close()
    return processed_group_invitations

async def searchGroups(payload):

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)

    if (payload["criteria"] == "getgroup"):
        cur.callproc('sp_v3_get_groups', [payload["user_uuid"], None])
        
        for result in cur.stored_results():
            group = result.fetchone()
        
        processed_group = converter.convertRecordSetToGetGroupsData(group)

        raw_conn.close()

        return processed_group

    elif(payload["criteria"] == "getgroups"):
        
        processed_groups = []
        cur.callproc('sp_v3_get_groups', [payload["user_uuid"], payload["group_uuid"]])
    
        for results in cur.stored_results():
            groups = results.fetchall()
    
        for group in groups:
            processed_groups.append(converter.convertRecordSetToGetGroupsData(group))
    
        raw_conn.close()

        return processed_groups

    elif (payload["criteria"] == "getcountstile"):

        processed_group_counts_tile = []

        cur.callproc('sp_v3_get_counts_tile', [payload["user_uuid"], payload["group_uuid"], payload["today"], payload["tz"]])
        group_counts_tile = [data.fetchall() for data in cur.stored_results()][0]

        print(group_counts_tile)

        processed_group_counts_tile = converter.convertRecordSetToGetGroupCountsTile(group_counts_tile)

        raw_conn.close()
        
        return processed_group_counts_tile
    
    elif (payload["criteria"] == "getlastupdateallgroups"):

        processed_last_update_all_groups = []

        cur.callproc('sp_v3_get_last_update_for_all_groups', [payload["user_uuid"], payload["tz"]])
        
        for results in cur.stored_results():
            last_update_all_groups = results.fetchall()

        for group in last_update_all_groups:
            processed_last_update_all_groups.append(converter.convertRecordSetToGetLastUpdateAllGroups(group))

        raw_conn.close()
        
        return processed_last_update_all_groups

    elif (payload["criteria"] == "getdailygroupcountsfortodayperdevice"):

        cur.callproc('sp_v3_get_group_daily_counts_for_today_per_device', [payload["user_uuid"], 
            payload["group_uuid"], payload["today"], payload["tz"]])

        for results in cur.stored_results():
            daily_group_counts_for_today_per_device = results.fetchall()
        
        raw_conn.close()

        return daily_group_counts_for_today_per_device

async def getGroups(user_uuid):

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_get_all_groups', [user_uuid])
    
    for results in cur.stored_results():
        groups = results.fetchall()
    
    processed_groups = []

    for group in groups: 
        processed_groups.append(converter.convertRecordSetToGetGroupsData(group))

    raw_conn.close()

    return processed_groups

async def insertGroupCounts(payload): 

    try: 
        for device_counts in payload["device_data"]:
            device_counts = deviceDataFormatter(device_counts)

            print(device_counts["count_date"])

            raw_conn = engine.raw_connection()
            cur = raw_conn.cursor(dictionary=True)
            cur.callproc('sp_v3_upsert_group_daily_counts', [
                device_counts["count_date"], 
                payload["tz"], 
                payload["loclat"],
                payload["loclong"],
                payload["user_uuid"],
                payload["device_uuid"],
                payload["group_uuid"],
                device_counts["counts"]
            ])

        raw_conn.close()

        new_payload: dict = {

            'group_uuid' : payload["group_uuid"],
            'user_uuid' : payload["user_uuid"],
            'today' : device_counts["count_date"],
            'tz' : payload["tz"],
            'criteria' : "getdailygroupcountsfortodayperdevice"
        }
        
        return await searchGroups(new_payload)

    except Exception as e:
        print(e)