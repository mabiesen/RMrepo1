SELECT DISTINCT rm_session_id as "Session ID", start_dt as "Start Date", page_load_event_message as "Error", provider_name_1 as "Provider"
 FROM mv_book_attempts 
WHERE  
-- "group" = 'rm.book' AND 
reservation_id =''
AND start_dt > '2016-11-07'
AND start_dt < '2016-11-08'
-- AND provider_name_1 IN ('Tourico')
AND provider_name_1 IS NOT NULL
and page_load_event_message = 'payment_page.room.no_room'
-- AND page_load_event_message LIKE '%price_increase%'
GROUP BY rm_session_id, start_dt, provider_name_1, page_load_event_message HAVING COUNT(rm_session_id) < 2
ORDER BY start_dt ASC LIMIT 50
