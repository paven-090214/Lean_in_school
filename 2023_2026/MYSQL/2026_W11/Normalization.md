# Normalization (정규화) : 반복그룹제거

## 정의

데이터 중복을 최소화하기위해 테이블을 분리하는 과정

## 데이터 중복 발생 : 이상현상 발생 (Anomaly)

1. 삽입이상 / 입력이상 (insert anomaly)
2. 수정이상 / 갱신이상 (update anomaly)
3. 삭제이상(delete anomaly)

## 함수적 종속성

### X (결정자) -> Y (종속자)

EX). 학생(학번,학생명, 학년, 연락처)
  - 학번을 알고있다면 학생명을 알 수 있다.
  - 학생명을 알고있어도 학번을 알 수 없다.

## 정규형 (Normal Form / NF)

> 정보의 손실이 있으면 안된다.

### 제1 정규화 (1NF)

원자값 (atomic value)

### 제2 정규화 (2NF)

부분함수종속(partial function dependency) ->완전함수종속(full function dependency)

### 제3 정규화 (3NF) 

이행함수종속(transitive function dependency) 제거 : 키가 아닌 것에 종속 제거

```text
A -> B
B -> C
C -> A
```

결정자가 후보키이어야 한다.

### BCNF (보이스코드)

결정자가 후보키어야한다.

### 4NF, 5NF
