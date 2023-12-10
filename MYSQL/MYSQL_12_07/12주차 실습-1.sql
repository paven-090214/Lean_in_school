-- 12주차 실습-1

drop table if exists employee;
drop table if exists department;

CREATE TABLE department (
     deptno              int          NOT NULL ,
     deptname          varchar(10) ,
     floor                 int ,
     PRIMARY KEY(deptno)
);
 
INSERT INTO department VALUES(1, '영업', 8);
INSERT INTO department VALUES(2, '기획', 10);
INSERT INTO department VALUES(3, '개발', 9);
INSERT INTO department VALUES(4, '총무', 7);

CREATE TABLE employee (
    empno	         int	              NOT NULL,
    empname     varchar(10)     UNIQUE,
    title	         varchar(10)     DEFAULT '사원',
    manager       int  ,
    salary            int	 ,
    dno              int	 ,
    PRIMARY KEY(empno),
    FOREIGN KEY(dno) REFERENCES department(deptno)
);

INSERT INTO employee VALUES(2106, '김창섭','대리',1003, 2500000, 2);
INSERT INTO employee VALUES(3426, '박영권','과장',4377, 3000000, 1);
INSERT INTO employee VALUES(3011, '이수민','부장',4377, 4000000, 3);
INSERT INTO employee VALUES(1003, '조민희','과장',4377, 3000000, 2);
INSERT INTO employee VALUES(3427, '최종철','사원',3011, 1500000, 3);
INSERT INTO employee VALUES(1365, '김상원','사원',3426, 1500000, 1);
INSERT INTO employee(empno, empname, title, salary, dno) VALUES(4377, '이성래','이사', 5000000, 2);

select * from department;
select * from employee;

-- 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION)
select dno
from employee
where empname = '김창섭'
UNION
select deptno
from department;

-- 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION ALL)
select dno
from employee
where empname = '김창섭'
union all
select deptno
from department;

-- 사원의 이름과 이 사원이 속한 부서이름을 검색하라 (조인)
select e.empname, d.deptname
from employee e
join department d on e.dno = d.deptno;

-- 사원에 대해서 사원이름과 직속상사의 이름을 검색하라
select e1.empname, e2.empname
from employee e1
join employee e2 on e1.empname = e2.empname;

-- 사원에 대해서 부서이름, 사원이름, 직급, 급여를 검색하라.
-- 부서이름에 대해서 오름차순, 부서이름이 같을 경우에는 salary에 대해서 내림차순으로 정렬하라
select e.empname, e.title, e.salary, d.deptname
from employee e
join department d on e.dno = d.deptno
order by d.deptname, salary DESC;

