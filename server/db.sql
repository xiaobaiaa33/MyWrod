SET NAMES UTF8
DROP DATABASE IF EXISTS world
CREATE DATABASE world CHARSET = UTF8
USE world

-- 元素表
CREATE TABLE Element (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(16),
    name VARCHAR(16),
    imgUrl VARCHAR(256),
    isShow TINYINT
);

INSERT INTO Element VALUES(NULL,"自然元素","火","",1);
INSERT INTO Element VALUES(NULL,"自然元素","水","",1);
INSERT INTO Element VALUES(NULL,"自然元素","土","",1);
INSERT INTO Element VALUES(NULL,"自然元素","气","",1);
INSERT INTO Element VALUES(NULL,"自然元素","雾","",0);