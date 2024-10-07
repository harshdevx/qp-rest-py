import sys
import os
from dotenv import load_dotenv
from pymysql import connect
from pymysql.cursors import DictCursor

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))


def main():
    sys.path.append('/Volumes/devdisk/python/qp-rest-py/src')
    from src.db import DB

    load_dotenv('.env')

    # conn = connect(host=os.getenv('DATABASE_HOST'),
    #                user=os.getenv('DATABASE_USERNAME'),
    #                password=os.getenv('DATABASE_PASSWORD'),
    #                db=os.getenv('DATABASE_NAME'),
    #                port=int(os.getenv('DATABASE_PORT')),
    #                cursorclass=DictCursor, autocommit=True)

    db = DB()
    sql = 'SHOW TABLES;'
    db.execute(sql)
    tables: list = db.fetchall()

    tables_not_to_change = ["get_event_summary",
                            "get_events_items_summary",
                            "get_events_items_summary_1",
                            "get_groups_summary",
                            "get_groups_summary_with_different_tz",
                            "get_subscriptions",
                            "get_user_mappings",
                            "view_categories_in_domains",
                            "view_items_in_categories_and_domains"
                            ]

    for table in tables:
        table_name = table.get("Tables_in_qp_count_db")
        sql = f"SHOW COLUMNS FROM `{table_name}`;"

        db.execute(sql)
        columns: list = db.fetchall()

        if table_name not in tables_not_to_change:

            for column in columns:
                print(column)
                column_to_lower_case = str(column.get('Field')).lower()
                sql = f"ALTER TABLE `{table_name}` RENAME COLUMN `{column.get('Field')}` TO `{column_to_lower_case}`;"
                print(
                    f"changing column from {column.get('Field')} to {column_to_lower_case} for table {table}")
                db.execute(sql)
        else:
            print("not changing anything")


main()
