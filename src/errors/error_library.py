import error_msg_library


class ErrorLib():

    def __init__(self) -> None:

        self.__errorMsg: dict = {}

    def getNoRecords(self) -> dict:
        self.__errorMsg.update({
            "code": 0,
            "message": "no records"
        })

        return self.__errorMsg

    def getUnauthorized(self) -> dict:
        self.__errorMsg.update({
            "code": 0,
            "message": "unauthorized request"
        })

        return self.__errorMsg

    def getBadRequest(self) -> dict:
        self.__errorMsg.update({
            "code": 0,
            "message": "bad request either field value is wrong or technical error"
        })

        return self.__errorMsg

    def getResourceCreated(self):
        self.__errorMsg.update({
            "code": 1,
            "message": "resource created successfully"
        })

        return self.__errorMsg

    def getResourceUpdated(self):
        self.__errorMsg.update({
            "code": 1,
            "message": "resource updated successfully"
        })

        return self.__errorMsg

    def getResourceError(self):
        self.__errorMsg.update({
            "code": 0,
            "message": "could not create resource"
        })

        return self.__errorMsg

    def getResourceNotFound(self):
        self.__errorMsg.update({
            "code": 0,
            "message": "resource not found"
        })

        return self.__errorMsg

    def getCouldNotAddRecord(self):
        self.__errorMsg.update({
            "code": 0,
            "message": "could not add record"
        })

        return self.__errorMsg

    def getCouldNotEditRecord(self):
        self.__errorMsg.update({
            "code": 0,
            "message": "could not update record"
        })

        return self.__errorMsg

    def getSuccess(self):
        self.__errorMsg.update({
            "code": 1,
            "message": "success"
        })

        return self.__errorMsg

    def getTestData(self):
        self.__errorMsg.update({
            "code": 1,
            "message": "test data used"
        })

        return self.__errorMsg

    def getAuth103(self):
        self.__errorMsg.update(
            {
                "code": "AUTH-103",
                "message": "invalid refresh token..."
            }
        )

        return self.__errorMsg

    def getAuth105(self):
        self.__errorMsg.update(
            {
                "code": "AUTH-105",
                "request_code": "86c89e62af6f848e74829de2921b2199fa724d47",
                "message": "user registration required..."
            }
        )

        return self.__errorMsg

    def getAuth106(self):
        self.__errorMsg.update(
            {
                "code": "AUTH-106",
                "request_code": "2c1e2b1daf8e75bbba55ee03e9b6e28c23686988",
                "message": "user activation required..."
            }
        )

        return self.__errorMsg
