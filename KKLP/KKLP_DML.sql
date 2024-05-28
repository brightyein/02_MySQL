INSERT INTO passenger (passenger_id, passenger_pw, passenger_name, passenger_phone, gender, passenger_SSN, joined) VALUES
('john123', 'pass1', '홍길동', '010-1234-5678', 'M', '123456-7890123', NOW()),
('alice456', 'pass2', '김영희', '010-2345-6789', 'F', '456789-0123456', NOW()),
('mike789', 'pass3', '박철수', '010-3456-7890', 'M', '789012-3456789', NOW()),
('sarah101', 'pass4', '이미자', '010-4567-8901', 'F', '101112-1314151', NOW()),
('kevin112', 'pass5', '정수빈', '010-5678-9012', 'M', '112131-4151516', NOW()),
('emily131', 'pass6', '최영미', '010-6789-0123', 'F', '131415-1617181', NOW()),
('david141', 'pass7', '송민준', '010-7890-1234', 'M', '141516-1718191', NOW()),
('lisa515', 'pass8', '김지연', '010-8901-2345', 'F', '515617-1819201', NOW()),
('james161', 'pass9', '이준호', '010-9012-3456', 'M', '161718-1920212', NOW()),
('sophia171', 'pass10', '장미란', '010-0123-4567', 'F', '171819-2021222', NOW());

SELECT * FROM passenger;

INSERT INTO airplane (model, capacity, airline_name)
VALUES 
('Boeing 747', 400, 'Airline A'),
('Airbus A320', 200, 'Airline B'),
('Boeing 777', 300, 'Airline C'),
('Airbus A380', 500, 'Airline D'),
('Boeing 737', 150, 'Airline E'),
('Embraer E190', 100, 'Airline F'),
('Bombardier CRJ900', 90, 'Airline G');

SELECT * FROM airplane;

INSERT INTO flight_schedule (airplane_code, departure_airport, arrival_airport, departure_date, arrival_date, flight_time) 
VALUES
(1, 'JFK', 'LAX', '2024-06-01 08:00:00', '2024-06-01 11:00:00', '03:00:00'),
(2, 'LAX', 'JFK', '2024-06-01 12:00:00', '2024-06-01 15:00:00', '03:00:00'),
(3, 'LHR', 'CDG', '2024-06-02 09:00:00', '2024-06-02 11:30:00', '02:30:00'),
(4, 'CDG', 'LHR', '2024-06-02 12:30:00', '2024-06-02 15:00:00', '02:30:00'),
(5, 'SFO', 'ORD', '2024-06-03 10:00:00', '2024-06-03 13:30:00', '04:30:00'),
(6, 'ORD', 'SFO', '2024-06-03 14:30:00', '2024-06-03 18:00:00', '04:30:00'),
(1, 'HND', 'ICN', '2024-06-04 08:30:00', '2024-06-04 11:30:00', '02:00:00'),
(2, 'ICN', 'HND', '2024-06-04 12:30:00', '2024-06-04 15:30:00', '02:00:00'),
(3, 'AMS', 'FRA', '2024-06-05 11:00:00', '2024-06-05 12:30:00', '01:30:00'),
(5, 'FRA', 'AMS', '2024-06-05 13:30:00', '2024-06-05 15:00:00', '01:30:00');
SELECT * FROM flight_schedule;

INSERT INTO reservation (passenger_code, schedule_code) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(6, 6),
(7, 7),
(8, 2),
(9, 1),
(10, 1);
SELECT * FROM reservation;