-- 10주차 실습 퀴즈 - 1
drop table if exists fruit;

create table fruit (
    과일번호     int      NOT NULL AUTO_INCREMENT  ,
    과일이름     varchar(30) ,
    가격           int,
    색상           varchar(20) ,
    원산지        varchar(30) , 
    PRIMARY KEY(과일번호)
);

insert into fruit(과일이름,가격,색상,원산지) values('사과',2000,'빨간색','한국');
insert into fruit(과일이름,가격,색상,원산지)  values('배',5000,'노란색','한국');
insert into fruit(과일이름,가격,색상,원산지)  values('바나나',1500,'노란색','인도네시아');
insert into fruit(과일이름,가격,색상,원산지)  values('키위',4000,'초록색','호주');
insert into fruit(과일이름,가격,색상,원산지)  values('수박',8000,'초록색','한국');

select * from fruit;

-- 노란색 과일의 이름, 색상을 검색하라.
select 과일이름, 색상
from fruit;

-- 과일이름을 오름차순으로 정렬하여 모든 필드를 검색하라
select *
from fruit
order by 과일이름 ASC;

-- 가격이 5000 이하인 빨간색 과일의 이름을 검색하라
select 과일이름
from fruit
where 가격 <= 5000 and 색상 = '빨간색';

--  가격이 2000 ~ 5000 사이의 과일이름과 가격, 원산지를 검색하라(BETWEEN AND)
select 과일이름, 가격, 원산지
from fruit
where 가격 between 2000 and 5000;

-- 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(IN 사용)
select 과일이름, 색상
from fruit
where 색상 in('노란색', '초록색');

-- 색상이 노란색이거나 초록색인 과일이름, 색상을 검색하라(논리연산자 OR 사용)
select 과일이름, 색상
from fruit
where 색상='노란색' or 색상 ='초록색';

-- 원산지가 한국이 아닌 과일이름, 원산지를 검색하라
select 과일이름, 원산지
from fruit
where 원산지 != '한국';

