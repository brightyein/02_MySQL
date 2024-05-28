-- CONSTRAINTS (제약조건)
-- 제약조건 = 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 테이블 작성 시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수 있다.
-- 데이터 무결성 보장을 목적으로 한다.
-- 입력/ 수정 하는 데이터에 문제가 없는지 자동으로 검사해 주게 하기 위한 목적이다.

-- mysql 에서 사용할 수 있는 제약조건의 종류
-- primary key , not null , unique , check , foreign key

-- not null : null 값을 허용하지 않겠단 제약 조건
-- 데이터를 입력 받을 때 꼭 들어가야 하는 내용

DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
	user_no INT NOT NULL,
    user_id VARCHAR(225) NOT NULL,
    user_pwd VARCHAR(225) NOT NULL,
    user_name VARCHAR(225) NOT NULL,
    gender VARCHAR(3) NOT NULL,
    phone VARCHAR(225) NOT NULL,
    email VARCHAR(225) 
)ENGINE=InnoDB;

DESCRIBE user_notnull;

INSERT INTO user_notnull
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', NULL),
	(2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com');

SELECT * FROM user_notnull;

-- UNIQUE 제약조건
-- 중복값을 허용하지 않는 제약조건

DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique(
	user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(225) NOT NULL,
    user_pwd VARCHAR(225) NOT NULL,
    user_name VARCHAR(225) NOT NULL,
    gender VARCHAR(3),
    PHONE VARCHAR(225) NOT NULL,
    email VARCHAR(225),
    UNIQUE(phone)
)ENGINE=InnoDB;

DESCRIBE user_unique;

INSERT INTO user_unique
	VALUES
		(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@gmail.com');
INSERT INTO user_unique
	VALUES
		(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@gmail.com');
INSERT INTO user_unique
	VALUES
		(2,'user01','pass01','홍길동','남','010-1234-5678','hong123@gmail.com');
        
SELECT * FROM user_unique;

-- PRIMARY KEY
-- 테이블에 대한 식별자 역할을 한다. (한 행의 정보를 찾기 위해 사용할 컬럼)
-- not null + unique 제약 조건 의미
-- 한 테이블당 한개만 설정 가능
-- 한 개 컬럼에 설정할 수도 있고, 여러개의 컬럼을 묶어서 설정할 수도 있음 (복합키)

DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(225) NOT NULL,
    user_pwd VARCHAR(225) NOT NULL,
    user_name VARCHAR(225) NOT NULL,
    gender VARCHAR(3),
    PHONE VARCHAR(225) NOT NULL,
    email VARCHAR(225)
    -- PRIMARY KEY (user_no)
)ENGINE=InnoDB;

INSERT INTO user_primarykey
VALUES 
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
	(2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com');
INSERT INTO user_primarykey
VALUES 
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com');
    
SELECT * FROM user_primarykey;

-- FOREIGN KEY
-- 참조된 다른 테이블에서 제공하는 값만 사용 가능
-- 참조 무결성을 위배하지 않기 위해 사용
-- FOREIGN KEY 제약조건에 의해 테이블 간 관계가 성립됨.
-- 제공되는 값 외에는 NULL 을 사용할 수 있음.
-- FOREIGN KEY 로 설정되어 있는 경우 컬럼을 변경하지 못함

DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade(
	grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(225) NOT NULL
)ENGINE=InnoDB;

INSERT INTO user_grade
VALUES
	(10, '일반회원'),
    (20, '우수회원'),
    (30, '특별회원');
    
SELECT * FROM user_grade;

DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(225) NOT NULL,
    user_pwd VARCHAR(225) NOT NULL,
    user_name VARCHAR(225) NOT NULL,
    gender VARCHAR(3),
    PHONE VARCHAR(225) NOT NULL,
    email VARCHAR(225),
    grade_code INT,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
)ENGINE=InnoDB;

INSERT INTO user_foreignkey1
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
    (2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com', 20);

-- 없는 fk 값을 넣어서 에러
INSERT INTO user_foreignkey1
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 50);
    
SELECT * FROM user_foreignkey1;

-- 에러
UPDATE user_grade
SET grade_code = 1
WHERE grade_code = 10;

-- ON UPDATE SET NULL / ON DELETE SET NULL
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(225) NOT NULL,
    user_pwd VARCHAR(225) NOT NULL,
    user_name VARCHAR(225) NOT NULL,
    gender VARCHAR(3),
    PHONE VARCHAR(225) NOT NULL,
    email VARCHAR(225),
    grade_code INT,
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
    ON UPDATE SET NULL
    ON DELETE SET NULL
)ENGINE=InnoDB;

INSERT INTO user_foreignkey2
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
    (2, 'user02', 'pass02', '유관순', '여', '010-7777-7777', 'yu77@gmail.com', 20);
    
SELECT * FROM user_foreignkey2;

UPDATE user_grade
SET grade_code = 1
WHERE grade_code = 10;

SELECT * FROM user_foreignkey2;

DELETE FROM user_grade
WHERE grade_code = 20;
SELECT * FROM user_foreignkey2;

-- CHECK : CHECK 제약 조건 위반 시 허용하지 않는 제약 조건

DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check(
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남', '여')),
    age INT CHECK (age >= 19)
)ENGINE=InnoDB;

INSERT INTO user_check
 VALUES
	(null, '홍길동','남',25),
    (null, '이순신' , '남', 33);
    
SELECT * FROM user_check;
 
 INSERT INTO user_check
 VALUES
	(null, '홍길동','남성',25);
 INSERT INTO user_check
 VALUES
	(null, '홍길동','남',17);

-- DEFAULT
-- 컬럼에 NULL 대신 기본 값 적용.
-- 컬럼 타입이 DATE 일 시 current_date 만 가능
-- 컬럼 타입이 DATETIME 일 시 current_time, current_timestamp, now() 모두 가능

DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country(
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
)ENGINE=INNODB;

INSERT INTO tbl_country
 VALUES(null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
 
 SELECT * FROM tbl_country;

