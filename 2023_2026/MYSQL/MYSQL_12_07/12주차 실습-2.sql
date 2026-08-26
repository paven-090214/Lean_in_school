-- 12주차 실습-2
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

-- 부서의 모든 필드를 검색하라
select *
from department;

-- 부서의 부서번호와 부서이름을 검색하라 (deptno는 부서번호, deptname은 부서이름 으로 검색)
select deptno, deptname
from department;

-- 사원의 직급을 검색하라
select empname, title
from employee;

-- 사원의 직급을 한번씩만 검색하라 (중복제거) (DISTINCT)
select distinct title
from employee;

-- 2번 부서에 근무하는 사원들에 관한 모든 정보를 검색하라
select *
from employee
where dno = 2;

-- 이씨 성을 가진 사원들의 이름, 직급, 부서번호를 검색하라
select empname, title, dno
from employee
where empname like '이%';

-- 직급이 과장이면서 1번 부서에서 근무하는 사원들의 이름과 급여를 검색하라
select empname, salary
from employee
where title ='과장' and dno = 1;

-- 직급이 과장이면서 1번 부서에 속하지 않은 사원들의 이름과 급여를 검색하라
select empname, salary
from employee
where title ='과장' and dno != 1;

-- 9) 급여가 3000000원 이상이고, 4500000원 이하인 사원의 이름, 직급, 급여를 검색하라
select empname, title, salary
from employee
where salary >= 3000000 and salary<= 4500000;

-- BEWTEEN … AND 사용select empname, title, salary
select empname, title, salary
from employee
where salary between 3000000 and 4500000;

-- 1번 부서나 3번 부서에 소속된 사원들에 관한 모든 정보를 검색하라 (IN 사용)
select *
from employee
where dno in(1, 3);

-- 직급이 과장인 사원들에 대하여 이름, 현재급여, 급여가 10% 인상됐을 때의 값을 검색하라
select empname, salary, salary*1.1 as '급여가 10% 인상'
from employee
where title ='과장';

-- 2번 부서에 근무하는 사원들의 급여, 직급, 이름을 검색하여 급여의 오름차순으로 정렬하라
select salary, title, empname
from employee
where dno =2 
order by salary ;

-- 사원들의 평균 급여와 최대급여를 검색하라
select avg(salary), max(salary)
from employee;

-- 사원들이 속한 부서번호별로 그룹화하고 부서번호, 평균급여, 최대급여를 검색하라
select dno, avg(salary), max(salary)
from employee
group by dno;

-- 사원들이 속한 부서번호별로 그룹화하고, 평균급여가 2500000원 이상인
-- 부서에 대해서 부서번호, 평균급여, 최대급여를 검색하라
select dno, avg(salary), max(salary)
from employee
group by dno
having avg(salary) >= 2500000;

-- 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION)
select dno
from employee
where empname ='김창섭'
union
select deptno
from department;

-- 김창섭이 속한 부서번호와 부서의 모든 부서번호를 합집합으로 검색하라 (UNION ALL)
select dno
from employee
where empname ='김창섭'
union all
select deptno
from department;

-- 사원의 이름과 이 사원이 속한 부서이름을 검색하라 (조인)
select e.empname, d.deptname
from employee e
join department d on e.dno = d.deptno;

-- 19) 사원에 대해서 부서이름, 사원이름, 직급, 급여를 검색하라.
-- 부서이름에 대해서 오름차순, 부서이름이 같을 경우에는 salary에 대해서 내림차순으로 정렬하라
select d.deptname, e.empname, e.title, e.salary
from employee e
join department d on e.dno = d.deptno;
