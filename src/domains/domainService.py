from ..db import engine
from . import converter 

def getDomains():

    try:
        raw_conn = engine.raw_connection()
        cur = raw_conn.cursor(dictionary=True)
        cur.callproc('sp_v2_get_domains')

        for result in cur.stored_results():
            rs = result.fetchall()

        processed_domains_list = []
        for domain in rs:
            processed_domains_list.append(converter.convertRecordSetToDomains(domain))

        raw_conn.close()
        
        return processed_domains_list
    except Exception as e:
        print(e)