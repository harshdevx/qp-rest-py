from pydantic import BaseModel, Field

class GoogleAuthProvider(BaseModel):
    id_token: str = Field(description="idToken from provider is required...")
    signin_method: str = Field(description="signin method is required...")

class StandardLoginProvider(BaseModel):
    primary_email_id: str = Field(description="primary_email_id from provider is required...")
    password_hash: str = Field(description="password_hash from provider is required...")
    signin_method: str = Field(description="signin method is required...")

class AccessTokenProvider(BaseModel):
    refresh_token: str = Field(description="refresh token is required...")
    user_uuid: str = Field(description="user uuid is required...")