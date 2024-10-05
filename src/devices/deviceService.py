import uuid
import hashlib

from datetime import datetime 

from ..db import engine
from ..configparams import configParamService
from . import converter 
from ..utils import convertToMySqlDateTime, generateRandomPin
from ..errors import error_library

async def createDevice(payload):

    response_data = {}
    promo_code: str = None
    device_request: bool = False

    device_uuid: str = str(uuid.uuid4())
    creationDate: str = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")

    reactivationDate: str = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
    promo_offer = await configParamService.getPromoOffer()

    if (promo_offer == "1"):
        promo_code = f"P{generateRandomPin()}"
    
    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    
    #create software device
    if payload["device_type"] == 'S':
        device_hash = hashlib.sha1(device_uuid.encode('utf-8')).hexdigest()
        cur.callproc('sp_v3_insert_default_device', [payload["user_uuid"], device_uuid, payload["device_name"], device_hash, 
            payload["device_type"], creationDate])

        for result in cur.stored_results():
            rs = result.fetchone()
        
        if(rs["RESULT"] == 1):

            #response_data = error_library.device.DEVICE-105
            response_data = ""
        else:
            
            #response_data = error_library.device.DEVICE-106
            response_data = ""

    #create hardware device 
    elif payload["device_type"] == "H":
        cur.callproc('sp_v3_upsert_devices', [payload["user_uuid"], device_uuid, payload["device_name"], payload["device_hash"], 
            payload["device_firmware_version"], creationDate, promo_code])
        for result in cur.stored_results():
            rs = result.fetchone()
        
        if(rs["RESULT"] == 1):
            response_data = {
                'code': error_library.error_lib["device"]["DEVICE-101"]["code"],
                'message': error_library.error_lib["device"]["DEVICE-101"]["message"],
            }
        else:
            response_data = {
                'code': error_library.error_lib["device"]["DEVICE-104"]["code"],
                'message': error_library.error_lib["device"]["DEVICE-104"]["message"],
            }

    raw_conn.close()

    return response_data

async def activateDeactivateDevice(payload):
    
    response_data = {}

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)

    cur.callproc('sp_v3_activate_deactivate_device', [payload["user_uuid"], payload["device_uuid"], payload["action"]])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    if ((payload["action"] == "activate") and (rs["RESULT"] == 1)):
        
        response_data = {
            'code': error_library.error_lib["device"]["DEVICE-107"]["code"],
            'message': error_library.error_lib["device"]["DEVICE-107"]["message"],
        }
    elif ((payload["action"] == "activate") and (rs["RESULT"] == 0)):
        
        response_data = {
            'code': error_library.error_lib["device"]["DEVICE-108"]["code"],
            'message': error_library.error_lib["device"]["DEVICE-108"]["message"],
        }
    elif ((payload["action"] == "deactivate") and (rs["RESULT"] == 1)):
        
        response_data = {
            'code': error_library.error_lib["device"]["DEVICE-109"]["code"],
            'message': error_library.error_lib["device"]["DEVICE-109"]["message"],
        }
    elif ((payload["action"] == "deactivate") and (rs["RESULT"] == 0)):
        
        response_data = {
            'code': error_library.error_lib["device"]["DEVICE-110"]["code"],
            'message': error_library.error_lib["device"]["DEVICE-110"]["message"],
        }
    
    raw_conn.close()

    return response_data

#get all active devices
async def getDevices(payload):

    processed_devices = []

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)

    cur.callproc('sp_v3_get_devices', [payload])

    for results in cur.stored_results():
        devices = results.fetchall()
    
    raw_conn.close()
    
    for device in devices:
        processed_devices.append(converter.convertRecordSetToDevices(device))
    
    return processed_devices

#get selected active device
async def searchDevice(payload):

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)

    cur.callproc('sp_v3_get_device', [payload["device_uuid"], payload["user_uuid"]])

    for rs in cur.stored_results():
        device = rs.fetchone()
    
    raw_conn.close()
    
    processed_device = converter.convertRecordSetToDevices(device)
    
    return processed_device

