USE KKLP;

CREATE TABLE IF NOT EXISTS passenger (
	passenger_code int AUTO_INCREMENT PRIMARY KEY,
    passenger_id VARCHAR(50) NOT NULL,
    passenger_pw VARCHAR(50) NOT NULL,
    passenger_name VARCHAR(50) NOT NULL,
    passenger_phone VARCHAR(50) NOT NULL,
    gender VARCHAR(3) NOT NULL,
    CHECK(gender IN ('M', 'F')),
    passenger_SSN VARCHAR(50) NOT NULL,
    joined TIMESTAMP NOT NULL
)ENGINE = InnoDB;
    
DESCRIBE passenger;
    
CREATE TABLE IF NOT EXISTS airplane (
	airplane_code int AUTO_INCREMENT PRIMARY KEY,
	model VARCHAR(50) NOT NULL,
	capacity int NOT NULL,
	airline_name VARCHAR(50)
)ENGINE = InnoDB;
    
DESCRIBE airplane;
    
CREATE TABLE IF NOT EXISTS flight_schedule (
	schedule_code int AUTO_INCREMENT PRIMARY KEY,
	airplane_code int,
	departure_airport VARCHAR(100) NOT NULL,
	arrival_airport VARCHAR(100) NOT NULL,
	departure_date DATETIME NOT NULL,
	arrival_date DATETIME NOT NULL,
	flight_time TIME
)ENGINE = InnoDB;
    
ALTER TABLE flight_schedule
ADD FOREIGN KEY (airplane_code) REFERENCES airplane(airplane_code);

DESCRIBE flight_schedule;
    
CREATE TABLE IF NOT EXISTS reservation (
	reservation_code int AUTO_INCREMENT PRIMARY KEY,
	passenger_code int,
	schedule_code int
)ENGINE = InnoDB;
    
ALTER TABLE reservation
ADD FOREIGN KEY (passenger_code) REFERENCES passenger(passenger_code);
ALTER TABLE reservation
ADD FOREIGN KEY (schedule_code) REFERENCES flight_schedule(schedule_code);
DESCRIBE reservation;

show TABLES;
    
SET foreign_key_checks = 0;

-- DROP TABLE passenger, seat_class, airplane, flight_schedule, seat, reservation, payment;

    
    
    