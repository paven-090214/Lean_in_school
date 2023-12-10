-- 12주차 실습 - 3
CREATE TABLE R1 (
        A char(2),
        B char(2)
);

CREATE TABLE S1 (
        A char(2),
        C char(2),
        D char(2)
);

INSERT INTO R1 VALUES ('1','4');
INSERT INTO R1 VALUES ('2','5');

INSERT INTO S1 VALUES ('1','3','4');
INSERT INTO S1 VALUES ('2','2','6');
INSERT INTO S1 VALUES ('3','1','9');

select * from r1;
select * from s1;

-- 1. 카티션 프로덕트
select *
from R1
cross join S1;

-- 2. 동등조인(equi join)
SELECT *
FROM r1, s1
WHERE r1.a = s1.a;

-- 3. 자연조인(natural join)
SELECT *
FROM R1 r, S1 s
WHERE r.A = s.A;

-- 4. 세타조인(theta join)
select *
from  R1, S1
where R1.A >= C;
