import enum
import hashlib
from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

from random import randrange

from ..business_logic.business_validation import validateNumberOfGroupMembers, validateGroupUserCount
from .models import GroupInvitations

from ..users import userService
from .groupService import createGroupInvitations, checkInviteStatus, getGroupInvitations

from ..auth_handler import AuthHandler

authHandler = AuthHandler()

router = APIRouter(tags=['group invitation service routes'])

@router.post("/groups/invitations", status_code=status.HTTP_200_OK)
async def getGroupsInvitations(groupInvitations: GroupInvitations, user_uuid: str = Depends(authHandler.authenticatedUser)):

    invite_status = {}

    payload = {
        'group_uuid' : groupInvitations.group_uuid,
        'user_uuid' : user_uuid
    }

    if not (await validateNumberOfGroupMembers(payload)):

        raise HTTPException(status_code=200, detail='{"code": -1, "message": \
            "unable to process request, max number of group members reached for this subscription type..."}')

    rand_string: str = f'{randrange(1, 10**6):06}'

    if (await userService.checkUserExists(hashlib.sha1(groupInvitations.primary_email_id.encode('utf-8')).hexdigest()) == 0):
        raise HTTPException(status_code=200, detail='{"code": -1, "message": \
            "we were unable to find user in our system, share our app and register user first..."}')
    else:
        payload = {
            'user_uuid': await userService.getUserUuidFromEmailHash(
                hashlib.sha1(groupInvitations.primary_email_id.encode('utf-8')).hexdigest()),
        }

        if not (await validateGroupUserCount(payload)):
            raise HTTPException(status_code=200, detail='{"code": -1, "message": \
                "unable to process request, max number of groups reached for this subscription type..."}')

        else:
            
            payload = {

                'group_uuid' : groupInvitations.group_uuid,
                'user_uuid' : user_uuid,
                'primary_email_id' : groupInvitations.primary_email_id,
                'invite_code' : rand_string
            }

            if (await createGroupInvitations(payload)):

                invite_status = await checkInviteStatus(payload)
                
                if(invite_status["user_invited"]):

                    print("sending notification...")
    
    return invite_status
    
@router.get("/groups/invitations", status_code=status.HTTP_200_OK)
def getGroupInvitations(user_uuid: str = Depends(authHandler.authenticatedUser)):

    processed_group_invitations = getGroupInvitations(user_uuid)

    return processed_group_invitations


