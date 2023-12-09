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
insert into fruit(과일이름,가격,색상,원산지) values('배',5000,'노란색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('바나나',1500,'노란색','인도네시아');
insert into fruit(과일이름,가격,색상,원산지) values('키위',4000,'초록색','호주');
insert into fruit(과일이름,가격,색상,원산지) values('수박',8000,'초록색','한국');

insert into fruit(과일이름,가격,색상,원산지) values('오렌지',1000,'주황색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('망고',5000,'노란색','페루');
insert into fruit(과일이름,가격,색상,원산지) values('체리',4800,'빨간색','중국');
insert into fruit(과일이름,가격,색상,원산지) values('포도',2500,'보라색','한국');
insert into fruit(과일이름,가격,색상,원산지) values('아보카도',2000,'초록색','남아프리카');
insert into fruit(과일이름,가격,색상,원산지) values('레몬',6000,'노란색','미국');
insert into fruit(과일이름,가격,색상,원산지) values('모과',5000,'노란색', NULL);

select * from fruit;

SELECT 과일이름, 색상
FROM fruit
WHERE 색상='노란색';

SELECT *
FROM fruit
ORDER BY 과일이름 ASC;

SELECT 과일이름, 가격, 색상
FROM fruit
WHERE 가격 <= 5000 and 색상 ='빨간색';

SELECT 과일이름, 가격, 원산지
FROM fruit
WHERE 가격 BETWEEN 2000 AND 5000;

SELECT 과일이름, 색상
FROM fruit
WHERE 색상 IN('노란색','초록색');

SELECT 과일이름, 색상
FROM fruit
WHERE 색상 ='노란색' OR 색상 = '초록색';

SELECT 과일이름, 원산지
FROM fruit
WHERE 원산지 != '한국';

UPDATE fruit
SET 가격 = 4000
WHERE 과일이름 = '사과';

DELETE fruit
WHERE 원산지 = '호주';

SELECT 과일이름, 원산지
FROM fruit
WHERE 원산지 IS NULL;

SELECT *
FROM   fruit
ORDER BY 가격 DESC, 원산지 ASC;

SELECT 과일이름, 원산지
FROM fruit
WHERE 원산지 like '%국';

SELECT 과일이름, 원산지
FROM fruit
WHERE 원산지 LIKE '인%';

-- GROUP by, COUNT 중요
SELECT 원산지, COUNT(원산지) AS 개수
FROM fruit
GROUP BY 원산지;

-- HVING 시험 출제 X
select 색상, COUNT(*) AS 개수
FROM fruit
GROUP BY 색상
HAVING count(*) >= 3;
-- ORDER BY COUNT(*) DESC; 조건에 순차 추가

