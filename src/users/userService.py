from time import strftime
import uuid

from datetime import datetime

from src.users.models import SearchUser
from ..errors import error_msg_library

from . import converter
from utils import convertToMySqlDateTime


from db import DB
from time import strftime


class UserService():

    def __init__(self) -> None:
        self.__db = DB()

    async def check_user_exists(self, db_payload: dict):

        decision: int = 0

        try:
            self.__db.execute('CALL sp_v3_get_user_from_fields(\
                            %(user_uuid)s, \
                            %(email_hash)s, \
                            %(primary_mobile_number)s, \
                            %(primary_email_id)s', db_payload)

            user_data = self.__db.fetchone()
            if user_data.get("USER_UUID") is not None:
                decision = 1

                return decision
            else:
                return None

        except Exception as e:
            print(e)

    async def check_user_phone_exists(self, db_payload: dict):
        decision: int = 0
        try:
            self.__db.execute('CALL sp_v3_get_user_from_fields(\
                            %(user_uuid)s, \
                            %(email_hash)s, \
                            %(primary_mobile_number)s, \
                            %(primary_email_id)s)', db_payload)

            db_decision = self.__db.fetchone()
            if db_decision is not None:
                decision = 1

            return decision
        except Exception as e:
            print(f"check_user_phone_exists: {e}")

    async def get_user_uuid_from_email_hash(self, db_payload: dict) -> str:
        try:
            self.__db.execute('CALL sp_v3_get_user_uuid_from_email(%(email_hash)s)',
                              db_payload)

            user_uuid = self.__db.fetchone()

            if user_uuid is not None:
                return user_uuid
        except Exception as e:
            print(f"get_user_uuid_from_email_hash: {e}")

    async def search_user(self, search_user: SearchUser):
        try:
            if (search_user.criteria == "personal_data"):
                self.__db(
                    'CALL sp_v3_get_user_personal_data(%(user_uuid)s)', search_user.user_uuid)

                user_data = converter.convert_recordset_to_user_personal_data(
                    self.__db.fetchone())

                return user_data
            elif (search_user.criteria == "appsec_data"):
                self.__db(
                    'CALL sp_v3_get_user_appsec_data(%(user_uuid)s)', search_user.user_uuid)

                user_data = converter.convert_recordset_to_user_personal_data(
                    self.__db.fetchone())

            return user_data
        except Exception as e:
            print(f"search_user: {e}")

    async def createUser(self, db_payload: dict):

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

                'code': error_msg_library.error_lib["user"]["USER-101"]["code"],
                'message': error_msg_library.error_lib["user"]["USER-101"]["message"],
            }
        return response_data

    def getUserPassword(payload) -> dict:
        response_data = {}
        try:
            raw_conn = engine.raw_connection()
            cur = raw_conn.cursor(dictionary=True)
            cur.callproc('sp_v3_get_user_password', [
                         payload["primary_email_id"]])

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
            print(e)
