-- SELECT * FROM atomic.com_snowplowanalytics_snowplow_client_session_1 LIMIT 10


SELECT * FROM atomic.com_rocketmiles_session_context_1 
-- WHERE session_id like '%D6C7BC10F2DF0A33D288C6248DE1F9F71%'
WHERE root_id = 'd678e600-ee6b-4a84-9c2c-06682fc8208b'
LIMIT 10;


SELECT * FROM atomic.events 
WHERE domain_sessionid = 'd678e600-ee6b-4a84-9c2c-06682fc8208b' LIMIT 10;


SELECT * FROM atomic.com_snowplowanalytics_snowplow_client_session_1 
WHERE root_id = '392d85fe-c63a-4142-909c-dea2b49a4374'
LIMIT 10 ;
