from pydantic import BaseSettings

class Settings(BaseSettings):

    #DATABASE SETTINGS
    #------------------------------------------------------------------------------------
    database_password: str 
    database_username: str 
    database_host: str 
    database_port: str 
    database_name: str 

    #CLIENT IDS
    #------------------------------------------------------------------------------------
    #GOOGLE CLIENT IDS
    #------------------------------------------------------------------------------------
    g_client_id: str
    g_client_secret: str

    g_client_id_ios: str

    #------------------------------------------------------------------------------------
    #FIREBASE CLIENT IDS
    #------------------------------------------------------------------------------------
    fcm_api_key: str
    fcm_sender_id: str

    #------------------------------------------------------------------------------------
    #FACEBOOK CLIENT IDS
    #------------------------------------------------------------------------------------
    fb_client_id: str
    fb_client_secret: str


    #------------------------------------------------------------------------------------
    #SMTP CREDENTIALS
    #------------------------------------------------------------------------------------
    smtp_user: str
    smtp_password: str
    smtp_port: str
    smtp_host: str

    #------------------------------------------------------------------------------------
    #SMTP CREDENTIALS
    #------------------------------------------------------------------------------------
    jwt_auth_key: str
    jwt_auth_pub: str
    jwt_access_token_expiry: int
    jwt_refresh_token_expiry: int
    jwt_algo: str
    jwt_issuer: str

    class Config:
        env_file = "./.env"

settings = Settings()