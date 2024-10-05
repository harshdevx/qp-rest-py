from time import strftime
import uuid

from datetime import datetime
from ..errors import error_library
from ..db import engine
from . import converter 
from ..utils import convertToMySqlDateTime


def checkUserExists(email_hash):

    decision: int = 0

    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v3_get_user_from_fields', [None, email_hash, None, None])
    
        for result in cur.stored_results():
            rs = result.fetchone()
            if rs:
                decision = 1

        raw_conn.close()
        
        return decision
    except Exception as e:
        print(e)

def checkUserPhoneExists(phone_hash):

    decision: int = 0
    
    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v3_get_user_from_fields', [None, None, phone_hash, None])

        for result in cur.stored_results():
            rs = result.fetchone()
            if rs:
                decision = 1
    
        raw_conn.close()
        
        return decision
    except Exception as e:
        print(e)

def getUserUuidFromEmailHash(email_hash) -> str:
    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v3_get_user_uuid_from_email', [email_hash])

        for result in cur.stored_results():
            rs = result.fetchone()

        raw_conn.close()

        return rs["UUID"]
    except Exception as e:
        print(e)


async def searchUser(payload):
    
    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)

        if(payload["criteria"] == "personal_data"):
            cur.callproc('sp_v3_get_user_personal_data', [payload["user_uuid"]])
            for result in cur.stored_results():
                processedData = converter.convertRecordSetToUserPersonalData(result.fetchone())

            return processedData
        elif(payload["criteria"] == "appsec_data"):
            cur.callproc('sp_v3_get_user_app_sec_data', [payload["user_uuid"]])
            for result in cur.stored_results():
                processedData = converter.convertRecordSetToUserAppSecData(result.fetchone())
        
        raw_conn.close()

        return processedData 
    except Exception as e:
        print(e)

async def createUser(payload):

    response_data = {}
    user_request: bool = False

    user_uuid: str = str(uuid.uuid4())
    creationDate: str = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")

    if (checkUserExists(None, payload["email_hash"], None, None) == 0):

        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v3_insert_user', [user_uuid, payload["primary_email_id"], payload["email_hash"],
            payload["full_name"], creationDate, payload["device_token"], 'Y', payload["primary_mobile_number"], 
            payload["gender"], payload["signin_method"], payload["domain_uuid"]])

        for result in cur.stored_results():
            rs = result.fetchone()

        raw_conn.close()

        if rs["RESULT"] == 1:
            user_request = True
        
        response_data = {
            'user_uuid': user_uuid, 
            'user_request': user_request
        }
        
    else:
        response_data = {

            'code': error_library.error_lib["user"]["USER-101"]["code"],
            'message': error_library.error_lib["user"]["USER-101"]["message"],
        }
    return response_data


def getUserPassword(payload) -> dict:
    response_data = {}
    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v3_get_user_password', [payload["primary_email_id"]])

        for result in cur.stored_results():
            rs = result.fetchone()
        raw_conn.close()
        if not (rs == None):
            response_data = {
                'user_uuid': rs["UUID"], 
                'password_hash': rs["PASSWORD_HASH"],
                'email_hash': rs["EMAIL_HASH"],
                'primary_email_id': rs["PRIMARY_EMAIL_ID"],
            }
            return response_data
        else: 
            return None
        

    except Exception as e:
        print (e)
        
