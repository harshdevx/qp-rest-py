
error_lib: dict = {
    "auth": {
        "AUTH-101": {"code": "AUTH-101", "message": "invalid id token..."},
        "AUTH-102": {"code": "AUTH-102", "message": "invalid access token..."},
        "AUTH-103": {"code": "AUTH-103", "message": "invalid refresh token..."},
        "AUTH-104": {"code": "AUTH-104", "message": "unauthorized access..."},
        "AUTH-105": {"code": "AUTH-105", "request_code": "86c89e62af6f848e74829de2921b2199fa724d47", "message": "user registration required..."},
        "AUTH-106": {"code": "AUTH-106", "request_code": "2c1e2b1daf8e75bbba55ee03e9b6e28c23686988", "message": "user activation required..."}
    },

    "common": {
        "COMN-101": {"code": "COMN-101", "message": "invalid uuid format..."},
        "COMN-102": {"code": "COMN-102", "message": "no records"}
    },

    "user": {
        "USER-101": {"code": "USER-101", "message": "bad request..."},
        "USER-102": {"code": "USER-102", "message": "invalid full name..."}

    },

    "device": {
        "DEVICE-101": {"code": "DEVICE-101", "message": "device registered successfully..."},
        "DEVICE-102": {"code": "DEVICE-102", "message": "device is already registered; un-register to proceed..."},
        "DEVICE-103": {"code": "DEVICE-103", "message": "device is currently active; deactivate first to proceed..."},
        "DEVICE-104": {"code": "DEVICE-104", "message": "only one ble device can be active..."},
        "DEVICE-105": {"code": "DEVICE-105", "message": "device created successfully..."},
        "DEVICE-106": {"code": "DEVICE-106", "message": "could not create device..."},
        "DEVICE-107": {"code": "DEVICE-107", "message": "device activated..."},
        "DEVICE-108": {"code": "DEVICE-108", "message": "could not activate device..."},
        "DEVICE-109": {"code": "DEVICE-109", "message": "device deactivated..."},
        "DEVICE-110": {"code": "DEVICE-110", "message": "could not deactivate device..."}

    }
}
