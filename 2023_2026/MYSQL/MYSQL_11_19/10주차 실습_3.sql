-- 10주차 실습 퀴즈 - 2
drop table if exists 고객;
drop table 고객;

create table 고객 (
    고객아이디  varchar(8)      NOT NULL  ,
    고객이름     varchar(20)    NOT NULL  ,
    나이           int ,
    등급           varchar(10) ,
    직업           varchar(20) , 
    적립금        int                DEFAULT 0 ,
    PRIMARY KEY(고객아이디)
);

-- 고객(고객아이디,고객이름,나이,등급,직업,적립금)
insert into 고객 values('apple','정소화',20,'gold','학생',1000);
insert into 고객 values('banana','김선우',25,'vip','간호사',2500);
insert into 고객 values('carrot','고명석',28,'gold','교사',4500);
insert into 고객 values('orange','김용축',22,'silver','학생',NULL);
insert into 고객 values('melon','성원용',35,'gold','회사원',5000);
insert into 고객 values('peach','오형준',NULL,'silver','의사',300);
insert into 고객 values('pear','채광주',31,'silver','회사원',500);

select * from 고객;

-- 직업이 학생, 간호사, 교사인 고객의 이름, 직업, 등급을 검색
select 고객이름, 직업, 등급
from 고객
where 직업 in('학생', '간호사','교사');

-- 적립금이 300 이상인 고객 중에서 나이를 알 수 없는 고객아이디, 나이, 적립금을 검색하라
select 고객아이디, 나이, 적립금
from 고객
where 적립금 >= 300 and 나이 is null;

-- 등급이 gold인 고객 중에서 고객아이디, 등급, 적립금을 검색하라.  
-- 단, 등급을 오름차순 정렬하고 등급이 같으면 적립금의 내림차순 정렬하라
select 고객아이디, 등급, 적립금
from 고객
where 등급 = 'gold'
order by 등급 asc, 적립금 desc;

-- 등급별 적립급 평균을 검색하라, 
-- (단, 적립금 평균이 1000원 이상인 등급에 대해 검색)
select 등급, avg(적립금)
from 고객
group by 등급
having avg(적립금)>= 1000;

