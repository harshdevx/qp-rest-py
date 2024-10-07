from db import DB


class BusinessLogic():

    def __init__(self):
        self.__db = DB()

    async def validateNumberOfGroupMembers(self, db_payload: dict) -> bool:
        try:
            db_payload.update({
                "configuration_type_uuid": 'd71a3396-414a-4269-84a8-e80244f3aef5'
            })

            self.__db.execute('CALL sp_v3_validate_group_member_count(\
                              %(group_uuid)s, \
                              %(user_uuid)s, \
                              %(configuration_type_uuid)s)', db_payload)

            result = self.__db.fetchone()

            if (result is not None):
                return True
            else:
                return False
        except Exception as e:
            print(f"validateNumberOfGroupMembers: {e}")

    async def validateGroupUserCount(self, db_payload: dict) -> bool:
        try:
            db_payload.update({
                "configuration_type_uuid": '9f355473-9474-4082-a5e2-77366e887dbb'
            })

            self.__db.execute('CALL sp_v3_validate_number_of_groups_user_is_part_of(\
                              %(user_uuid)s, \
                              %(configuration_type_uuid)s)', db_payload)

            result = self.__db.fetchone()

            if (result is not None):
                if result.get("RESULT") == 1:
                    return True
                else:
                    return False
        except Exception as e:
            print(f"validateGroupUserCount: {e}")

    async def validateUserCountSearchHistory(self, db_payload: dict) -> bool:
        try:
            db_payload.update({
                "configuration_type_uuid": 'd7154e74-91f0-4d4a-ae45-744114311e0f'
            })

            self.__db.execute('CALL sp_v3_validate_number_of_groups_user_is_part_of(\
                              %(user_uuid)s, \
                              %(configuration_type_uuid)s)', db_payload)

            result = self.__db.fetchone()

            if (result is not None):
                if result.get("RESULT") == 1:
                    return True
                else:
                    return False
        except Exception as e:
            print(f"validateUserCountSearchHistory: {e}")

    async def validateCreateModifyGroup(self, db_payload) -> bool:
        try:
            db_payload.update({
                "configuration_type_uuid": '7f37aed2-2fcd-4a54-8eb1-31ea2dac5576'
            })

            self.__db.execute('CALL sp_v3_validate_create_modify_group(\
                              %(user_uuid)s, \
                              %(configuration_type_uuid)s)', db_payload)

            result = self.__db.fetchone()

            if (result is not None):
                if result.get("RESULT") == 1:
                    return True
                else:
                    return False
        except Exception as e:
            print(f"validateCreateModifyGroup: {e}")
