# W13

## 순위함수

### 급여가 높은 사원 검색
```mysql
SELECT
  eno,
  ename,
  deptid,
  sal,
  RANK() OVER(ORDER BY sal DESC) rank_result,
  DENSE_RANK() OVER(ORDER BY sal DESC) dense_result,
  ROW_NUMBER() OVER(ORDER BY sal DESC) rowNumber_result
FROM emp;
```

<img width="716" height="416" alt="image" src="https://github.com/user-attachments/assets/99007d20-cf8a-4bc8-9211-3d5f9d69d2a9" />
<img width="1085" height="304" alt="image" src="https://github.com/user-attachments/assets/f3cfc170-a686-4f7c-a7b3-ccdb42fef907" />

## 분석함수

### 그룹화(groub by)

EX
- 성별
- 학년별
- 학과별
- 부서

### 부서별 인원수 검색

```mysql
SELECT
  deptid,
  count(*)
FROM emp
GROUP BY deptid;
```

<img width="380" height="133" alt="image" src="https://github.com/user-attachments/assets/e16a3d26-ef8d-4a8d-9db9-9d2999edf602" />

### 부서별로 급여가 높은 사원 검색

```mysql
SELECT
  eno,
  ename,S
  deptid,
  sal,
  RANK() OVER(partition by deptid order by sal DESC) result
FROM emp;
```

<img width="415" height="418" alt="image" src="https://github.com/user-attachments/assets/e606fbd7-4f22-4fcf-8d47-357f41385432" />
<img width="811" height="293" alt="image" src="https://github.com/user-attachments/assets/bb75ed3a-aab4-4245-9e74-72e6be087491" />

### 개인별 총 점수를 검색

```mysql
SELECT
  sname,
  subject,
  score,
  result,
  RANK() OVER(group by sname) ORDER BY (DESC) result
FROM sqld;
```

## 재귀함수

```mysql
SELECT
  E.이름 as 사원명,
  M.이름 as 관리자명
FROM 사원 E, 사원 M
WHERE E.사원번호 =  M.관리사번;
```
<img width="1581" height="747" alt="image" src="https://github.com/user-attachments/assets/8ddb693d-3257-4758-a971-7b62505e0ea3" />

## 윈도우함수
