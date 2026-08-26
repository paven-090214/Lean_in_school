CREATE TABLE 멘토 (

       선수번호         int              NOT NULL ,

       이름               varchar(10)    ,

       주소               varchar(50)  ,

       멘토번호         int             

);

ALTER TABLE 멘토

   ADD PRIMARY KEY (선수번호);

ALTER TABLE 멘토

   ADD FOREIGN KEY (멘토번호)

     REFERENCES 멘토  (선수번호);
     
-- 2. 데이터 입력

-- 멘토(선수번호, 이름, 주소, 멘토번호)

insert into 멘토 values(1,'박지성','영국 맨체스타',NULL);

insert into 멘토 values(4,'추신수','미국 클리블랜드',NULL);

insert into 멘토 values(3,'장미란','대한민국 강원도',4);

insert into 멘토 values(2,'김연아','대한민국 서울',3);  

select * from 멘토;

-- [Quiz] 선수명, 멘토명 을 검색하라(내부조인)
select m1.이름 as 선수명, m2.이름 as 멘토명
from 멘토 m1
join 멘토 m2 on m1.멘토번호 = m2.선수번호;
-- [Quiz] 모든 선수의 선수명, 멘토명 을 검색하라(외부조인)
select m1.이름 선수명, m2.이름 멘토명
from 멘토 m1
left outer join 멘토 m2 on m1.멘토번호 =  m2.선수번호
where m2.이름 is not null;

select m1.이름 선수명, m2.이름 멘토명
from 멘토 m1
right outer join 멘토 m2 on m1.멘토번호 = m2.선수번호
where m1.멘토번호 is not null;

