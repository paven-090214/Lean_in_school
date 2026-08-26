# SQL

```mysql
CREATE DATABASE jsp_db DEFAULT CHARACTER SET utf8mb4;
USE jsp_db;

DROP TABLE members;
DROP TABLE board;

CREATE TABLE members (
    id VARCHAR(10) NOT NULL,
    pass VARCHAR(10) NOT NULL,
    name VARCHAR(30) NOT NULL,
    regidate DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    );
    
ALTER TABLE members
ADD CONSTRAINT members_pk PRIMARY KEY(id);

CREATE TABLE board (
    brd_id INT AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    id VARCHAR(10) NOT NULL,
    regdata DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (brd_id),
    CONSTRAINT board_members_fk FOREIGN KEY (id)
        REFERENCES members(id)
);

INSERT INTO members (id, pass, name)
VALUES
('hong', '1111', '홍길동'),
('kim', '2222', '김철수'),
('lee', '3333', '이영희');

INSERT INTO board (title, content, id)
VALUES
('첫 번째 게시글입니다', '안녕하세요. 첫 번째 게시글 내용입니다.', 'hong'),
('오늘 공부한 내용', '오늘은 JSP와 MySQL 연결 방법을 공부했습니다.', 'kim'),
('게시판 테스트', '게시판 글 작성 기능을 테스트하는 중입니다.', 'lee'),
('공지사항', '이번 주 수업 일정에 대한 공지입니다.', 'hong'),
('질문 있습니다', '데이터베이스 외래키 설정에 대해 질문이 있습니다.', 'kim'),
('MySQL 연습', 'CREATE TABLE과 INSERT 문을 연습하고 있습니다.', 'lee'),
('JDBC 연결 성공', 'Java에서 MySQL 데이터베이스 연결에 성공했습니다.', 'hong'),
('마지막 테스트 글', '게시판 목록 출력 테스트용 글입니다.', 'kim');
-- INSERT INTO board (title, content, id)
-- VALUES ('제목입니다', '내용입니다', 'musthave');

select * from members;

```
