-- 11주차 조인 실습 - 2
drop table if exists freshman;
drop table if exists dmember;

CREATE TABLE freshman ( 
 name    VARCHAR(12) NOT NULL ,
 address VARCHAR(9)
);

CREATE TABLE dmember ( 
 name      VARCHAR(12) NOT NULL ,
 dept_name VARCHAR(30)
);

INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');

INSERT INTO dmember VALUES('김광식', '컴퓨터공학과');
INSERT INTO dmember VALUES('김현정', '산업공학과');
INSERT INTO dmember VALUES('이진영', '전자공학과');

SELECT * FROM freshman;
SELECT * FROM dmember;

-- 카티션 프로덕트 
select *
from freshman
cross join dmember;

-- 동등조인 where 사용
select *
from freshman, dmember
where freshman.name = dmember.name;

-- 동등조인 innerjoin on 사용
select *
from freshman
inner join dmember on freshman.name = dmember.name;

-- 자연조인 where 사용
select *
from freshman, dmember
where freshman.name = dmember.name;

-- 자연조인 natural join 사용
select *
from freshman
natural join dmember;

-- 왼쪽외부조인
select *
from freshman
left join dmember on freshman.name = dmember.name;

-- 오른쪽외부조인
select *
from freshman
right join dmember on freshman.name = dmember.name;
