from fastapi import Depends, FastAPI, Response, status, HTTPException, APIRouter
from fastapi.params import Body

from ..db import engine
from . import domainService

from ..auth_handler import AuthHandler

router = APIRouter(tags=['user service routes'])

@router.get("/domains", status_code=status.HTTP_200_OK)
async def getDomains():
    
    processed_domains_list = domainService.getDomains()

    return processed_domains_list