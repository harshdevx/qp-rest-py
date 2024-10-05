import datetime
from random import randrange
from time import strftime

def convertDateTime(lDateTime):

    if (lDateTime):
        return datetime.datetime.strftime(lDateTime, "%Y-%m-%d %H:%M:%S")
    
def convertToMySqlDateTime(lDateTime: datetime):

    if(lDateTime):
        return datetime.datetime.strftime(lDateTime, "%Y-%m-%d %H:%M:%S")

def generateRandomPin():

    rand_string: str = f'{randrange(1, 10**6):06}'
    return rand_string

def deviceDataFormatter(deviceData):

    processed_device_data: dict

    #processing day
    if ((deviceData[3] >= 1) & (deviceData[3] <=9)):
        day: str = "{:02d}".format(deviceData[3])
    else:   
        day: str = deviceData[3]

    #processing month
    if ((deviceData[4] >= 1) & (deviceData[4] <=9)):
        month: str = "{:02d}".format(deviceData[4])
    else:   
        month: str = deviceData[4]

    #processing year
    year: str = "20"+format(deviceData[5])
    
    #processing hour
    if ((deviceData[6] >= 1) & (deviceData[6] <=9)):
        hour: str = "{:02d}".format(deviceData[6])
    else:   
        hour: str = deviceData[6]

    #processing mins
    if ((deviceData[7] >= 0) & (deviceData[7] <=9)):
        minutes: str = "{:02d}".format(deviceData[7])
    else:   
        minutes: str = deviceData[7]

    #processing seconds
    if ((deviceData[8] >= 0) & (deviceData[8] <=9)):
        seconds: str = "{:02d}".format(deviceData[8])
    else:   
        seconds: str = deviceData[8]

    count_date: str = f"{year}-{month}-{day} {hour}:{minutes}:{seconds}"

    #processing positive and negative count
    if (deviceData[2]/16 == 1):
        counts: int = 1
    elif (deviceData[2/16] == 2):   
        counts: int = -1
    
    if (deviceData[2]%16 == 0):
        counter_number: str = "C1"
    elif (deviceData[2]%16 == 1):
        counter_number: str = "C2"

    processed_device_data = {
        
        'count_date' : count_date,
        'counts': counts,
        'counter_number' : counter_number
    }

    return processed_device_data