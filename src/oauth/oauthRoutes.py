import bcrypt
from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter, Request
from fastapi.params import Body

from google.oauth2 import id_token
from google.auth.transport import requests

from src.users import userService

from ..config import settings
from .models import GoogleAuthProvider, StandardLoginProvider, AccessTokenProvider
from .auth_provider import getTokens, renewTokens

router = APIRouter(tags=['Oauth2, Authentication and Authorizations'])

@router.post("/token", status_code=status.HTTP_200_OK)
#async def getAccessToken(oauthProvider: OauthProvider):
async def getAccessToken(request_body: dict = Body(...)):
    response_data: dict
    error_data: dict

    if(request_body["signin_method"] == "google"):
        googleAuthProvider: GoogleAuthProvider = GoogleAuthProvider
        googleAuthProvider.id_token = request_body.idToken
        googleAuthProvider.signin_method = request_body.signin_method
    elif(request_body["signin_method"] == "standard"):
        standardLoginProvider: StandardLoginProvider = StandardLoginProvider
        standardLoginProvider.primary_email_id = request_body["primary_email_id"]
        standardLoginProvider.password_hash = request_body["password_hash"]
        standardLoginProvider.signin_method = request_body["signin_method"]
    try:
       
        if(request_body["signin_method"] == "google"):
            payload = {'primary_email_id': str, 'signin_method': str}
            idInfo = id_token.verify_oauth2_token(googleAuthProvider.id_token, requests.Request(), settings.g_client_id)

            if((idInfo['email_verified'] == True) and (idInfo['aud'] == settings.g_client_id)):
                payload.update({'primary_email_id': idInfo.get('email'), 'signin_method': googleAuthProvider.signin_method})
                
                response_data = getTokens(payload)
            else:
                return {"code" : -1, "message" : "invalid id token..."}
        
        elif(request_body["signin_method"] == "firebase"):
            print("firebase called...")
        
        elif(request_body["signin_method"] == "standard"):
            payload1 = {"primary_email_id" : request_body["primary_email_id"] }
            user = userService.getUserPassword(payload1)
            if (user != None):
                user_password: str = user["password_hash"]
                if(bcrypt.checkpw(standardLoginProvider.password_hash.encode('utf-8'), user_password.encode('utf-8'))):
                    payload2 = {
                        "primary_email_id" : user["primary_email_id"],
                        "signin_method" : standardLoginProvider.signin_method
                    }
                    response_data = await getTokens(payload2)
                else: 
                    response_data = {
                        "code" : -1,
                        "result" : "invalid user id or password..."
                    }    
            else:
                response_data = {
                    "code" : -1,
                    "result" : "invalid user id or password..."
                }
        
        return response_data
        
    except Exception as e:
        print(e)
        raise HTTPException(status_code=401, detail="invalid id token..") 
    

@router.post("/token/renew", status_code=status.HTTP_200_OK)
def renewAccessToken(accessTokenProvider: AccessTokenProvider):

    token_payload: dict = {}

    token_payload.update({'refresh_token': accessTokenProvider.refresh_token, 
        'user_uuid': accessTokenProvider.user_uuid})

    response_data = renewTokens(token_payload)

    if (response_data == None):
        raise HTTPException(status_code=401, detail="unauthorized access...")

    return response_data
