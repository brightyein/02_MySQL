SELECT departure_date, passenger_name, passenger_phone
FROM reservation
INNER JOIN flight_schedule ON reservation.schedule_code = flight_schedule.schedule_code
INNER JOIN passenger ON reservation.passenger_code = passenger.passenger_code
WHERE date_format(departure_date, '%Y-%m-%d') = '2024-06-03'
ORDER BY passenger_name ASC;

SELECT passenger_name AS NAME, passenger_phone AS PHONE, gender AS GENDER, departure_airport, arrival_airport, departure_date, airline_name
FROM reservation
INNER JOIN flight_schedule ON reservation.schedule_code = flight_schedule.schedule_code
INNER JOIN passenger ON reservation.passenger_code = passenger.passenger_code
INNER JOIN airplane ON flight_schedule.airplane_code = airplane.airplane_code
WHERE gender = 'M'
ORDER BY departure_date ASC;

SELECT *
FROM flight_schedule
JOIN airplane ON airplane.airplane_code = flight_schedule.airplane_code
WHERE model LIKE 'Boeing%';
