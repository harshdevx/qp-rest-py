import os
from pymysql import connect
from pymysql.cursors import DictCursor


class DB():

    def __init__(self):
        self._host = os.getenv("DATABASE_HOST")
        self._port = os.getenv("DATABASE_PORT")
        self._username = os.getenv("DATABASE_USERNAME")
        self._password = os.getenv("DATABASE_PASSWORD")
        self._database = os.getenv("DATABASE_NAME")

        self._conn = connect(host=self._host,
                             user=self._username,
                             password=self._password,
                             db=self._database,
                             port=int(self._port),
                             cursorclass=DictCursor, autocommit=True)
        self._cursor = self._conn.cursor()

    def __enter__(self):
        return self

    def __exit__(self):
        self.close()

    @property
    def connection(self):
        return self._conn

    @property
    def cursor(self):
        return self._cursor

    def commit(self):
        self.connection.commit()

    def close(self, commit=True):
        if commit:
            self.commit()
        self.connection.close()

    def execute(self, sql, params=None):
        self.cursor.execute(sql, params or ())

    def executemany(self, sql, params=None):
        self.cursor.executemany(sql, params or ())

    def fetchall(self):
        return self.cursor.fetchall()

    def fetchone(self):
        return self.cursor.fetchone()

    def query(self, sql, params=None):
        self.cursor.execute(sql, params or ())
        return self.fetchall()
