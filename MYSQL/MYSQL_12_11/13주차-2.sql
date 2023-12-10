DROP TABLE takes; 
DROP TABLE class; 
DROP TABLE professor; 
DROP TABLE course; 
DROP TABLE student;
DROP TABLE department;
 
CREATE TABLE department ( 
	dept_id            varchar(10)  NOT NULL ,
	dept_name       varchar(24)  NOT NULL ,
	office               varchar(10) ,
        CONSTRAINT pk_department PRIMARY KEY(dept_id)
);
insert into department values('920','컴퓨터공학과','201호');
insert into department values('923','산업공학과','207호');
insert into department values('925','전자공학과','308호');


CREATE TABLE student( 
	stu_id               varchar(10)  NOT NULL ,
	resident_id          varchar(14)  NOT NULL ,
	name                 varchar(20)  NOT NULL ,
	year                 int  ,
	address              varchar(10) ,
	dept_id              varchar(10)  NOT NULL ,
        CONSTRAINT pk_student PRIMARY KEY(stu_id) ,
        CONSTRAINT fk_student FOREIGN KEY (dept_id) 
                     REFERENCES department(dept_id)
);

insert into student values('1292001','900424-1825409','김광식',3,'서울','920');
insert into student values('1292002','900305-1730021','김정현',3,'서울','920');
insert into student values('1292003','891021-2308302','김현정',4,'대전','920');
insert into student values('1292301','890902-2704012','김현정',2,'대구','923');
insert into student values('1292303','910715-1524390','박광수',3,'광주','923');
insert into student values('1292305','921011-1809003','김우주',4,'부산','923');
insert into student values('1292501','900825-1506390','박철수',3,'대전','925');
insert into student values('1292502','911011-1809003','백태성',3,'서울','925');

CREATE TABLE professor( 
	prof_id              varchar(10)  NOT NULL ,
	resident_id          varchar(14)  NOT NULL ,
	name                 varchar(20)  NOT NULL ,
	dept_id              varchar(10)  NOT NULL ,
	position             varchar(10)   ,
	year_emp             int   ,
        CONSTRAINT pk_professor PRIMARY KEY(prof_id) ,
        CONSTRAINT fk_professor FOREIGN KEY (dept_id) 
                        REFERENCES department(dept_id)
);

insert into professor values('92001','590327-1839240','이태규','920','교수',1997);
insert into professor values('92002','690702-1350026','고희석','920','부교수',2003);
insert into professor values('92301','741011-2765501','최성희','923','부교수',2005);
insert into professor values('92302','750728-1102458','김태석','923','교수',1999);
insert into professor values('92501','620505-1400546','박철재','925','조교수',2007);
insert into professor values('92502','740101-1830264','장민석','925','부교수',2005);

CREATE TABLE course( 
	course_id            varchar(10)  NOT NULL ,
	title                varchar(24)  NOT NULL ,
	credit               int  ,
        CONSTRAINT pk_course PRIMARY KEY(course_id)
);

insert into course values('C101','전산개론',3);
insert into course values('C102','자료구조',3);
insert into course values('C103','데이터베이스',4);
insert into course values('C301','운영체제',3);
insert into course values('C302','컴퓨터구조',3);
insert into course values('C303','이산수학',4);
insert into course values('C304','객체지향언어',4);
insert into course values('C501','인공지능',3);
insert into course values('C502','알고리즘',2);

CREATE TABLE class( 
	class_id             varchar(10)  NOT NULL ,
	course_id            varchar(10)  NOT NULL ,
	year                 int  ,
	semester             int  ,
	division             CHAR(1) ,
	prof_id              varchar(10)  NOT NULL ,
	classroom            varchar(9)  ,
	enroll               int  ,
        CONSTRAINT pk_class PRIMARY KEY(class_id) ,
        CONSTRAINT fk_class1 FOREIGN KEY (course_id) 
                        REFERENCES course(course_id),
        CONSTRAINT fk_class2 FOREIGN KEY (prof_id) 
                        REFERENCES professor(prof_id)
);

insert into class values('C101-01','C101',2012,1,'A','92301','301호',40);
insert into class values('C102-01','C102',2012,1,'A','92001','209호',30);
insert into class values('C103-01','C103',2012,1,'A','92501','208호',30);
insert into class values('C103-02','C103',2012,1,'B','92301','301호',30);
insert into class values('C501-01','C501',2012,1,'A','92501','103호',45);
insert into class values('C501-02','C501',2012,1,'B','92502','204호',25);
insert into class values('C301-01','C301',2012,2,'A','92502','301호',30);
insert into class values('C302-01','C302',2012,2,'A','92501','209호',45);
insert into class values('C502-01','C502',2012,2,'A','92001','209호',30);
insert into class values('C502-02','C502',2012,2,'B','92301','103호',26);

CREATE TABLE takes( 
	stu_id               varchar(10)  NOT NULL ,
	class_id             varchar(10)  NOT NULL ,
	grade                CHAR(5) ,
        CONSTRAINT pk_takes PRIMARY KEY(stu_id, class_id),
        CONSTRAINT fk_takes1 FOREIGN KEY (stu_id) 
                        REFERENCES student(stu_id) ,
        CONSTRAINT fk_takes2 FOREIGN KEY (class_id) 
                        REFERENCES class(class_id)
);

insert into takes values('1292001','C101-01','B+');
insert into takes values('1292001','C103-01','A+');
insert into takes values('1292001','C301-01','A');
insert into takes values('1292002','C102-01','A');
insert into takes values('1292002','C103-01','B+');
insert into takes values('1292002','C502-01','C+');
insert into takes values('1292003','C103-02','B');
insert into takes values('1292003','C501-02','A+');
insert into takes values('1292301','C102-01','C+');
insert into takes values('1292303','C102-01','C');
insert into takes values('1292303','C103-02','B+');
insert into takes values('1292303','C501-01','A+');

select * from department;
select * from student;
select * from professor;
select * from course;
select * from class;
select * from takes;

-- 질의21) student 테이블에서 주소를 검색하라
select address
from student;
-- 질의22) student 테이블에서 주소를 검색하라(중복 제거)
select distinct address
from student;
-- 질의23) student 테이블에서 모든 필드를 검색하라
select *
from student;
-- 질의24) professor 테이블에서 교수이름, 재직연수를 검색하라(현재연도 - 임용년도)
select name, year_emp
from professor;
-- 질의27) student 테이블에서 3, 4학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 오름차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라
select name, stu_id
from student
where year between 3 and 4
order by name, stu_id;
-- 질의28) student 테이블에서 3, 4학년 학생들의 이름과 학번을 검색하라
-- 단, 학생이름의 내림차순 정렬하고, 같은 이름은 학번의 오름차순 정렬하라
select name, stu_id
from student
where year between 3 and 4
order by name desc, stu_id;
-- 질의33) 교수이름,직위, 재직연수를 검색하는데, 필드명 이름, 직위, 재직연수로 출력하라
select name as 이름, position as 직위, year_emp as 재직연수
from professor;
-- 질의34) student 테이블에서 김씨 성을 가진 학생을 검색하라
select *
from student
where name like '김%';
-- 질의35) 여학생들만을 검색하라(주민등록번호 뒷자리가 2로 시작하는 학생)
select *
from student
where resident_id like '%2';
-- 질의20) 학생이름, 학과명을 검색하라
--  방법1) SELECT … FROM … WHERE            방법2) SELECT … FROM … ON
select s.name, d.dept_name
from student s, department d
where s.dept_id = d.dept_id;

select s.name, d.dept_name
from student s
join department d on s.dept_id = d.dept_id;
-- 질의25) 학생이름, 학번, 소속학과명을 검색하라
select s.name, s.stu_id, d.dept_name
from student s
join department d on s.dept_id = d.dept_id;
-- 질의26) 컴퓨터공학과 2학년 학생들의 학번을 검색하라
select s.stu_id
from student s
join department d on s.dept_id = d.dept_id
where d.dept_name ='컴퓨터공학과' and s.year =2;
-- 질의30) student 테이블과 department 테이블을 조인하여 학생이름, 소속학과이름을 검색
-- 단, student 테이블은 s로, department 테이블은 d 로 재명명하라
select s.name, d.dept_name
from student s
join department d on s.dept_id = d.dept_id;
-- 질의31) student 테이블에서 김광식 학생과 주소가 같은 학생이름을 검색하라
select name, address
from student
where address = (select address
			from student
			where name='김광식');
-- 질의36) student 테이블의 학생이름과 professor 테이블의 교수이름을 합집합하라
select s.name, p.name
from student s
join professor p on s.dept_id = p.dept_id;
-- 질의40) 컴퓨터공학과 학생들 중에서 교과목에 상관없이 학점을 A+ 받은 학생의 학번검색
select t.stu_id, d.dept_name, s.name, t.grade
from takes t
join student s on s.stu_id = t.stu_id
join department d on s.dept_id = d.dept_id
where dept_name = '컴퓨터공학과' and t.grade='A+';
-- 질의41) 산업공학과 학생들 중에서 한번도 A+ 를 받지 못한 학생들의 학번을 검색하라
select t.stu_id, d.dept_name, t.grade
from takes t
join student s on s.stu_id = t.stu_id
join department d on d.dept_id = s.dept_id
where d.dept_name ='산업공학과' and t.grade !='A+';
-- 질의42) 모든 교과목들에 대해 교과목명, 학점수, 개설연도, 개설학기를 검색하라
select c.title, c.credit, cl.year, cl.semester
from course c
join class cl on c.course_id = cl.course_id;
-- 질의48) student 테이블에서 2학년 학생이 몇 명인지 검색하라
-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라
-- 질의49) student 테이블에서 dept_id 필드에 값이 몇 개인지 검색하라(중복 제거)
-- 질의50) 컴퓨터공학과의 학생 수를 검색하라
-- 질의51) 전체교수들의 재직연수 합을 구하라
-- 질의55) 전체 교수의 평균 재직연수를 출력하라
select m1.이름 선수명, m2.이름 멘토명
from 멘토 m1
left outer join 멘토 m2 on m1.멘토번호 =  m2.선수번호
where m2.이름 is not null;