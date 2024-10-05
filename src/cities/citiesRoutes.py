from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

from ..db import engine
from ..cities import citiesService
from ..auth_handler import AuthHandler

router = APIRouter(tags=['cities service routes'])

authHandler = AuthHandler()

@router.get("/cities", status_code=status.HTTP_200_OK)
async def getCities(user_uuid: str = Depends(authHandler.authenticatedUser)): 
    
    response_data = await citiesService.getCities()
    return response_data
