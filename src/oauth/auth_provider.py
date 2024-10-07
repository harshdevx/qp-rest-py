import hashlib
from db import DB
from errors.error_library import ErrorLib
from ..auth_handler import AuthHandler

authHandler = AuthHandler()

# GOOGLE AUTH PROVIDER


class AuthProvider():

    def __init__(self):
        self.__db = DB()
        self.__errLib = ErrorLib()

    async def getTokens(self, db_payload: dict) -> dict:
        status: bool = False
        tokens = {'access_token': str, 'refresh_token': str}
        if (db_payload.get('signin_method') == "google" or db_payload.get("signin_method" == "standard")):
            email_hash: str = hashlib.sha1(
                str(db_payload.get('primary_email_id')).encode('utf-8')).hexdigest()

        self.__db('CALL sp_v3_get_user_from_fields(\
                    %(user_uuid)s, \
                    %(email_hash)s, \
                    %(primary_mobile_number)s, \
                    %(primary_email_id)s);',
                  db_payload)

        rs_user_data = self.__db.fetchone()

        if rs_user_data:

            if (rs_user_data.get("ACTIVE") == "Y"):
                to_encode = {"user_uuid": rs_user_data.get("UUID"),
                             "signin_method": rs_user_data.get("SIGN_IN_METHOD")}

                access_token = authHandler.createAccessToken(to_encode)
                refresh_token = authHandler.createRefreshToken()
                refresh_token_hash = hashlib.sha1(
                    refresh_token.encode('utf-8')).hexdigest()

                update_db_payload: dict = {
                    "email_hash": email_hash,
                    "refresh_token": refresh_token_hash,
                    "phone_hash": None,
                    "signin_method": db_payload.get("signin_method")
                }

                self.__db.execute('CALL sp_v3_update_refresh_token(\
                                %(email_hash)s, \
                                %(refresh_token)s, \
                                %(phone_hash)s, \
                                %(signin_method)s', update_db_payload)

                tokens.update(
                    {'access_token': access_token, 'refresh_token': refresh_token})

                status = True
            elif (rs_user_data.get("IS_ACTIVE") == "N"):

                error_message = self.__errLib.getAuth106()
                status = False

        else:
            error_message = self.__errLib.getAuth105()
            status = False

        if (status):
            return tokens
        else:
            return error_message

    # CUSTOM REFRESH TOKEN CHECK

    async def renewTokens(self, db_payload: dict):

        status: bool = False
        tokens = {'access_token': str, 'refresh_token': str}

        if (authHandler.verifyToken(db_payload.get("refresh_token"))):

            refresh_token: str = db_payload.get("refresh_token")
            refresh_token_hash = hashlib.sha1(
                refresh_token.encode('utf-8')).hexdigest()

            self.__db.execute(
                'CALL sp_v2_get_user_app_sec_data(%(user_uuid)s)', db_payload)
            user_data = self.__db.fetchone()

            if (user_data.get(refresh_token) == refresh_token_hash):

                to_encode = {
                    "user_uuid": db_payload.get('user_uuid'), "signin_method": user_data.get("SIGN_IN_METHOD")}
                access_token = authHandler.createAccessToken(to_encode)
                refresh_token = authHandler.createRefreshToken()
                refresh_token_hash = hashlib.sha1(
                    refresh_token.encode('utf-8')).hexdigest()

                update_db_payload: dict = {
                    "email_hash": user_data.get("email_hash"),
                    "refresh_token": refresh_token_hash,
                    "phone_hash": None,
                    "signin_method": user_data.get("signin_method")
                }

                self.__db.execute('CALL sp_v3_update_refresh_token(\
                                %(email_hash)s, \
                                %(refresh_token)s, \
                                %(phone_hash)s, \
                                %(signin_method)s', update_db_payload)

                tokens.update(
                    {'access_token': access_token, 'refresh_token': refresh_token})

                status = True
            else:

                status = False
        else:
            return self.__errLib.getResourceNotFound()

        if (status):
            return tokens
        else:
            return self.__errLib.getAuth103()
