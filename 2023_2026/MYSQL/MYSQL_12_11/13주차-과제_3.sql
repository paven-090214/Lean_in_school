drop database if exists handb;


CREATE DATABASE `handb` 

  default character set utf8mb4;


use handb;

DROP TABLE if exists 주문;

DROP TABLE if exists 고객;

DROP TABLE if exists 제품;

-- 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)

-- 제품(제품번호, 제품명, 재고량, 단가, 제조업체)

-- 주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)


CREATE TABLE 고객 (

고객아이디  VARCHAR(20) NOT NULL,

고객이름    VARCHAR(10),

나이         INT,

등급         VARCHAR(10) NOT NULL,

직업         VARCHAR(20),

적립금      INT             DEFAULT 0,

PRIMARY KEY(고객아이디)

);

CREATE TABLE 제품 (

제품번호    CHAR(3) NOT NULL,

제품명       VARCHAR(20),

재고량       INT,

단가         INT,

제조업체    VARCHAR(20),

PRIMARY KEY(제품번호)

-- CHECK (재고량 >= 0 AND 재고량 <= 10000)

);

CREATE TABLE 주문 (

주문번호    CHAR(3) NOT NULL,

주문고객    VARCHAR(20),

주문제품    CHAR(3),

수량         INT,

배송지      VARCHAR(30),

주문일자    DATE,

PRIMARY KEY(주문번호),

FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),

FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)

);

--  고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)

INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);

INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);

INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);

INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);

INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);

INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);


--  제품(제품번호, 제품명, 재고량, 단가, 제조업체)

INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');

INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');

INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');

INSERT INTO 제품 VALUES ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');

INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');

INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');

INSERT INTO 제품 VALUES ('p07', '달콤비스켓', 1650, 1500, '한빛제과');


--  주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)

INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01');

INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '13/01/10');

INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '13/01/11');

INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '13/02/01');

INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '13/02/20');

INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '13/03/02');

INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '13/03/15');

INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '13/04/10');

INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '13/04/11');

INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '13/05/22');

--  고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)

--  제품(제품번호, 제품명, 재고량, 단가, 제조업체)

--  주문(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)


select * from 고객;
select * from 제품;
select * from 주문;

-- 예제7-40) 주문 테이블에서 달콤비스켓과 같은 제조업체에서 제조한 제품의 제품명과 단가를 검색하라
select p.제품명, p.단가
from 주문 o
join 제품 p on o.주문제품 = p.제품번호
where p.제조업체 = (select p.제조업체
					from 제품 p
                    where p.제품명='달콤비스켓');
-- 예제7-41) 주문 테이블에서 적립금이 가장 많은 고객의 고객이름과 적립금을 검색하라
SELECT 고객이름, 적립금
FROM 고객
WHERE 적립금 = (SELECT MAX(적립금) FROM 고객);
-- 예제7-42) 주문 테이블에서 banana 고객이 주문한 제품의 제품명과 제조업체를 검색하라(IN 사용)
select distinct p.제품명, p.제조업체
from 주문 o
join 제품  p on o.주문제품 = p.제품번호
where o.주문제품 in (select o.주문제품
					from 주문 o
                    where o.주문고객 = 'banana');
-- 예제7-43) 주문 테이블에서 banana 고객이 주문하지 않은 제품의 제품명과 제조업체를 검색하라(하위질의)(NOT  IN)
select distinct 제품명, 제조업체
from 제품
where 제품번호 not in (select 주문제품
				from 주문 
                where 주문고객 ='banana');
-- 예제7-44) 주문 테이블에서 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색하라(ALL)
select 제품명, 단가, 제조업체
from 제품
where 단가 > all (select 단가
				from 제품
                where 제조업체='대한식품');
-- 예제7-45) 주문 테이블에서 2013년 3월 15일에 제품을 주문한 고객의 고객이름을 검색하라

-- 1) (조인)
select c.고객이름
from 고객 c
join 주문 o on c.고객아이디 = o.주문고객
where o.주문일자 like '%3-15%';
-- 2) (EXISTS 사용)
select c.고객이름
from 고객 c
where exists (select o.주문고객
						from 주문 o
                        where o.주문고객 = c.고객아이디 and o.주문일자 like '%3-15%');

-- 예제7-46) 주문 테이블에서 2013년 3월 15일에 제품을 주문하지 않은 고객의 고객이름을 검색하라(NOT EXISTS)
select c.고객이름
from 고객 c
join 주문 o on c.고객아이디 = o.주문고객
where not exists (select o.주문고객
					from 주문 o
                    where c.고객아이디 = o.주문고객 and 주문일자 like '%3-15%');

select * from 고객;
select * from 제품;
select * from 주문;