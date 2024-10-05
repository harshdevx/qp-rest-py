import re
from pydantic import BaseModel, ValidationError, validator, Field
from typing import Optional

from sqlalchemy import desc

class ActivateDeactivateDevice(BaseModel):
    
    action: str = Field(description="this field determines action required")
    device_uuid: str = Field(description="this field can only accept uuidv4")

    @validator('action')
    def match_action(cls, v):
        matched = re.match("[activate|deactivate]", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts activate or deactivate")
        return v
    
    @validator('device_uuid')
    def match_device_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v

class CreateDevice(BaseModel):

    device_hash: str = Field(description="this field only accepts device hash")
    device_firmware_version: Optional[str] = None
    
    @validator('device_hash')
    def match_device_hash(cls, v):
        matched = re.match("[0-9a-fA-Z]{40}", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts sha1 hashes")
        return v

    @validator('device_firmware_version')
    def match_device_firmware_version(cls, v):
        matched = re.match("[0-9a-fA-Z]{40}", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts sha1 hashes")
        return v

class SearchDevice(BaseModel):

    device_uuid: str = Field(description="this field can only accept uuidv4")

    @validator('device_uuid')
    def match_device_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v