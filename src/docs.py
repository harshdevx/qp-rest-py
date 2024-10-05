import os
import secrets
from fastapi import APIRouter, HTTPException, Depends
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.openapi.docs import get_swagger_ui_html, get_redoc_html

router = APIRouter()
security = HTTPBasic()


def get_current_username(credentials: HTTPBasicCredentials = Depends(security)) -> str:
    correct_username = secrets.compare_digest(
        credentials.username, os.getenv('DOC_USERNAME'))
    correct_password = secrets.compare_digest(
        credentials.password, os.getenv('DOC_PASSWORD'))
    if not (correct_username and correct_password):
        raise HTTPException(
            status_code=401,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Basic"},
        )
    return credentials.username


@router.get("/docs", response_class=HTMLResponse)
async def get_docs(username: str = Depends(get_current_username)) -> HTMLResponse:
    return get_swagger_ui_html(openapi_url="/api/openapi.json", title="docs")


@router.get("/redoc", response_class=HTMLResponse)
async def get_redoc(username: str = Depends(get_current_username)) -> HTMLResponse:
    return get_redoc_html(openapi_url="/api/openapi.json", title="redoc")


# @router.get("/openapi.json", response_class=JSONResponse)
# async def get_openapi_json(current_user: str = Depends(get_current_username)) -> JSONResponse:
#     from fastapi.openapi.utils import get_openapi

#     openapi_schema = get_openapi(
#         title="SERVICE TITLE",
#         version="1.0.0",
#         description="API documentation",
#         routes=get_application().routes,
#     )
#     return JSONResponse(openapi_schema)
