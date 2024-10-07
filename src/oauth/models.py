import re
from pydantic import BaseModel, Field, field_validator


class AccessTokenProvider(BaseModel):
    @field_validator('refresh_token')
    def validate_refresh_token(cls, v):
        matched = re.match("^[\w-]+\.[\w-]+\.[\w-]+$", v)
        if not (bool(matched)):
            raise ValueError(
                "this field only accepts jwt tokens")
        return v

    refresh_token: str = Field(description="refresh token is required...")


class GoogleAuthProvider(BaseModel):
    id_token: str = Field(description="idToken from provider is required...")
    signin_method: str = Field(description="signin method is required...")


class StandardLoginProvider(BaseModel):
    primary_email_id: str = Field(
        description="primary_email_id from provider is required...")
    password_hash: str = Field(
        description="password_hash from provider is required...")
    signin_method: str = Field(description="signin method is required...")


class AccessTokenProvider(BaseModel):
    refresh_token: str = Field(description="refresh token is required...")
    user_uuid: str = Field(description="user uuid is required...")
