-- 9주차 데이터베이스
CREATE TABLE customer ( cno char(4) NOT NULL , cname varchar(10) NOT NULL , city varchar(20) , point int , CONSTRAINT pk_customer_cno PRIMARY KEY(cno) );

insert into customer values('c101','홍길동','서울',500); insert into customer values('c102','임꺽정','인천',300); insert into customer values('c103','박찬호','안양',800); insert into customer values('c204','신동엽','과천',350); insert into customer values('c205','정진우','고양',400);

select *
from customer;

select cno, cname, city, point
from customer;

select cname, city
from customer;

select cname 성명, city 거주지
from customer;

-- customer 테이블에서 거주지 검색
select city
from customer;

-- 중복 행 제거해서 출력 distinct
select distinct city 
from customer;

select cname, city, cno
from customer
-- where city ='안양' or city = '서울';
where city in('안양','서울');

select cname, cno, city
from customer
-- where city!='안양' and city!='서울';
where city not in('안양','서울');

select cno, cname, city, point
from customer
where cname like '홍%' or cname like '박%' or cname like '정%';-- 홍으로 시작하거나 박으로 시작하거나 정으로 시작하는 결과 출력

select cno, cname, city
from customer
where cname not like '홍%' and cname not like '박%' and cname not like '정%';-- 홍으로 시작하지 않고, 박으로 시작하지 않고, 정으로 시작하지 않는 결과 출력

select *
from customer
where 

select *
from customer
where cname not like '홍%' and cname not like '박%';-- 홍으로 시작하지 않고, 박으로 시작하지 않는 결과 출력

insert customer values('c104', '안진호','경기',null);

select cname, cno, point
from customer
where point is null;

select *
from customer
where city='서울'
order by city ASC;

select *
from customer
order by city ASC, point DESC;

select *
from customer
order by point asc, cname asc, city asc;

select *
from customer
order by 3; -- 3번째 컬럼의 기준, 오름차 순으로 정렬함

