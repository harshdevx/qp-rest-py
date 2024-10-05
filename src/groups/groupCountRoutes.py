from http.client import responses
from urllib import response
from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

#from ..business_logic.business_validation import validateNumberOfGroupMembers, validateGroupUserCount
from .models import GroupCounts

from .groupService import insertGroupCounts
from ..auth_handler import AuthHandler

authHandler = AuthHandler()

router = APIRouter(tags=['group counts routes'])

@router.post("/groups/counts", status_code=status.HTTP_201_CREATED)
async def postGroupCounts(groupCounts: GroupCounts, user_uuid: str = Depends(authHandler.authenticatedUser)):
    
    payload = {
        'group_uuid' : groupCounts.group_uuid,
        'user_uuid' : user_uuid,
        'device_uuid' : groupCounts.device_uuid,
        'tz' : groupCounts.tz,
        'loclat' : groupCounts.loclat,
        'loclong' : groupCounts.loclong,
        'device_data' : groupCounts.device_data
    }
    try:
        response_data = await insertGroupCounts(payload)
        return response_data
    
    except HTTPException:
        print("err..")


"""
@router.post("/groups/counts/search", status_code=status.HTTP_200_OK)
    async def postGroupCountsSearch(groupCountsSearch: GroupCountsSearch, user_uuid: str = Depends(authHandler.authenticatedUser)):
    
    payload = {
        'group_uuid' : groupCountsSearch.group_uuid,
        'user_uuid' : user_uuid,
        'tz' : groupCountsSearch.tz,
    'criteria' : groupCountsSearch.criteria
}
try:
    if(validatesUserCountSearchHistory
    response_data = await insertGroupCounts(payload)
    return response_data

except HTTPException:
    print("err..")
"""