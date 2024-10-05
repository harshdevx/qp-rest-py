import hashlib
from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

from google.oauth2 import id_token
from google.auth.transport import requests

from src.devices import deviceService

from ..config import settings
from .models import SearchUser, CreateUser
from ..auth_handler import AuthHandler

from . import userService

router = APIRouter(tags=['user service routes'])

authHandler = AuthHandler()

@router.post("/users/search", status_code=status.HTTP_200_OK)
async def findUser(searchUser: SearchUser, user_uuid: str = Depends(authHandler.authenticatedUser)):
    
    searchPayload = {
        'criteria' : searchUser.criteria,
        'user_uuid' : user_uuid
    }
    processed_user_data = await userService.searchUser(searchPayload)
    return processed_user_data

@router.get("/users", status_code=status.HTTP_200_OK)
async def getUser(user_uuid: str = Depends(authHandler.authenticatedUser)):
    
    searchPayload = {
        'criteria' : 'personal_data',
        'user_uuid' : user_uuid
    }
    processed_user_data = await userService.searchUser(searchPayload)
    
    return processed_user_data
   
@router.post("/users", status_code=status.HTTP_201_CREATED)
async def createUser(createUser: CreateUser): 
    
    user_payload: dict = {

        'request_code' : createUser.request_code,
        'signin_method' : createUser.signin_method,
        'full_name' : createUser.full_name,
        'gender' : createUser.gender,
        'device_token' : createUser.device_token,
        'domain_uuid' : createUser.domain_uuid,
        'primary_mobile_number' : createUser.primary_mobile_number,
        'primary_email_id' : createUser.primary_email_id
    }

    device_payload: dict = {}
    try:
       
        if(createUser.signin_method == "google"):
            idInfo = id_token.verify_oauth2_token(createUser.id_token, requests.Request(), settings.g_client_id)
            if((idInfo['email_verified'] == True) and (idInfo['aud'] == settings.g_client_id)):
                user_payload.update({'primary_email_id': idInfo.get('email')})
                
                email_hash = hashlib.sha1(idInfo.get('email').encode('utf-8')).hexdigest()
                phone_hash = hashlib.sha1(createUser.primary_mobile_number.encode('utf-8')).hexdigest()

                user_payload.update({'email_hash': email_hash, 'primary_mobile_number': phone_hash})
                

        elif(createUser.signin_method == "firebase"):
                
                email_hash = hashlib.sha1(idInfo.get('primary_email_id').encode('utf-8')).hexdigest()
                phone_hash = hashlib.sha1(idInfo.get('phone_number').encode('utf-8')).hexdigest()

                user_payload.update({'email_hash': email_hash, 'primary_mobile_number': phone_hash})
        
        check_user_email = userService.checkUserExists(email_hash)
        check_user_phone = userService.checkUserPhoneExists(phone_hash)

        if (check_user_email == 0) and (check_user_phone == 0):

            user_request = await userService.createUser(user_payload)

            device_payload.update({'user_uuid': user_request["user_uuid"], 'device_name': 'kliqit soft button', 
                 'device_type' : 'S'})
            device_request = await deviceService.createDevice(device_payload)

            if (user_request["user_request"] and device_request["device_request"]):

                return {
                    'code': 1, 
                    'message' : "user and device created successfully...",
                    'user_uuid' : user_request["user_uuid"],
                    'device_uuid' : device_request["device_uuid"]
                }    
        else:
            raise HTTPException(status_code=400, detail='{"code": -1, "message": \
            "unable to process request user with email id or phone already exists..."}')

        
    except Exception as e:
        print(e)
    
