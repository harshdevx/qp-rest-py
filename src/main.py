from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from users import userRoutes
from oauth import oauthRoutes
# from groups import groupRoutes, groupInvitationRoutes, groupCountRoutes
# from domains import domainRoutes
# from devices import deviceRoutes
# from cities import citiesRoutes

app = FastAPI()


def get_application():
    app = FastAPI(title="qp-rest-api",
                  version="1.0.0",
                  ocs_url=None,
                  redoc_url=None,
                  openapi_url="/api/openapi.json")
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    app.include_router(oauthRoutes.router)
    app.include_router(userRoutes.router)
    # app.include_router(groupRoutes.router)
    # app.include_router(groupInvitationRoutes.router)
    # app.include_router(groupCountRoutes.router)
    # app.include_router(domainRoutes.router)
    # app.include_router(deviceRoutes.router)
    # app.include_router(citiesRoutes.router)

    return app


app = get_application()
