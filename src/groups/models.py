from array import array
import re
import pytz
from pydantic import BaseModel, Field, ValidationError, validator
from typing import List, Optional


class CreateGroup(BaseModel):
    group_name: str
    group_goal: int
    city_uuid: str
    is_default: str = "N"

    @validator('group_name')
    def match_group_name(cls, v):
        matched = re.match("^\\b(?:\\w|-)+\\b$", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts letters _ or -")
        return v

    @validator('city_uuid')
    def match_group_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v

    """
    @validator('group_goal')
    def match_group_goal(cls, v):
        matched = re.match("^\\d+$", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts numbers")
        return v
    """
    
    @validator('is_default')
    def match_is_default(cls, v):
        matched = re.match("[YN]", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts Y or N")
        return v
"""--------------------------------------------------------"""
class GroupSearch(BaseModel):
    criteria: str
    tz: str = Field(description="this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
    today: str = Field(description="this field only accepts date in format YYYY-MM-DD hh:mm:ss in military format (24H)")
    group_uuid: Optional[str] = Field(description="this field only accepts uuidv4")
    
    @validator('criteria')
    def match_criteria(cls, v):
        matched = re.match("[getgroup|getgroups|getcountstile|getlastupdateallgroups]", v)
        if not (bool(matched)):
            raise ValueError("this field can only accept values = getgroup, getgroups, getcountstile or getlastupdateallgroups")
        return v
    
    @validator('group_uuid')
    def match_group_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v
    
    @validator('tz')
    def match_tz(cls, v):
        if not (v in pytz.all_timezones_set):
            raise ValueError("this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
        return v
    
    @validator('today')
    def match_today(cls, v):
        matched = re.match("(\d{4})-((0[1-9])|(1[0-2]))-(0[1-9]|[12][0-9]|3[01]) (([0-1][0-9])|([2][0-3])):([0-5][0-9]):([0-5][0-9])$", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts date in format YYYY-MM-DD hh:mm:ss in military format (24H)")
        return v
    
"""--------------------------------------------------------"""
class GroupInvitations(BaseModel):
    group_uuid: str
    primary_email_id: str = Field(description="this field only accepts email@domain.com format")

    @validator('group_uuid')
    def match_group_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v
    
    @validator('primary_email_id')
    def match_primary_email_id(cls, v):
        matched = re.match("([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+", v)
        if not (bool(matched)):
            raise ValueError("this field only email in user@domain.com format")
        return v

"""--------------------------------------------------------"""
class GroupCounts(BaseModel):

    group_uuid: str = Field(description="this field only accepts uuidv4")
    device_uuid: str = Field(description="this field only accepts uuidv4")
    tz: str = Field(description="this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
    loclat: Optional [str] = None
    loclong: Optional [str] = None
    device_data: List[List[int]] = Field(description="this field accepts device data")

    @validator('group_uuid')
    def match_group_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v

    @validator('device_uuid')
    def match_device_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v
    
    @validator('tz')
    def match_tz(cls, v):
        if not (v in pytz.all_timezones_set):
            raise ValueError("this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
        return v

"""--------------------------------------------------------"""
class GroupCountsSearch(BaseModel):

    criteria: str
    group_uuid: str = Field(description="this field only accepts uuidv4")
    tz: str = Field(description="this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
    
    @validator('group_uuid')
    def match_group_uuid(cls, v):
        matched = re.match("^[a-f0-9]{8}-?[a-f0-9]{4}-?4[a-f0-9]{3}-?[89ab][a-f0-9]{3}-?[a-f0-9]{12}\Z", v)
        if not (bool(matched)):
            raise ValueError("this field only accepts uuidv4")
        return v

    @validator('tz')
    def match_tz(cls, v):
        if not (v in pytz.all_timezones_set):
            raise ValueError("this field only accepts timezone in 'Asia/Tokyo' or 'America/New York' format")
        return v
    
    @validator('criteria')
    def match_criteria(cls, v):
        matched = re.match("[getgroupcountsrange,1|getgroupcountsrange,7|getgroupcountsrange,15|getgroupcountsrange,31]", v)
        if not (bool(matched)):
            raise ValueError("this field can only accept values = getgroup, getgroups, getcountstile or getlastupdateallgroups")
        return v

"""--------------------------------------------------------"""