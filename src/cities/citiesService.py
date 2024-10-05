from ..db import engine
from ..cities import converter

async def getCities():

    processed_cities_data = []

    raw_conn = engine.raw_connection()
    cur = raw_conn.cursor(dictionary=True)

    cur.callproc('sp_v3_get_cities')
    for results in cur.stored_results():
        cities = results.fetchall()
    
    for city in cities:
        processed_cities_data.append(converter.convertRecordSetToGetCities(city))

    raw_conn.close()

    return processed_cities_data
