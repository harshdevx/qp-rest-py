import jwt
import rsa
import os
from typing import Optional

from fastapi import HTTPException, Security, status, Response
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from datetime import datetime, timedelta

from .config import settings
from .utils import convertDateTime

class AuthHandler():
    security = HTTPBearer()

    def createAccessToken(self, data: dict):
        to_encode = data.copy()

        with open(settings.jwt_auth_key) as privatefile:
            privkeydata = privatefile.read()
        
        #issue_at = convertDateTime(datetime.utcnow())
        #expire_at = convertDateTime(datetime.utcnow() + timedelta(minutes=settings.jwt_access_token_expiry))

        exp = datetime.utcnow() + timedelta(days=0, minutes=settings.jwt_access_token_expiry)
        iat = datetime.utcnow()
                
        to_encode.update({"iss": settings.jwt_issuer})
        to_encode.update({"iat": iat})
        to_encode.update({"exp": exp})

        encoded_jwt = jwt.encode(to_encode, privkeydata, settings.jwt_algo)

        return encoded_jwt
    
    def createRefreshToken(self):
        
        to_encode: dict = {"iss": settings.jwt_issuer} 

        with open(settings.jwt_auth_key) as privatefile:
            privkeydata = privatefile.read()
        
        exp = datetime.utcnow() + timedelta(days=0, minutes=settings.jwt_access_token_expiry)
        iat = datetime.utcnow()
        
        to_encode.update({"iat": iat})
        to_encode.update({"exp": exp})

        encoded_jwt = jwt.encode(to_encode, privkeydata, settings.jwt_algo)

        return encoded_jwt

    def decodeToken(self, token: str)-> Optional[Response]:
        with open(settings.jwt_auth_pub) as pubfile:
            pubfliedata = pubfile.read()

        try:
            idInfo = jwt.decode(token, pubfliedata, settings.jwt_algo)
            return idInfo
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="token signature expired...")
        except jwt.DecodeError:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="failed to decode token...")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="invalid token...")
        

    def verifyToken(self, token: str) -> bool:
        isTokenValid: bool = False
        
        idInfo = self.decodeToken(token)
        now = datetime.utcnow()
        exp = idInfo["exp"]
        #exp = datetime.strptime(idInfo["exp_at"], "%Y-%m-%d %H:%M:%S")

        if (exp > now) and (idInfo["iss"] == settings.jwt_issuer):
            isTokenValid = True
        
        return isTokenValid
    
    def authenticatedUser(self, credentials: HTTPAuthorizationCredentials = Security(security)):

        idInfo = self.decodeToken(credentials.credentials)
        return idInfo["user_uuid"]