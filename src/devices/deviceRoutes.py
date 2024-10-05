from cgitb import reset
import hashlib
from urllib import response
from venv import create
from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body


from . import deviceService
from .models import ActivateDeactivateDevice, CreateDevice, SearchDevice
from ..auth_handler import AuthHandler

router = APIRouter(tags=['device service routes'])

authHandler = AuthHandler()

@router.post("/devices", status_code=status.HTTP_200_OK)
async def createDevice(createDevice: CreateDevice, user_uuid: str = Depends(authHandler.authenticatedUser)):

    payload = {

        'user_uuid': user_uuid,
        'device_name' : "kliqit group counter",
        'device_hash' : createDevice.device_hash,
        'device_firmware_version' : createDevice.device_firmware_version,
        'device_type' : 'H'
    }
    
    response_data = await deviceService.createDevice(payload)
    
    return response_data

@router.post("/devices/search", status_code=status.HTTP_200_OK)
async def searchDevice(searchDevice: SearchDevice, user_uuid: str = Depends(authHandler.authenticatedUser)):

    payload = {

        'user_uuid' : user_uuid,
        'device_uuid' : searchDevice.device_uuid
    }

    response_data = await deviceService.searchDevice(payload)
    
    return response_data

@router.get("/devices", status_code=status.HTTP_200_OK)
async def getDevices(user_uuid: str = Depends(authHandler.authenticatedUser)):

    response_data = await deviceService.getDevices(user_uuid)
    
    return response_data


@router.post("/devices/activate", status_code=status.HTTP_200_OK)
async def activateDevice(activateDeactivateDevice: ActivateDeactivateDevice, user_uuid: str = Depends(authHandler.authenticatedUser)):

    response_data = {}

    actionPayload = {

        'action': activateDeactivateDevice.action,
        'user_uuid': user_uuid,
        'device_uuid': activateDeactivateDevice.device_uuid
    }
    
    response_data = await deviceService.activateDevice(actionPayload)
    
    return response_data

@router.post("/devices/deactivate", status_code=status.HTTP_200_OK)
async def activateDevice(activateDeactivateDevice: ActivateDeactivateDevice, user_uuid: str = Depends(authHandler.authenticatedUser)):

    response_data = {}

    actionPayload = {

        'action': activateDeactivateDevice.action,
        'user_uuid': user_uuid,
        'device_uuid': activateDeactivateDevice.device_uuid
    }
        
    response_data = await deviceService.activateDeactivateDevice(actionPayload)

    return response_data
    

