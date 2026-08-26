DROP TABLE if exists pro;
DROP TABLE if exists stu;

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

CREATE TABLE pro (
    pno   char(2),
    pname varchar(20), 
    dept  varchar(20),
    page  int,
    primary key(pno)
);

CREATE TABLE stu (
    sno   char(2),
    sname varchar(20), 
    dept  varchar(20),
    sage  int,
    primary key(sno)
);

insert into pro values('p1','이정무','컴퓨터',36);
insert into pro values('p2','우태하','컴퓨터',32);
insert into pro values('p3','이성민','건축',45);

insert into stu values('s1','유준호','컴퓨터',23);
insert into stu values('s2','오정민','컴퓨터',34);
insert into stu values('s3','이태현','건축',22);
insert into stu values('s4','신현주','건축',21);

select * from pro;
select * from stu;
/* ======================================== 
	#서브쿼리: 하위질의
    s
    F
    W	(S
		F
        W		);
        
	S
    F
    W	IN (S
			F
            W		);
	
    
*/

-- 하위질의(sub query)

-- department(deptno, deptname, floor)
-- employee(empno, empname, title, manager, salary, dno)

select * from department;
select * from employee;

-- 20) 박영권과 같은 직급을 갖는 모든 사원들의 이름과 직급을 검색하라

-- 21) 영업부나 개발부에 근무하는 사원들의 이름을 검색하라(IN 사용)

-- 22) 영업부나 개발부에 근무하는 사원들의 이름을 검색하라(EXISTS 사용)
 
