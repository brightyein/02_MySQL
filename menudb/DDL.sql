-- DDL
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용

-- CREATE
-- 테이블 생성을 위한 구문
-- IF NOT EXISTS 를 적용하면 기존에 존재하는 테이블이더라도 에러가 발생하지 않는다.

-- table 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk int PRIMARY KEY,
    fk int,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y','N'))
)ENGINE = InnoDB;

-- table 정보 보기
DESCRIBE tb1;

INSERT INTO tb1 VALUES(1,10,'Y');

SELECT * FROM tb1;

-- INT AUTO_INCREMENT PRIMARY KEY (PK 자동 생성)
CREATE TABLE IF NOT EXISTS tb2 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(225),
    CHECK(col1 IN ('Y','N'))
)ENGINE = InnoDB;

DESCRIBE tb2;

INSERT INTO tb2 VALUES (null, 10, 'Y');
INSERT INTO tb2 VALUES (null, 20, 'Y');
INSERT INTO tb2 VALUES (null, 30, 'Y');

SELECT * FROM tb2;

-- ALTER
-- 테이블에 추가, 변경, 삭제하는 모든것은 ALTER 명령어를 사용해 적용한다
-- 종류가 너무 많고 복잡해서 대표적인 것들 살펴본다.

-- ADD : 컬럼 생성
ALTER TABLE tb2
ADD col2 INT;
DESCRIBE tb2;

-- DROP : 컬럼 삭제
ALTER TABLE tb2
DROP COLUMN col2;
DESCRIBE tb2;

-- CHANGE : 컬럼 내용 수정 (컬럼명도 변경 가능)
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;
DESCRIBE tb2;

-- MODIFY
ALTER TABLE tb2
MODIFY pk INT;

-- AUTO_INCREMENT 가 걸려있으면 DROP 이 안된다
ALTER TABLE tb2
DROP PRIMARY KEY;

-- MODIFY 로 컬럼의 타입 수정 수 다시 위의 DROP 해보면 이젠 된다
ALTER TABLE tb2
MODIFY pk INT;
DESCRIBE tb2;

-- DROP
-- 테이블을 삭제하기 위한 구문
DROP TABLE IF EXISTS tb1, tb2;
DESCRIBE tb1;
DESCRIBE tb2;