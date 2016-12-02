select guest_name, booking_id,carsolize_hotel_booking_id, price_value
FROM  provider_room_booking
WHERE carsolize_hotel_booking_id in('SWR432','QHDVMR','23ZTFZ','51ZR4K','L5328S','N3PY8B','1RC5LR','QRP4WW','J2XS87','657C22','KR4DMX','K5T2Z2')
ORDER BY date_created DESC 

