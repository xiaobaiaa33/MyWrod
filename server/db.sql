SET NAMES UTF8
DROP DATABASE IF EXISTS world
CREATE DATABASE world CHARSET = UTF8
USE world

-- 元素表
CREATE TABLE element (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(16),
    name VARCHAR(16),
    img_url VARCHAR(256),
    is_show TINYINT
);

INSERT INTO element VALUES(NULL,"自然元素","火","",1);
INSERT INTO element VALUES(NULL,"自然元素","水","",1);
INSERT INTO element VALUES(NULL,"自然元素","土","",1);
INSERT INTO element VALUES(NULL,"自然元素","气","",1);
INSERT INTO element VALUES(NULL,"自然元素","雾","",0);
INSERT INTO element VALUES(NULL,"自然元素","闪电","",0);
INSERT INTO element VALUES(NULL,"植物","花","",0);

-- 合成表
CREATE TABLE compound (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_element VARCHAR(16),
    second_element VARCHAR(16),
    composition VARCHAR(16)
);
INSERT INTO compound VALUES(NULL,"气","火","闪电");
INSERT INTO compound VALUES(NULL,"气","水","雾");
INSERT INTO compound VALUES(NULL,"土","火","岩石");
INSERT INTO compound VALUES(NULL,"土","水","泥");