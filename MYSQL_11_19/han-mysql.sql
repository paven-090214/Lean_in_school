-- "�����ͺ��̽�����", �迬��, �Ѻ�, ch07
-- (MySQL)
-- handb �����ͺ��̽� ������ ���, �����ͺ��̽� ����
drop database if exists handb;

-- ���� 7�� ��Ű�� ����
CREATE DATABASE `handb` 
  default character set utf8mb4;

-- ����� �����ͺ��̽� ����
use handb;

DROP TABLE if exists �ֹ�;
DROP TABLE if exists ��;
DROP TABLE if exists ��ǰ;

-- ��(�����̵�, ���̸�, ����, ���, ����, ������)
-- ��ǰ(��ǰ��ȣ, ��ǰ��, ���, �ܰ�, ������ü)
-- �ֹ�(�ֹ���ȣ, �ֹ���, �ֹ���ǰ, ����, �����, �ֹ�����)

CREATE TABLE �� (
	�����̵�  VARCHAR(20)	NOT NULL,
	���̸�    VARCHAR(10),
	����         INT,
	���         VARCHAR(10)	NOT NULL,
	����         VARCHAR(20),
	������      INT	            DEFAULT 0,
	PRIMARY KEY(�����̵�)
);

CREATE TABLE ��ǰ (
	��ǰ��ȣ    CHAR(3)	NOT NULL,
	��ǰ��       VARCHAR(20),
	���       INT,
	�ܰ�         INT,
	������ü    VARCHAR(20),
	PRIMARY KEY(��ǰ��ȣ)
	-- CHECK (��� >= 0 AND ��� <= 10000)
);

CREATE TABLE �ֹ� (
	�ֹ���ȣ    CHAR(3)	NOT NULL,
	�ֹ���    VARCHAR(20),
	�ֹ���ǰ    CHAR(3),
	����         INT,
	�����      VARCHAR(30),
	�ֹ�����    DATE,
	PRIMARY KEY(�ֹ���ȣ),
	FOREIGN KEY(�ֹ���) REFERENCES ��(�����̵�),
	FOREIGN KEY(�ֹ���ǰ) REFERENCES ��ǰ(��ǰ��ȣ)
);

--  ��(�����̵�, ���̸�, ����, ���, ����, ������)
INSERT INTO �� VALUES ('apple', '����ȭ', 20, 'gold', '�л�', 1000);
INSERT INTO �� VALUES ('banana', '�輱��', 25, 'vip', '��ȣ��', 2500);
INSERT INTO �� VALUES ('carrot', '���', 28, 'gold', '����', 4500);
INSERT INTO �� VALUES ('orange', '����', 22, 'silver', '�л�', 0);
INSERT INTO �� VALUES ('melon', '������', 35, 'gold', 'ȸ���', 5000);
INSERT INTO �� VALUES ('pear', 'ä����', 31, 'silver', 'ȸ���', 500);
INSERT INTO �� VALUES ('peach', '������', NULL, 'silver', '�ǻ�', 300);

--  ��ǰ(��ǰ��ȣ, ��ǰ��, ���, �ܰ�, ������ü)
INSERT INTO ��ǰ VALUES ('p01', '�׳ɸ���', 5000, 4500, '���ѽ�ǰ');
INSERT INTO ��ǰ VALUES ('p02', '�ſ��̸�', 2500, 5500, '�α�Ǫ��');
INSERT INTO ��ǰ VALUES ('p03', '��������', 3600, 2600, '�Ѻ�����');
INSERT INTO ��ǰ VALUES ('p04', '�������ݷ�', 1250, 2500, '�Ѻ�����');
INSERT INTO ��ǰ VALUES ('p05', '��ū���', 2200, 1200, '���ѽ�ǰ');
INSERT INTO ��ǰ VALUES ('p06', '����쵿', 1000, 1550, '�α�Ǫ��');
INSERT INTO ��ǰ VALUES ('p07', '���޺���', 1650, 1500, '�Ѻ�����');

--  �ֹ�(�ֹ���ȣ, �ֹ���, �ֹ���ǰ, ����, �����, �ֹ�����)
INSERT INTO �ֹ� VALUES ('o01', 'apple', 'p03', 10, '����� ������', '13/01/01');
INSERT INTO �ֹ� VALUES ('o02', 'melon', 'p01', 5, '��õ�� ��籸', '13/01/10');
INSERT INTO �ֹ� VALUES ('o03', 'banana', 'p06', 45, '��⵵ ��õ��', '13/01/11');
INSERT INTO �ֹ� VALUES ('o04', 'carrot', 'p02', 8, '�λ�� ������', '13/02/01');
INSERT INTO �ֹ� VALUES ('o05', 'melon', 'p06', 36, '��⵵ ���ν�', '13/02/20');
INSERT INTO �ֹ� VALUES ('o06', 'banana', 'p01', 19, '��û�ϵ� ������', '13/03/02');
INSERT INTO �ֹ� VALUES ('o07', 'apple', 'p03', 22, '����� ��������', '13/03/15');
INSERT INTO �ֹ� VALUES ('o08', 'pear', 'p02', 50, '������ ��õ��', '13/04/10');
INSERT INTO �ֹ� VALUES ('o09', 'banana', 'p04', 15, '���󳲵� ������', '13/04/11');
INSERT INTO �ֹ� VALUES ('o10', 'carrot', 'p03', 20, '��⵵ �Ⱦ��', '13/05/22');

--  ��(�����̵�, ���̸�, ����, ���, ����, ������)
--  ��ǰ(��ǰ��ȣ, ��ǰ��, ���, �ܰ�, ������ü)
--  �ֹ�(�ֹ���ȣ, �ֹ���, �ֹ���ǰ, ����, �����, �ֹ�����)

select * from ��;
select * from ��ǰ;
select * from �ֹ�;
