DROP TABLE if exists deptself;

/* deptself(deptno,dname,college,loc) */

CREATE TABLE deptself (

  deptno   char(3)       NOT NULL ,

  dname   varchar(30) NOT NULL ,

  college   char(3) ,

  loc         varchar(7) ,

  CONSTRAINT dept_no_pk PRIMARY KEY(deptno)

);

insert into deptself values ('101', '컴퓨터공학과', '100', '1호관');

insert into deptself values ('102', '멀티미디어학과', '100', '2호관');

insert into deptself values ('201', '전자공학과', '200', '3호관');

insert into deptself values ('202', '기계공학과', '200', '4호관');

insert into deptself values ('100', '정보미디어학부', '10', NULL);

insert into deptself values ('200', '메카트로닉스학부', '10', NULL);

insert into deptself values ('10',  '공과대학', NULL, NULL);

select * from deptself;

-- 1) 학부, 학과명을 검색하라(내부조인)
-- dname, dname 을 검색하라(내부조인)
select d1.college 학부, d2.dname 학과명
from deptself d1, deptself d2
where d1.deptno = d2.college;

select d1.college 학부, d2.dname 학과명
from deptself d1
inner join deptself d2 on d1.deptno = d2.college;
