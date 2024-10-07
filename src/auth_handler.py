import jwt
import os
import datetime
import time
from typing import Optional

from fastapi import HTTPException, Security, status, Response
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from utils import convertDateTime


class AuthHandler():
    security = HTTPBearer()

    def __init__(self) -> None:

        self.__jwt_auth_key: str = f"{os.getcwd()}/{os.getenv('JWT_AUTH_KEY')}"
        self.__jwt_pub_key: str = f"{os.getcwd()}/{os.getenv('JWT_AUTH_PUB')}"

    def createAccessToken(self, data: dict):

        to_encode = data.copy()

        if (os.path.exists(self.__jwt_auth_key)):
            with open(self.__jwt_auth_key) as privatefile:
                privkeydata = privatefile.read()

            exp = datetime.datetime.now(tz=datetime.timezone.utc) + datetime.timedelta(
                days=0, hours=int(os.getenv('JWT_ACCESS_TOKEN_EXPIRY')))
            iat = datetime.datetime.now(tz=datetime.timezone.utc)

            to_encode.update({"iss": os.getenv('JWT_ISSUER')})
            to_encode.update({"iat": iat})
            to_encode.update({"exp": exp})

            encoded_jwt = jwt.encode(
                to_encode, privkeydata, os.getenv("JWT_ALGO"))

            return encoded_jwt
        else:
            return None

    def createRefreshToken(self):

        to_encode: dict = {"iss": os.getenv("JWT_ISSUER")}
        if (os.path.exists(self.__jwt_auth_key)):
            with open(self.__jwt_auth_key) as privatefile:
                privkeydata = privatefile.read()

            exp = datetime.datetime.now(tz=datetime.timezone.utc) + datetime.timedelta(
                days=0, hours=int(os.getenv("JWT_REFRESH_TOKEN_EXPIRY")))
            iat = datetime.datetime.now(tz=datetime.timezone.utc)

            to_encode.update({"iat": iat})
            to_encode.update({"exp": exp})

            encoded_jwt = jwt.encode(
                to_encode, privkeydata, os.getenv("JWT_ALGO"))

            return encoded_jwt
        else:
            return None

    def decodeToken(self, token: str) -> Optional[Response]:
        if (self.__jwt_pub_key):
            with open(self.__jwt_pub_key) as pubfile:
                pubfliedata = pubfile.read()

            try:
                idInfo = jwt.decode(token, pubfliedata, os.getenv("JWT_ALGO"))
                return idInfo
            except jwt.ExpiredSignatureError:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED, detail="token signature expired")
            except jwt.DecodeError:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED, detail="failed to decode token")
            except jwt.InvalidTokenError:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED, detail="invalid token")

    def verifyToken(self, token: str) -> bool:
        try:
            isTokenValid: bool = False

            idInfo = self.decodeToken(token)
            now = datetime.datetime.now(datetime.timezone.utc)
            unix_timestamp = time.mktime(now.timetuple())
            exp = float(idInfo["exp"])

            print(f"exp: {exp}")
            print(f"now: {unix_timestamp}")
            check = exp > unix_timestamp
            print(f"condition check: {check}")
            # exp = datetime.strptime(idInfo["exp"], "%Y-%m-%d %H:%M:%S")

            if (exp > unix_timestamp) and (idInfo["iss"] == os.getenv("JWT_ISSUER")):
                isTokenValid = True

            return isTokenValid
        except jwt.ExpiredSignatureError:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="token signature expired...")
        except jwt.DecodeError:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="failed to decode token...")
        except jwt.InvalidTokenError:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="invalid token...")

    def authenticatedUser(self, credentials: HTTPAuthorizationCredentials = Security(security)):

        idInfo = self.decodeToken(credentials.credentials)
        return idInfo["user_uuid"]
