import hashlib
from ..db import engine
from ..errors import error_library
from ..auth_handler import AuthHandler

authHandler = AuthHandler()

#GOOGLE AUTH PROVIDER
async def getTokens(payload) -> dict: 
        status: bool = False
        response_data1 = {'access_token': str, 'refresh_token': str}
        if ((payload["signin_method"] == "google") or (payload["signin_method"] == "standard")):
            email_hash: str = hashlib.sha1(payload['primary_email_id'].encode('utf-8')).hexdigest()

        raw_conn = engine.raw_connection()
        cur1 = raw_conn.cursor(dictionary=True)
        cur2 = raw_conn.cursor(dictionary=True)
        cur1.callproc('sp_v3_get_user_from_fields', [None, email_hash, None, None])
        for result in cur1.stored_results():
            rs = result.fetchone()
            
        if rs:

            if (rs["IS_ACTIVE"] == "Y"):
                to_encode = {"user_uuid" : rs["UUID"], "signin_method" : rs["SIGN_IN_METHOD"]}

                access_token = authHandler.createAccessToken(to_encode)
                refresh_token = authHandler.createRefreshToken()
                refresh_token_hash = hashlib.sha1(refresh_token.encode('utf-8')).hexdigest()

                cur2.callproc('sp_v3_update_refresh_token', [email_hash, refresh_token_hash, None, payload['signin_method']])
                
                response_data1.update({'access_token': access_token, 'refresh_token': refresh_token})

                status = True
            elif(rs["IS_ACTIVE"] == "N"):
                response_data2 = error_library.error_lib["auth"]["AUTH-106"]
                status = False    

        else:
            response_data2 = error_library.error_lib["auth"]["AUTH-105"]
            status = False

        raw_conn.close()

        if (status):
            return response_data1
        else:
            return response_data2

#CUSTOM REFRESH TOKEN CHECK
async def renewTokens(payload):

    status: bool = False
    response_data1 = {'access_token': str, 'refresh_token': str}
    
    if(authHandler.verifyToken(payload['refresh_token'])):

        refresh_token: str = payload['refresh_token']
        refresh_token_hash = hashlib.sha1(refresh_token.encode('utf-8')).hexdigest()

        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v2_get_user_app_sec_data', [payload['user_uuid']])
        for result in cur.stored_results():
            rs = result.fetchone()

        if (rs["REFRESH_TOKEN"] == refresh_token_hash):

            to_encode = {"user_uuid" : payload['user_uuid'], "signin_method" : rs["SIGN_IN_METHOD"]}
            access_token = authHandler.createAccessToken(to_encode)
            refresh_token = authHandler.createRefreshToken()
            refresh_token_hash = hashlib.sha1(refresh_token.encode('utf-8')).hexdigest()

            cur.callproc('sp_v3_update_refresh_token', [rs["EMAIL_HASH"], refresh_token_hash, 
                None, rs["SIGN_IN_METHOD"]])
            
            response_data1.update({'access_token': access_token, 'refresh_token': refresh_token})
            
            raw_conn.close()
            
            status = True
        else:
           
            response_data2 = error_library.error_lib["auth"]["AUTH-103"]
            status = False
    else:
        response_data2 = None

    if (status):
        return response_data1
    else:
        return response_data2   