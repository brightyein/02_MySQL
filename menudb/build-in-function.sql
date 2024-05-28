-- BUILD IN FUNCTION

-- 문자열 관련 함수

SELECT ascii('A');

-- CONCAT : 문자열을 이어붙이는 함수

SELECT CONCAT('호랑이', '돼지');
SELECT concat_ws(',','호랑이','돼지');
SELECT concat_ws('-','2023','05','30');

-- ELT(위치, 문자열1, 문자열2,....) : 문자열반환 - FIELD(찾을문자열, 문자열1, 문자열2,...) : 위치반환
-- FIND_IN_SET(찾을 문자열, 문자열 리스트...) : 위치반환 - INSTR(기존문자열, 부분문자열) : 시작위치반환
-- LOCATE(부분문자열, 기준문자열) : INSTR과 같음

SELECT ELT(2,'사과','딸기','바나나');  -- 해당 위치의 문자열 반환
SELECT FIELD('딸기','사과','딸기','바나나'); -- 찾을 문자열 위치 반환
SELECT find_in_set('바나나','사과,딸기,바나나'); -- 찾을 문자열의 위치 반환
SELECT INSTR('사과딸기바나나','딸기'); -- 기존 문자열에서 부분 문자열의 시작 위치 반환
SELECT LOCATE('딸기','사과딸기바나나');


-- FORMAT(숫자, 소수점 자리수)
SELECT FORMAT(12342123142123.342353, 3); -- 12,342,123,142,123.342

-- BIN(2) OCT(8) HEX(16) -- 이진수, 팔진수, 십육진수
SELECT BIN(65), OCT(65), HEX(65); -- 1000001 / 101 / 41

-- INSERT(기존 문자열, 위치, 길이, 삽입할 문자열);
SELECT INSERT('내 이름은 아무개 입니다.', 7, 3, '홍길동'); -- 내 이름은 홍길동 입니다.

-- LEFT(문자열, 길이) RIGHT(문자열, 길이)
SELECT LEFT('HELLO WORLD', 3), RIGHT('HELLO WORLD', 3); -- HEL / RLD

-- UPPER(문자열) , LOWER(문자열)
SELECT LOWER('AAAaaa') , upper('aaaAAA');

-- LPAD(문자열,길이,채울문자열) RPAD(문자열,길이,채울문자열)
SELECT LPAD('왼쪽',6,'@'), RPAD('오른쪽',6,'@');

-- LTRIM(문자열) , RTRIM(문자열)
SELECT ltrim('     왼쪽'), rtrim('오른쪽    ');

-- TRIM(문자열)

SELECT TRIM('  MYSQL  ');
SELECT TRIM(BOTH '@' FROM '@@@MYSQL@@@');
-- LEADING (앞), BOTH(양쪽), TRAILING(뒤)

-- REPEAT(문자열,횟수)
SELECT REPEAT('MYSQL',3);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE('마이SQL', '마이', 'MY');

-- REVERSE(문자열)
SELECT REVERSE('STRESSED'); -- DESSERTS

-- SPACE(길이)
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는',SPACE(3), '세 입니다.');

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT substring('안녕하세요 반갑습니다', 7, 2);
SELECT substring('안녕하세요 반갑습니다', 7);

-- SUBSTRING_INDEX(문자열, 구분자, 횟수)
SELECT substring_index('hong.test@gmail.com','.',2);


-- 수학 관련 함수

-- ABS(숫자)
SELECT abs(-123); -- 123

-- CEILING(숫자),  FLOOR(숫자), ROUND(숫자)
SELECT ceiling(1234.56), FLOOR(1234.56) , ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV(1010,2,8);

-- POW(숫자1, 숫자2) SQRT(숫자)
SELECT POW(2.4), sqrt(16);

-- RAND()
-- 0 이상 1 미만의 실수
-- M 과 N 사이의 임의의 정수를 구하려면
SELECT RAND(), floor(RAND() * (11-1) + 1); -- (최댓값-최솟값) + 최솟값

-- SIGN(숫자) : 양수면 1, 음수면 -1, 0이면 0 반환
SELECT sign(10.1), sign(0), sign(-10.1);

-- TRUNCATE(숫자, 정수)
-- 소수점을 기준으로 정수 위치까지 구하고 나머지는 버린다.
SELECT truncate(12345.12345, 2), truncate(12345.12345, -2);

-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
SELECT adddate('2023-05-31', INTERVAL 30 DAY);
SELECT subdate('2023-05-31', INTERVAL 30 DAY);

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
SELECT ADDTIME('2023-05-31 09:00:00', '1:0:1');
SELECT SUBTIME('2023-05-31 09:00:00', '1:0:1');

-- CURDATE(), CURTIME(), NOW(), SYSDATE()
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();


SELECT YEAR(CURDATE()), MONTH(CURDATE()), dayofmonth(CURDATE());
SELECT HOUR(CURTIME()), minute(CURTIME()), SECOND(CURRENT_TIME()),MICROSECOND(current_time());


SELECT DATE(NOW()), TIME(now());


-- DATEDIFF(날짜1,날짜2) , TIMEDIFF(날짜또는시간1,날짜또는시간2)
SELECT DATEDIFF('2024-05-30',NOW());
SELECT TIMEDIFF('17:07:11', '13:06:10');


-- DAYOFWEEK(날짜) , MONTHNAME(), DAYOFYEAR(날짜)

SELECT DAYOFWEEK(CURDATE());
SELECT MONTHNAME(CURDATE());
SELECT DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
SELECT LAST_DAY('20230201'); -- 2023-02-28

-- MAKEDATE(연도, 정수)
SELECT makedate(2024, 32); -- 2024-02-01

-- PERIOD_ADD(연월, 개월 수)
SELECT period_add(202305, 6); -- 202311

-- QUARTER(날짜) : 해당 날짜의 분기
SELECT quarter(curdate()); -- 2

-- TIME_TO_SEC(시간)
-- 입력한 시간을 초 단위로 구함
SELECT time_to_sec('1:1:1'); -- 3661








