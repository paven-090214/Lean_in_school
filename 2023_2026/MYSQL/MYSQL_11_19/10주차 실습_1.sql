-- 10주차 데이터베이스 실습
CREATE TABLE 성적( 이름 varchar(9) NOT NULL primary key, 점수 int );

INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '홍길동', 87 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '임꺽정', 60 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '박찬호', 75 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '선동열', 70 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '홍명보', 90 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '차범근', 75 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '강성범', 68 ); INSERT INTO 성적 ( 이름, 점수 ) VALUES ( '신동엽', null);
drop table 성적2;
CREATE TABLE 성적2 ( 이름 varchar(9) NOT NULL primary key , 과목 varchar(8), 점수 int );
INSERT INTO 성적2 VALUES ('홍길동', '영어',87 ); INSERT INTO 성적2 VALUES ('임꺽정', '수학',60 ); INSERT INTO 성적2 VALUES ('박찬호', '국어',75 ); INSERT INTO 성적2 VALUES ('선동열', '영어',70 ); INSERT INTO 성적2 VALUES ('홍명보', '수학',90 ); INSERT INTO 성적2 VALUES ('차범근', '수학',75 ); INSERT INTO 성적2 VALUES ('강성범', '수학',68 ); INSERT INTO 성적2 VALUES ('신동엽', '영어',null);

-- 최고점수, 최저, 평균, 점수 합계
select max(점수) as 최고점수
from 성적;

select min(점수)
from 성적;

select avg(점수)
from 성적;

select sum(점수)
from 성적;

-- 모든 학생 수
select count(*) as "학생 수"
from 성적;

-- count(*) => null을 포함하여 계산, count(필드명) => null을 제외하고 계산
-- 각 과목의 수
select count(distinct 과목)
from 성적2;
-- 과목별 수강생의 수
select 과목, count(점수) as '학생 수'
from 성적2
group by 과목;
-- 과목별 평균
select 과목, avg(점수)
from 성적2
group by 과목;

-- 과목별 평균 점수가 75점 보다 높은 학생의 과목별 평균 점수
select 과목, avg(점수)
from 성적2
group by 과목
having avg(점수) > 75;