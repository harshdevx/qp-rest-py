from ssl import cert_time_to_seconds
from tokenize import group
import pytz

from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

from ..db import engine
from .models import GroupSearch, CreateGroup
from ..business_logic.business_validation import validateCreateModifyGroup
from ..groups import groupService
from ..auth_handler import AuthHandler

authHandler = AuthHandler()

router = APIRouter(tags=['group service routes'])

@router.get("/groups", status_code=status.HTTP_200_OK)
async def getGroups(user_uuid: str = Depends(authHandler.authenticatedUser)):
    
    response_data = await groupService.getGroups(user_uuid)
    return response_data

@router.post("/groups", status_code=status.HTTP_201_CREATED)
async def createGroup(createGroup: CreateGroup, user_uuid: str = Depends(authHandler.authenticatedUser)):

    payload = {
        "user_uuid" : user_uuid
    }

    if not (await validateCreateModifyGroup(payload)):

        raise HTTPException(status_code=200, detail='{"code": -1, "message": \
            "unable to process request, max number of groups reached for this subscription type..."}')

    
    payload = {
        "user_uuid" : user_uuid,
        "group_name" : createGroup.group_name,
        "group_goal" : createGroup.group_goal,
        "city_uuid" : createGroup.city_uuid
    }

    response_data = await groupService.createGroup(payload)
    return response_data

@router.post("/groups/search", status_code=status.HTTP_200_OK)
async def searchGroup(groupSearch: GroupSearch, user_uuid: str = Depends(authHandler.authenticatedUser)):

    if not (groupSearch.tz in pytz.all_timezones):
        raise HTTPException(status_code=400, detail="invalid tz data...")

    payload = {

        'criteria': groupSearch.criteria,
        'group_uuid': groupSearch.group_uuid,
        'user_uuid': user_uuid,
        'tz': groupSearch.tz,
        'today': groupSearch.today
    }

    response_data = groupService.searchGroups(payload)
    return response_data



    
        