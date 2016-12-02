SELECT DISTINCT
       rm_session_id,
       start_dt,
       page_load_event_message,
       provider_name_1
FROM public.mv_dp_attempts 
WHERE page_load_event_message = 'priceIncrease'
AND start_dt > '2016-11-04'
AND start_dt < '2016-11-05'
AND provider_name_1 IN ('Tourico', 'PricelineCUG')
  LIMIT 100
