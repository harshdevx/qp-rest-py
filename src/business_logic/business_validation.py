from ..db import engine

async def validateNumberOfGroupMembers(payload) -> bool:

    configuration_type_uuid: str = 'd71a3396-414a-4269-84a8-e80244f3aef5'

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_validate_group_member_count', [payload["group_uuid"], payload["user_uuid"], configuration_type_uuid])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    if(rs["RESULT"] == 1):
        return True
    else:
        return False

async def validateGroupUserCount(payload) -> bool:

    configuration_type_uuid: str = '9f355473-9474-4082-a5e2-77366e887dbb'

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_validate_number_of_groups_user_is_part_of', [payload["user_uuid"], configuration_type_uuid])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    if(rs["RESULT"] == 1):
        return True
    else:
        return False



async def validateUserCountSearchHistory(payload) -> bool:

    configuration_type_uuid: str = 'd7154e74-91f0-4d4a-ae45-744114311e0f'

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_validate_number_of_groups_user_is_part_of', [payload["user_uuid"], configuration_type_uuid])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    if(rs["RESULT"] == 1):
        return True
    else:
        return False

async def validateCreateModifyGroup(payload) -> bool:

    configuration_type_uuid: str = '7f37aed2-2fcd-4a54-8eb1-31ea2dac5576'

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_validate_create_modify_group', [payload["user_uuid"], configuration_type_uuid])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    if(rs["RESULT"] == 1):
        return True
    else:
        return False