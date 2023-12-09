-- 11주차 조인 실습 - 1
drop table 정회원;
drop table 준회원;

CREATE TABLE 정회원 (
    번호          INT                 PRIMARY KEY ,
    이름          VARCHAR(12)   NOT NULL ,
    주민번호    CHAR(14)         NOT NULL ,
    휴대폰번호 CHAR(14)         NOT NULL,
    이메일       VARCHAR(30) ,
    등록일       CHAR(8)
);

CREATE TABLE 준회원 (
    번호          INT                 PRIMARY KEY ,
    이름          VARCHAR(12)   NOT NULL ,
    주민번호    CHAR(14)         NOT NULL ,
    휴대폰번호 CHAR(14)         NOT NULL,
    이메일       VARCHAR(30) ,
    등록일       CHAR(8)
);

-- 정회원 데이터 입력
INSERT INTO 정회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 1, '홍길동', '820416-1234567', '(010) 123-1231','gdhong@gmail.com','20070302');

INSERT INTO 정회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 2, '임꺽정', '830507-2345678', '(010) 122-1222','jung@hanmail.net','20050422');

-- 준회원 데이터 입력 */

-- 참고) 집합연산 실습을 위해서 홍길동 동일한 데이터를 입력한다. 
-- 즉, 홍길동 은 정회원, 준회원 이다

INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 1, '홍길동', '820416-1234567', '(010) 123-1231','gdhong@gmail.com','20070302');

INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 3, '박찬호', '850321-1456789', '(010) 133-1231','chpark@hanmail.net','20090512');

INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 4, '선동열', '761122-1889911', '(010) 144-1222','sun@naver.com','20080605');

SELECT * FROM 정회원;
SELECT * FROM 준회원;

-- 정회원 과 준회원을 UNION 연산을 이용하여 검색하라
select *
from 정회원
UNION
select *
from 준회원;

-- 예제2) 정회원 과 준회원을 INTERSECT 연산을 이용하여 검색하라
-- (MySQL 지원하지 않음)
/*
select *
from 정회원
intersect
select *
from 준회원;
intersect 사용해서 교집합 구하기

select *
from 정회원
except
select *
from 준회원;
except 사용해서 차집합 구하기
*/

-- 내부조인
SELECT *
FROM 정회원
INNER JOIN 준회원 ON 정회원.번호 = 준회원.번호;

-- 자연조인
SELECT *
FROM 정회원
NATURAL JOIN 준회원;

-- 왼쪽외부조인
SELECT *
FROM 정회원
LEFT JOIN 준회원 ON 정회원.번호 = 준회원.번호;

-- 오른쪽외부조인
select *
from 정회원
right join 준회원 on 정회원.번호 = 준회원.번호;

