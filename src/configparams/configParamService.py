from ..db import engine
from ..utils import convertToMySqlDateTime

async def getPromoOffer():

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)
    cur.callproc('sp_v3_get_config_param_value', ['PROMO_OFFER'])

    for result in cur.stored_results():
        rs = result.fetchone()
    
    config_value = rs["VALUE"]
    
    raw_conn.close()

    return config_value